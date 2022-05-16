library(fs)
library(purrr)
library(rvest)
options(timeout=1800)

download_dir <- "download"
fs::dir_create(download_dir)

print("Downloading Files")
url='ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.xml.gz'
download.file(url=url,destfile=(file.path(download_dir,"uniprot_sprot.xml.gz")))