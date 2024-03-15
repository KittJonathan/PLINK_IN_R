# A PLINK TUTORIAL
# https://zzz.bwh.harvard.edu/plink/tutorial.shtml
# 2024-03-15

plink <- "C:/Program Files/genomics_software/PLINK.1.90/plink.exe"

# 01 - MAKE A BINARY PED FILE ---------------------------------------------

system2(plink, "--file 01-DATA-RAW/hapmap1 --make-bed --out 01-DATA-RAW/hapmap1")
system2(plink, c("--file", "01-DATA-RAW/hapmap1", "--make-bed", "--out", "01-DATA-RAW/hapmap1"))

# Only include individuals with at least 95% genotyping
system2(plink, "--bfile 01-DATA-RAW/hapmap1 --make-bed --mind 0.05 --out 03-DATA-PROCESSED/highgeno")

# 02 - SUMMARY STATISTICS : MISSING RATES ---------------------------------

system2(plink, "--bfile 01-DATA-RAW/hapmap1 --missing --out 04-RESULTS/miss_stat")
head(read.table("04-RESULTS/miss_stat.lmiss", sep = "", header = TRUE), 10)
head(read.table("04-RESULTS/miss_stat.imiss", sep = "", header = TRUE), 10)

# 03 - SUMMARY STATISTICS : ALLELE FREQUENCIES ----------------------------

system2(plink, "--bfile 01-DATA-RAW/hapmap1 --frqx --out 04-RESULTS/freq_stat")
head(read.table("04-RESULTS/freq_stat.frqx", sep = "\t", header = TRUE), 10)
