#!/bin/bash
for i in *R1*.fastq
do fname=${i%_R1_001.fastq}
	echo $fname
    qsub -q short.q /net/isi-dcnl/ifs/user_data/Seq/Lu/project_related_scripts/Alignment/Chipseq/suncluster_chipSeq_bowtie2_separate_log.sh mm10 $fname
done
