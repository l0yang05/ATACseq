bamDir=/net/isi-dcnl/ifs/user_data/zsun/Seq/170929/markdupBam
for bamfile in $bamDir/*.nodup.sorted.bam
do
	qsub -q short.q macs2_suncluster.sh $bamfile
	echo $bamfile

done
