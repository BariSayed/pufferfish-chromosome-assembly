#!/bin/bash
set -u
URL="$1"; OUT="$2"; NCONN="${3:-8}"; CHUNK=50000000
TMP="${OUT}.parts"; mkdir -p "$TMP"
SIZE=$(curl -sIL "$URL" | awk 'tolower($0) ~ /content-length/ {v=$2} END{gsub(/\r/,"",v); print v}')
N=$(( (SIZE + CHUNK - 1) / CHUNK ))
echo "[$OUT] size=$SIZE chunks=$N conn=$NCONN"
export URL TMP CHUNK SIZE
sumparts(){ find "$TMP" -name 'part_*' -printf '%s\n' | awk '{s+=$1} END{print s+0}'; }
for pass in $(seq 1 12); do
  seq 0 $((N-1)) | xargs -P "$NCONN" -I{} bash -c '
    i={}; start=$((i*CHUNK)); end=$((start+CHUNK-1)); [ $end -ge $SIZE ] && end=$((SIZE-1));
    f=$(printf "$TMP/part_%05d" $i); need=$((end-start+1));
    if [ -f "$f" ] && [ "$(stat -c%s "$f")" -eq "$need" ]; then exit 0; fi
    curl -s --retry 12 --retry-delay 3 -r ${start}-${end} "$URL" -o "$f"
  '
  TOT=$(sumparts); echo "[$OUT] pass $pass total=$TOT / $SIZE"
  [ "$TOT" -eq "$SIZE" ] && break
  sleep 5
done
TOT=$(sumparts)
[ "$TOT" -ne "$SIZE" ] && { echo "[$OUT] FAILED total=$TOT expected=$SIZE"; exit 1; }
cat $(ls -1 "$TMP"/part_* | sort) > "$OUT"
echo "[$OUT] assembled $(stat -c%s "$OUT")"; rm -rf "$TMP"
