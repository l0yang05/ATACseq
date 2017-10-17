#!/bin/bash
#$ -M luyang@coh.org
#$ -m bea
#$ -N tdf_generate
#$ -o tdf.log
#$ -j yes
#$ -cwd
#$ -V

fname=$1
sample=$fname'_treat_pileup.bdg'
#sample_input=$fname'_control_lambda.bdg'
genome=$2

mv $sample $sample.wig
#mv $sample_input $sample_input.wig
igvtools toTDF --fileType wig $sample.wig $fname.tdf $genome
#igvtools toTDF --fileType wig $sample_input.wig $fname.input.tdf $genome