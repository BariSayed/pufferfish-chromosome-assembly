# Project Status

| Phase | Step | Status |
|-------|------|--------|
| 0 | Server readiness (32c/64GB/1.7TB, Apptainer, Nextflow 26.04) | done |
| 0 | Standardized project folder tree | done |
| 0 | Pipeline validation (`-profile test`) | done |
| 1 | Download HiFi reads (SRR22296349, 24 GB) | done, md5-verified |
| 1 | Download Hi-C reads (SRR22297330, 27 GB) | done, md5-verified |
| 1 | Read QC + downsample (HiFi ~28x, Hi-C ~30x) | done |
| 2 | Pipeline input YAMLs | done |
| 2 | Assembly: hifiasm -> purge_dups -> YaHS scaffolding | **done** |
| 3 | Assembly stats (N50 16.45 Mb, 22 chromosomes) | **done** |
| 3 | Quality: Merqury QV 58.8, completeness 99.5% | **done** |
| 3 | Hi-C contact map | **done** |
| 3 | BUSCO (gene completeness) | skipped in-pipeline (miniprot issue on alt contigs); optional standalone |
| 4 | Private, standardized repository | maintained |

_Assembly complete — chromosome-level, 22 chromosome-scale scaffolds._
