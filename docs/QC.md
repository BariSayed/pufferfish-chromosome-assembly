# Read QC Summary

HiFi reads are confirmed high-accuracy CCS/HiFi (not CLR): **Q20 = 98.6%**,
**Q30 = 96.8%**, mean length ~16 kb, read N50 ~16.4 kb.

| Dataset | Reads | Bases | Coverage (352 Mb) |
|---------|-------|-------|-------------------|
| HiFi (raw) | 1.94 M | 31.2 Gb | ~89x |
| Hi-C (raw, R1+R2) | 2 x 194 M | 58.3 Gb | ~165x |
| HiFi (assembly input) | downsampled | ~9.9 Gb | **~28x** (RAM-safe) |
| Hi-C (assembly input) | downsampled, synced pairs | ~10.5 Gb | **~30x** |

Hi-C reads were converted to unaligned CRAM (`samtools import`), the format
required by the pipeline. See `results/qc/*.tsv` for the full seqkit tables.
