#!/bin/bash
##command: run in macs2 folder
##bash /net/isi-dcnl/ifs/user_data/Seq/Lu/project_related_scripts/Alignment/Chipseq/run_macs2_toTDF_hpc.sh hg19
genome=$1
echo "reference genome is $genome"
for i in *_treat_pileup.bdg
do fname=${i%_treat_pileup.bdg}
	echo $fname
    qsub -q short.q /net/isi-dcnl/ifs/user_data/Seq/Lu/project_related_scripts/Alignment/Chipseq/macs2ToTDF.sh $fname $genome
	
done
