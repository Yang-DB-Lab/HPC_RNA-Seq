#!/bin/bash
module load STAR
# sbatch --cpus-per-task=16 --mem=64g --time=4:00:00 --partition=niddk
set -e
for i in 42 43 44 45
do
	cd /data/yangg3/Oocyte_Seq
	cd ./SRR20727$i
	# --genomeDir: STAR index fold location
	# --readFilesCommand 
	# If the read files are compressed, use the
	# --readFilesCommand UncompressionCommand
	# for gzipped files (*.gz) use --readFilesCommand zcat OR --readFilesCommand gzip -c. 
	# For bzip2-compressed files, use --readFilesCommand bzip2 -c
	# --outSAMstrandField: add the SAM strand attribute XS that is needed downstream by the Cufflinks
	# /data/yangg3/mouse_genome_index: This fold stores RNA-STAR index
	STAR --runThreadN 16 \
	--genomeDir /data/yangg3/mouse_genome_index \
	--readFilesCommand zcat \
	--outSAMstrandField intronMotif \
	--outSAMtype BAM SortedByCoordinate \
	--readFilesIn ./output_paired_SRR20727$i\_1.fastq.gz ./output_paired_SRR20727$i\_2.fastq.gz \
	--outReadsUnmapped Fastx \
	--outFileNamePrefix ./STAR_SRR20727$i\_paired_
done
