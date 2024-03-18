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

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--chr", 1, "--out", "04-RESULTS/res1", "--missing"))

# SUMMARY STATISTICS - ALLELE FREQUENCIES ---------------------------------

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--freq", "--out", "04-RESULTS/freq_stat"))
freq_stat <- read.table("04-RESULTS/freq_stat.frq", header = TRUE)

# STRATIFIED BY A CATEGORICAL, CLUSTER VARIABLE
pop <- read.table("01-DATA-RAW/pop.phe")
system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--freq", "--within", "01-DATA-RAW/pop.phe", "--out", "04-RESULTS/freq_stat_pop"))
freq_stat_pop <- read.table("04-RESULTS/freq_stat_pop.frq.strat", header = TRUE)

# FOR 1 SNP
system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--snp", "rs1891905",
                 "--freq", "--within", "01-DATA-RAW/pop.phe", "--out", "04-RESULTS/snp1_frq_stat"))
snp1 <- read.table("04-RESULTS/snp1_frq_stat.frq.strat", header = TRUE)

# BASIC ASSOCIATION ANALYSIS ----------------------------------------------

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--assoc", "--out", "04-RESULTS/as1"))
res <- read.table("04-RESULTS/as1.assoc", header = TRUE)

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--assoc", "--adjust", "--out", "04-RESULTS/as2"))
res2 <- read.table("04-RESULTS/as2.assoc.adjusted", header = TRUE)
head(res2)

system2(plink, c("--bfile", "01-DATA-RAW/hapmap1", "--pheno", "01-DATA-RAW/pop.phe",
                 "--assoc", "--adjust", "--out", "04-RESULTS/as3"))

# GENOTYPIC AND OTHER ASSOCIATION MODELS ----------------------------------


