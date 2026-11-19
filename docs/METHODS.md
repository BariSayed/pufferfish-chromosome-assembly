# Methods

## Environment
- Server: Linux, 32 CPU, 64 GB RAM, Apptainer 1.1.9, Nextflow 26.04, no scheduler.
- All pipeline tools run in Apptainer (Singularity) containers pulled by Nextflow.

## 1. Data acquisition
Public reads from ENA (BioProject **PRJNA901637**), downloaded via parallel HTTP
range requests (`scripts/parallel_dl.sh`, ~8 connections) because single-stream
transfer from ENA is throttled. md5 checksums verified against the ENA manifest.

| Run | Type | File |
|-----|------|------|
| SRR22296349 | PacBio HiFi | `SRR22296349_subreads.fastq.gz` |
| SRR22297330 | Hi-C (paired) | `SRR22297330_1/2.fastq.gz` |

## 2. Read QC & downsampling
`seqkit stats -a` for read-length/quality profiles; HiFi downsampled to ~35×,
Hi-C to ~30× (`seqkit`) to keep hifiasm peak RAM within the 64 GB budget.

## 3. Assembly — sanger-tol/genomeassembly v1.1.0
Inputs: `configs/genomic_data.yaml` (datasets) + `configs/assembly_specs.yaml`
(what to build). Hi-C reads are provided as unaligned CRAM (pipeline requirement).

Stages: **hifiasm** (contigs) → **purge_dups** (remove haplotypic duplicates) →
Hi-C mapping (**bwa-mem2**) → **YaHS** scaffolding → **BUSCO** + stats + contact map.

Resource caps (custom `configs/sbau.config`): `max_cpus ≈ 24`, `max_memory ≈ 48 GB`
so the run never starves the shared server.

## 4. Evaluation
- Assembly metrics: total length, contig/scaffold N50, longest scaffold,
  number of chromosome-scale scaffolds (expected ≈ 22).
- BUSCO: `actinopterygii_odb10`.
- Hi-C contact map to visualise chromosome-scale blocks.
- Comparison against the published *T. ocellatus* reference (~352 Mb, 22 chr).

## Reproducibility notes
Large data are not committed; regenerate from the ENA accessions above with the
scripts and configs in this repository.
