#!/bin/bash
#$ -M luyang@coh.org
#$ -m bea
#$ -N ATAC_seq_bt2
#$ -pe shared 12
#$ -j yes
#$ -cwd
#$ -V
(bowtie2 --local -X 2000 -p 12 -x /net/isi-dcnl/ifs/user_data/Seq/Ref/Bowtie2/$1 -1 $2'_R1_001.fastq' -2 $2'_R2_001.fastq' > $2'_bt2_aligned.sam') >& $2'_bt2.log'
samtools view -bS $2'_bt2_aligned.sam' -o $2'_bt2.bam'
samtools sort $2'_bt2.bam' $2'_bt2.pos.sorted'
samtools index $2'_bt2.pos.sorted.bam'
rm $2'_bt2_aligned.sam'
rm $2'_bt2.bam'
mv $2'_bt2'* Bowtie2_aligned/
cd markdupBam
file=../Bowtie2_aligned/$2'_bt2.pos.sorted.bam'
newfile=$2

java -Xmx8g -Djava.io.tmpdir=`pwd`/tmp -jar /opt/picard-tools-1.72/MarkDuplicates.jar INPUT=$file OUTPUT=$newfile'.nodup.bam' REMOVE_DUPLICATES=true MAX_RECORDS_IN_RAM=500000 METRICS_FILE=$newfile'_nodup_metrics.txt'
samtools sort $newfile'.nodup.bam' $newfile'.nodup.sorted'
samtools index $newfile'.nodup.sorted.bam'