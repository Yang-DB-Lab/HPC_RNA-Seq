#!/bin/bash

# sbatch --cpus-per-task=8 --mem=64g --time=8:00:00 --partition=niddk
set -e
module load samtools

for i in 42 43 44 45
do
	cd /data/yangg3/Oocyte_Seq
	cd ./SRR20727$i
	# Every folder has 3 bam files
	# For example:
	#./SRR689233/STAR_SRR689233_paired_Aligned.sortedByCoord.out.bam
	#./SRR689233/STAR_SRR689233_unpaired_1_Aligned.sortedByCoord.out.bam
	#./SRR689233/STAR_SRR689233_unpaired_2_Aligned.sortedByCoord.out.bam
	
	# merge these 3 bam files into 1 bam file and then sort the merged bam file
	samtools merge merged_SRR20727$i.bam STAR*.bam
	samtools sort -@ 8 -m 8G -o sorted_merged_SRR20727$i.bam merged_SRR20727$i.bam
	# ????
	#rm merged_SRR20727$i.bam
done
	
