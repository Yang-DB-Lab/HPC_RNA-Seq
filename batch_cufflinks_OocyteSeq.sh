#!/bin/bash

# sbatch --cpus-per-task 8 --mem=32g --time=8:00:00 --partition=niddk
set -e
module load cufflinks

for i in {42..45}
do
	cd /data/yangg3/Oocyte_Seq
	cd ./SRR20727$i
	
	cufflinks -p 8 -G /data/yangg3/mouse_genome/Mus_musculus.GRCm38.90.gtf -o ./SRR20727$i sorted_merged_SRR20727$i.bam
done
