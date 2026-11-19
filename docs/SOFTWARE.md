# Software and Tools

All assembly/evaluation tools are pulled automatically as Apptainer (Singularity)
containers by the `sanger-tol/genomeassembly` Nextflow pipeline. Versions are those
bundled with pipeline release v1.1.0 at run time.

| Software | Source | Repository / Home | Use in this project |
|----------|--------|-------------------|---------------------|
| Nextflow | nextflow.io | https://github.com/nextflow-io/nextflow | Workflow manager that runs and reproduces the whole pipeline |
| Apptainer (Singularity) | apptainer.org | https://github.com/apptainer/apptainer | Container runtime executing every tool reproducibly |
| sanger-tol/genomeassembly | Wellcome Sanger (ToL) | https://github.com/sanger-tol/genomeassembly | The end-to-end HiFi + Hi-C assembly pipeline used here (v1.1.0) |
| FastK | Gene Myers | https://github.com/thegenemyers/FASTK | k-mer counting on HiFi reads (feeds coverage estimation) |
| GenomeScope2 | Ranallo-Benavidez et al. | https://github.com/tbenavi1/genomescope2.0 | Estimates genome size, heterozygosity and read coverage |
| hifiasm | Cheng et al. | https://github.com/chhylp123/hifiasm | De novo contig assembly from PacBio HiFi reads |
| purge_dups | Guan et al. | https://github.com/dfguan/purge_dups | Removes haplotypic duplicate contigs after assembly |
| bwa-mem2 | Vasimuddin et al. | https://github.com/bwa-mem2/bwa-mem2 | Maps Hi-C reads to contigs for scaffolding |
| YaHS | Chenxi Zhou | https://github.com/c-zhou/yahs | Hi-C scaffolding of contigs to chromosome scale |
| MitoHiFi | Uliano-Silva et al. | https://github.com/marcelauliano/MitoHiFi | (Optional) mitochondrial genome assembly from HiFi reads |
| Merqury | Rhie et al. | https://github.com/marbl/merqury | k-mer based assembly QV and completeness evaluation |
| BUSCO | Manni et al. (EZlab) | https://gitlab.com/ezlab/busco | Gene-completeness assessment (actinopterygii_odb10) |
| samtools | Danecek et al. | https://github.com/samtools/samtools | FASTQ-to-CRAM conversion and BAM/CRAM handling |
| seqkit | Shen et al. | https://github.com/shenwei356/seqkit | Read statistics (QC) and downsampling of HiFi/Hi-C reads |
| gfastats | Formenti et al. | https://github.com/vgl-hub/gfastats | Assembly contiguity statistics (length, N50, scaffolds) |

> Note: BUSCO is hosted on GitLab (ezlab), not GitHub.
