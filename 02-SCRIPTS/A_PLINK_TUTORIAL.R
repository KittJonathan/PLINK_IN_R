# A PLINK TUTORIAL
# https://zzz.bwh.harvard.edu/plink/tutorial.shtml
# 2024-03-18

plink <- "C:/Program Files/genomics_software/PLINK.1.90/plink.exe"

# MAKING A BINARY PED FILE ------------------------------------------------

system2(plink, c("--file", "01-DATA-RAW/hapmap1", "--make-bed", "--out", "01-DATA-RAW/hapmap1"))
system2(plink, c("--file", "01-DATA-RAW/hapmap1", "--make-bed", "--mind", 0.05, "--out", "01-DATA-RAW/highgeno"))

# SUMMARY STATISTICS - MISSING RATES --------------------------------------

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--missing", "--out", "04-RESULTS/miss_stat"))

lmiss <- read.table("04-RESULTS/miss_stat.lmiss", header = TRUE)
imiss <- read.table("04-RESULTS/miss_stat.imiss", header = TRUE)
