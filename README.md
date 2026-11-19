# Chromosome-level Genome Assembly — Ocellated Pufferfish (*Takifugu ocellatus*)

A reproducible, learning-oriented **chromosome-level genome assembly** of a small
vertebrate genome from **PacBio HiFi + Hi-C** reads, built with the
**[sanger-tol/genomeassembly](https://github.com/sanger-tol/genomeassembly)**
Nextflow pipeline on an institutional Linux server (Apptainer, no scheduler).

> **Status:** 🚧 in progress — see `docs/STATUS.md` for the live checklist.

---

## English

### Why this organism
*Takifugu ocellatus* (ocellated pufferfish) has one of the **smallest vertebrate
genomes** (~352 Mb, 22 chromosomes) with a published chromosome-level reference,
making it an ideal, compute-friendly target for learning the full HiFi + Hi-C
assembly workflow.

### Data (public, ENA — BioProject PRJNA901637)
| Type | Run | Platform | Bases | Notes |
|------|-----|----------|-------|-------|
| PacBio HiFi | `SRR22296349` | Sequel II | ~31 Gb (~78×) | long reads for contigs |
| Hi-C | `SRR22297330` | HiSeq 2500 (paired) | ~58 Gb | long-range scaffolding |

Reads are **downsampled** (HiFi ~35×, Hi-C ~30×) before assembly to keep peak RAM
within the server budget and shorten runtime.

### Pipeline
`hifiasm` (contigs) → `purge_dups` (remove haplotypic duplicates) →
Hi-C mapping (`bwa-mem2`) → **`YaHS`** scaffolding (to chromosome scale) →
evaluation (assembly stats, **BUSCO** `actinopterygii_odb10`, Hi-C contact map).

### Reproduce
See `docs/METHODS.md` for exact commands. In short:
```bash
nextflow run sanger-tol/genomeassembly -r 1.1.0 -profile singularity \
  -c configs/sbau.config \
  --genomic_data configs/genomic_data.yaml \
  --assembly_specs configs/assembly_specs.yaml \
  --outdir results/assembly
```

### Repository layout
```
docs/      methods, status, notes
configs/   nextflow config + pipeline input YAMLs
scripts/   data-download & helper scripts
logs/      run logs / nextflow reports (text only)
results/   assembly stats, BUSCO, Hi-C contact map (small text/figures only)
```
Large FASTQ/assembly files are **not** committed (see `.gitignore`); they are
reproducible from the ENA accessions above.

---

## বাংলা (সংক্ষেপে)

এই repo-তে একটা **ছোট মাছের genome (পাফারফিশ, *Takifugu ocellatus*)**-কে
**PacBio HiFi + Hi-C** data দিয়ে **chromosome-level**-এ assemble করার সম্পূর্ণ,
পুনরুৎপাদনযোগ্য (reproducible) workflow রাখা আছে — শেখার উদ্দেশ্যে।

- **কেন এই মাছ:** vertebrate-দের মধ্যে অন্যতম ছোট genome (~৩৫২ Mb, ২২ chromosome),
  published reference আছে — তাই ছোট server-এও চালানো যায় এবং ফল মিলিয়ে দেখা যায়।
- **Data:** ENA থেকে public reads (BioProject PRJNA901637) — HiFi `SRR22296349`,
  Hi-C `SRR22297330`। assembly-র আগে RAM বাঁচাতে reads **downsample** করা হয়।
- **Pipeline:** `hifiasm` → `purge_dups` → Hi-C mapping → **YaHS** scaffolding →
  BUSCO/stats/Hi-C contact map দিয়ে মান যাচাই।
- **বড় file (reads/assembly) commit করা হয় না** — ENA accession থেকে আবার নামানো যায়।

বিস্তারিত পদ্ধতি: `docs/METHODS.md`, অগ্রগতি: `docs/STATUS.md`।

---

*This is a learning/portfolio project. Sequencing data belong to the original
submitters (see ENA BioProject PRJNA901637); only code, configs and derived
summary results are distributed here.*
