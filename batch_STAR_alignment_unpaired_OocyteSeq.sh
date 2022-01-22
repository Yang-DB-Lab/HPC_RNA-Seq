#!/bin/bash
module load STAR
# sbatch --cpus-per-task=16 --mem=64g --time=4:00:00 --partition=niddk
set -e
# module load STAR
for i in 42 43 44 45
do
	cd /data/yangg3/Oocyte_Seq
	cd ./SRR20727$i
	# ls -lh ./output_unpaired_SRR6892$i\_1.fastq.gz
	# ls -lh ./output_unpaired_SRR6892$i\_2.fastq.gz 
	# pwd
	STAR --runThreadN 16\
	--genomeDir /data/yangg3/mouse_genome_index \
	--readFilesCommand zcat\
	--outSAMstrandField intronMotif\
	--outSAMtype BAM SortedByCoordinate\
	--readFilesIn ./output_unpaired_SRR20727$i\_1.fastq.gz\
	--outReadsUnmapped Fastx\
	--outFileNamePrefix ./STAR_SRR20727$i\_unpaired_1_

	# cd /data/yangg3/Seq_RAW_data/Fan_Lab_MouseSingleCellData
	# cd ./SRR6892$i
	# ls -lh ./output_unpaired_SRR6892$i\_1.fastq.gz
	# ls -lh ./output_unpaired_SRR6892$i\_2.fastq.gz 
	# pwd
	STAR --runThreadN 16\
	--genomeDir /data/yangg3/mouse_genome_index \
	--readFilesCommand zcat\
	--outSAMstrandField intronMotif\
	--outSAMtype BAM SortedByCoordinate\
	--readFilesIn ./output_unpaired_SRR20727$i\_2.fastq.gz\
	--outReadsUnmapped Fastx\
	--outFileNamePrefix ./STAR_SRR20727$i\_unpaired_2_

done
	# --genomeDir: STAR index fold location
	# --readFilesCommand 
	# If the read files are compressed, use the
	# --readFilesCommand UncompressionCommand
	# for gzipped files (*.gz) use --readFilesCommand zcat OR --readFilesCommand gzip -c. 
	# For bzip2-compressed files, use --readFilesCommand bzip2 -c
	# --outSAMstrandField: add the SAM strand attribute XS that is needed downstream by the Cufflinks
	# /data/yangg3/mouse_genome_index: This fold stores RNA-STAR index
#	STAR --runThreadN 16 \
#	--genomeDir /data/yangg3/mouse_genome_index \ 
#	--readFilesCommand zcat \
#	--outSAMstrandField intronMotif \
#	--outSAMtype BAM SortedByCoordinate \
#	--readFilesIn ./output_unpaired_SRR6892$i\_1.fastq.gz \
#	--outReadsUnmapped Fastx \
#	--outFileNamePrefix ./STAR_SRR6892$i\_unpaired_1_
#	
#	STAR --runThreadN 16 \
#	--genomeDir /data/yangg3/mouse_genome_index \
#	--readFilesCommand zcat \
#	--outSAMstrandField intronMotif \
#	--outSAMtype BAM SortedByCoordinate \
#	--readFilesIn ./output_unpaired_SRR6892$i\_2.fastq.gz \
#	--outReadsUnmapped Fastx \
#	--outFileNamePrefix ./STAR_SRR6892$i\_unpaired_2_

