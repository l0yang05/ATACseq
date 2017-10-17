#!/bin/bash
## bash /net/isi-dcnl/ifs/user_data/Seq/Lu/project_related_scripts/Alignment/Chipseq/run_ATACseq_hpc.sh mm10 
mkdir Bowtie2_aligned
mkdir markdupBam
genome=$1
for i in *R1*.fastq
do fname=${i%_R1_001.fastq}
	echo $fname
    qsub -q short.q /net/isi-dcnl/ifs/user_data/Seq/Lu/project_related_scripts/Alignment/Chipseq/suncluster_ATACseq_separate_log.sh $1 $fname
done
