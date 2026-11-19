# Results

Final **chromosome-level assembly** of *Takifugu ocellatus* (ocellated pufferfish)
from ~28x PacBio HiFi + ~30x Hi-C, via `sanger-tol/genomeassembly` v1.1.0.

## Primary assembly (chromosome-level)

| Metric | Contigs (hifiasm) | After Hi-C scaffolding (YaHS) |
|--------|-------------------|-------------------------------|
| Total length | 373.5 Mb (440 contigs) | **365.5 Mb (88 scaffolds)** |
| N50 | 4.38 Mb | **16.45 Mb** |
| Largest | 13.6 Mb | **29.2 Mb** |
| Chromosome-scale scaffolds (>=9 Mb) | - | **22** |

The 22 largest scaffolds (9.0 - 29.2 Mb) correspond to the **22 chromosomes** of the
*T. ocellatus* karyotype, and together hold the great majority of the genome. The
published reference is ~352 Mb in 22 chromosomes, closely matching this result.

![Chromosome-scale scaffolds](results/stats/chromosome_sizes.png)

## Hi-C contact map (primary)

A single strong diagonal with ~22 clear blocks and almost no off-diagonal signal =
correctly ordered/oriented scaffolds with few misjoins.

![Hi-C contact map](results/hic_map/hic_contact_map_hap1.png)

## Quality (Merqury, k-mer based)

| Metric | Value |
|--------|-------|
| Consensus QV (primary) | **58.8** (~99.9998% base accuracy) |
| QV (both haplotypes) | 59.3 |
| k-mer completeness (primary) | 89.7 % |
| k-mer completeness (primary + alternate) | **99.5 %** |

HiFi read-coverage distribution used by purge_dups (single clean diploid peak ~28x;
cutoffs 5 / 21 / 84):

![purge_dups coverage](results/assembly/purge_dups_coverage.png)

## Notes
- Reads were downsampled for a RAM-safe run on a shared 64 GB server
  (HiFi ~89x -> ~28x; Hi-C ~165x -> ~30x).
- BUSCO was **not run inside the pipeline**: on the fragmented *alternate* contigs
  its miniprot gene-aligner expanded into pathological multi-mapping and did not
  finish (a known issue for repetitive haplotigs). Genome completeness is instead
  reported via Merqury k-mer completeness above; a standalone BUSCO on the primary
  scaffolds can be added separately.
- Full per-file statistics are in `results/stats/`, `results/qc/`.
