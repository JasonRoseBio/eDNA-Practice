

library(dada2)

#Read in fastq files, getting matched lists of forward and reverse reads.
#forward and reverse file names have pattern _pass_1.fastq.gz and _pass_2.fastq.gz
fnFs <- sort(list.files("/Users/jay/Desktop/eDNA_practice/fastq", pattern="_pass_1.fastq", full.names = TRUE))
fnRs <- sort(list.files("/Users/jay/Desktop/eDNA_practice/fastq", pattern="_pass_2.fastq", full.names = TRUE))
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`,1)

# Assigning filenames to filtered fastq files and placing in subdirectory

filtFs <- file.path("/Users/jay/Desktop/eDNA_practice/fastq/filtered", "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path("/Users/jay/Desktop/eDNA_practice/fastq/filtered", "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen = c(200,160),
                     maxN = 0, maxEE = c(2,2), truncQ = 2, rm.phix = TRUE,
                     compress=TRUE, multithread = TRUE)




