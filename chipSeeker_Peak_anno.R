peak_annotation_chipseeker <- function(genome,peakfilePath,peakfilePattern="*_peaks.bed",sampleIDs=NA){
  library(ChIPseeker)
  library(clusterProfiler)
  if(genome=="hg19"){
    library(TxDb.Hsapiens.UCSC.hg19.knownGene)
    txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
  } else if(genome=="mm10"){
    library("TxDb.Mmusculus.UCSC.mm10.knownGene")
    txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene
  } else {
    print("no availbe input genome detected....")
  }
  setwd(peakfilePath)
  files <- list.files(pattern = peakfilePattern)
  #files <- list.files(pattern = "*_peaks.broadPeak")
  if(!is.na(sampleIDs)){
    names(files) <- sampleIDs #### should have name attribute, which was used to label the bar
    
  } else {
    #sampleIDs <- gsub(pattern = "_peaks.bed","",files)
    sampleIDs <- gsub(pattern = "_peaks.broadPeak","",files)
    print(sampleIDs)
    names(files) <- sampleIDs
  }
  peakAnnoList <- lapply(files, annotatePeak, TxDb=txdb,
                         tssRegion=c(-3000, 3000), verbose=FALSE)
  png("peak_anno_type_barplot.png", width=1000,height = 600)
  #browser()
  plot <- plotAnnoBar(peakAnnoList)
  print(plot)
  dev.off()
  
  promoter <- getPromoters(TxDb=txdb, upstream=3000, downstream=3000)
  tagMatrixList <- lapply(files, getTagMatrix, windows=promoter)
  png("TSS_heatmap.png",width=1000,height = 600)
  tagHeatmap(tagMatrixList, xlim=c(-3000, 3000), color=NULL)
  dev.off()
  
  
}