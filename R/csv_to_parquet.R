library(arrow)
library(vroom)

if (!dir.exists("brick")) {
  dir.create("brick", recursive = TRUE)
}
arrow::write_parquet(vroom::vroom("download/uniprot_sprot.csv", delim="|"),
    file.path("brick", "uniprot_sprot.parquet"))