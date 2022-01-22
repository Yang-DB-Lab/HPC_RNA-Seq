#!/bin/bash
STAR --runMode genomeGenerate --runThreadN 6 --genomeDir ~/Genome_Index/mouse/v38.92/STAR2.6.0a --genomeFastaFiles ~/Genome_Files/Mus_musculus.GRCm38.92.dna.toplevel.fa --sjdbGTFfile ~/Genome_Files/Mus_musculus.GRCm38.92.gtf --sjdbOverhang 99 --limitGenomeGenerateRAM=50000000000
#NOTES:
# --sjdbOverhang should be read length-1. For illumina Truseq file will 100bp reads, set it to 99(=100-1) 
# --limitGenomeGenerateRAM=50000000000 #set RAM can be used. For mouse genome. STAR can use up to 52GB RAM. 31GB seems to be the default choice. If not enough RAM exists, STAR will abrupt soon.


