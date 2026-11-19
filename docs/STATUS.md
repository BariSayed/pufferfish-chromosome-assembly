# Project Status

Live checklist for the *Takifugu ocellatus* chromosome-level assembly.

| Phase | Step | Status |
|-------|------|--------|
| 0 | Server readiness (32c/64GB/1.7TB, Apptainer, Nextflow 26.04) | done |
| 0 | Standardized project folder tree | done |
| 0 | Pipeline validation (`-profile test`, full hifiasm->Hi-C->YaHS chain) | done |
| 1 | Download HiFi reads (SRR22296349, 24 GB) | done, md5-verified |
| 1 | Download Hi-C reads (SRR22297330 R1 13 GB + R2 14 GB) | done, md5-verified |
| 1 | Read QC + downsample (HiFi ~35x, Hi-C ~30x) | in progress |
| 2 | Pipeline input YAMLs | pending |
| 2 | Assembly (hifiasm -> purge_dups -> YaHS scaffolding) | pending |
| 3 | Assembly stats (N50, #scaffolds, chromosome count) | pending |
| 3 | BUSCO completeness (actinopterygii_odb10) | pending |
| 3 | Hi-C contact map figure | pending |
| 4 | Private, standardized repository | maintained incrementally |

_Updated as the workflow progresses._
