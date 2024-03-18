# PLINK MANUAL
# https://www.cog-genomics.org/plink/2.0/
# 2024-03-18

plink <- "C:/Program Files/genomics_software/PLINK.1.90/plink.exe"

# GENERAL USAGE -----------------------------------------------------------

system2(plink, "--dummy 2 2 --freq --make-bed --out 01-DATA-RAW/toy_data")
