# ATACseq
1. alignment:  Bowtie2 --local
2. Picard remove duplicate
3. ATAC-seq QC: R bioconductor.  Fragment distribution
4. MACS2 peak calling: broadpeak --bdg
5. Convert MACS2 bdg file to tdf for visualization in igv
6. Peak annotation: Chipseeker - TSS heatmap, annotation bar plot
