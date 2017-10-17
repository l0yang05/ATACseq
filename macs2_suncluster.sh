#!/bin/bash
#$ -M luyang@coh.org
#$ -m bea
#$ -N macs2_PE
#$ -pe shared 12
#$ -j yes
#$ -cwd
#$ -V

bamfile=$1
name=$(basename $bamfile)
name=${name%.nodup.sorted.bam}
echo $name
/net/isi-dcnl/ifs/user_data/Seq/MACS_2.1.1.20160309/bin/macs2 callpeak -t $bamfile --broad -g mm  -n $name --broad-cutoff 0.05 -f BAMPE --bdg 2> $name.macs2.log