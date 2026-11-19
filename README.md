# Chromosome-level Genome Assembly — Ocellated Pufferfish (*Takifugu ocellatus*)

A reproducible, learning-oriented **chromosome-level genome assembly** of a small
vertebrate genome from **PacBio HiFi + Hi-C** reads, built with the
**[sanger-tol/genomeassembly](https://github.com/sanger-tol/genomeassembly)**
Nextflow pipeline on an institutional Linux server (Apptainer, no scheduler).

> **Status:** work in progress — see [`docs/STATUS.md`](docs/STATUS.md) for the live checklist.

---

## Rationale

*Takifugu ocellatus* (ocellated pufferfish) has one of the **smallest vertebrate
genomes** (~352 Mb, 22 chromosomes) and a published chromosome-level reference.
This makes it an ideal, compute-friendly target for learning the full HiFi + Hi-C
assembly workflow and for validating the result against a known reference.

## Data

Public reads from ENA, BioProject **PRJNA901637**:

| Type | Run | Platform | Bases | Role |
|------|-----|----------|-------|------|
| PacBio HiFi | `SRR22296349` | Sequel II | ~31 Gb (~78×) | contig construction |
| Hi-C (paired) | `SRR22297330` | HiSeq 2500 | ~58 Gb | long-range scaffolding |

Reads are **downsampled** (HiFi ~35×, Hi-C ~30×) before assembly to keep peak RAM
within the server budget and to shorten runtime.

## Pipeline

```
hifiasm (contigs)
   -> purge_dups (remove haplotypic duplicates)
   -> Hi-C mapping (bwa-mem2)
   -> YaHS scaffolding (to chromosome scale)
   -> evaluation: assembly stats, BUSCO (actinopterygii_odb10), Hi-C contact map
```

## Reproduce

See [`docs/METHODS.md`](docs/METHODS.md) for exact commands. In summary:

```bash
nextflow run sanger-tol/genomeassembly -r 1.1.0 -profile singularity \
  -c configs/sbau.config \
  --genomic_data configs/genomic_data.yaml \
  --assembly_specs configs/assembly_specs.yaml \
  --outdir results/assembly
```

## Repository layout

```
docs/      methods, status, notes
configs/   Nextflow config + pipeline input YAMLs
scripts/   data-download and helper scripts
logs/      run logs / Nextflow reports (text only)
results/   assembly stats, BUSCO summary, Hi-C contact map (small text/figures only)
```

Large FASTQ and assembly files are **not** committed (see [`.gitignore`](.gitignore));
they are fully reproducible from the ENA accessions listed above.

## Resource safety

A custom `configs/sbau.config` caps pipeline resources (`max_cpus ~= 24`,
`max_memory ~= 48 GB`) so a run never starves the shared 64 GB / 32-core server.

---

*Learning / portfolio project. The sequencing data belong to the original
submitters (ENA BioProject PRJNA901637); only code, configuration, and derived
summary results are distributed in this repository.*
