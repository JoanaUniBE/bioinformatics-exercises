#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --output=qual.out
#SBATCH --error=qual.err
#SBATCH --job-name=fastp
#SBATCH --cpus-per-task=4
#SBATCH --partition=pcourseb

module add fastp/0.23.4-GCC-10.3.0

fastp -w 4 -q 15 -z 5 -l 50  -i SRR1027171_1.fastq.gz -I SRR1027171_2.fastq.gz -o SRR1027171_1.clean.fq.gz -O SRR1027171_2.clean.fq.gz

# Trim low-quality ends from reads before adapter removal if quality is less than 15 (-q 15)
# Discard trimmed reads that are shorter than 50 bases after trimming (-l 50)
# compression level for gzip output (-z 5)
# set number of threads to 4 (-w 4)