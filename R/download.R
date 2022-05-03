library(fs)
library(curl)
library(stringr)
library(purrr)
options(timeout=60000)

cache_dir = "cache"
fs::dir_create(cache_dir)

ftp_base <- "ftp://ftp.uniprot.org"
ftp_dir <- "pub/databases/uniprot/current_release/knowledgebase/complete"
ftp_path <- file.path(ftp_base,ftp_dir)


#https://gist.github.com/adamhsparks/18f7702906f33dd66788e0078979ff9a
list_files <- curl::new_handle()
curl::handle_setopt(list_files, ftp_use_epsv = TRUE, dirlistonly = TRUE)

con <- curl::curl(url = paste0(ftp_path,"/"), "r", handle = curl::new_handle())
files <- readLines(con)
close(con)

ftp_files <- files |> stringr::str_split("\\s") |>
map(function(x) {
    x |> purrr::discard(~ .x == "")
}) |>
map(function(x) {
    f <- c()
    f$perms <- x[[1]]
    f$bytes <- x[[5]]
    f$month <- x[[6]]
    f$day <- x[[7]]
    f$time <- x[[8]]
    f$filename <- x[[9]]
    f
}) |> map(~ .x$filename) |>
# We are only processing the uniprot_sprot.xml.gz file
purrr::keep(~.x == "uniprot_sprot.xml.gz") |>
map(~ file.path(ftp_path, .x)) |> unlist() |>
unlist()

ftp_files |>
# skip trembl
#purrr::discard( ~ grepl("*trembl*",.x)) |>
walk(~ download_file(dest_dir = cache_dir, url = .x))