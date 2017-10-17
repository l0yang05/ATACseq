#!/bin/bash
#$ -M luyang@coh.org
#$ -m bea
#$ -N chip_seq_bt2
#$ -pe shared 12
#$ -j yes
#$ -cwd
#$ -V
(bowtie2 --local -X 2000 -p 12 -x /net/isi-dcnl/ifs/user_data/Seq/Ref/Bowtie2/$1 -1 $2'_R1_001.fastq' -2 $2'_R2_001.fastq' > $2'_bt2_aligned.sam') >& $2'_bt2.log'
samtools view -bS $2'_bt2_aligned.sam' -o $2'_bt2.bam'
samtools sort $2'_bt2.bam' $2'_bt2.pos.sorted'
samtools index $2'_bt2.pos.sorted.bam'
rm $2'_bt2_aligned.sam'