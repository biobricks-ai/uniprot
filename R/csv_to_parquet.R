library(arrow)
library(vroom)
arrow::write_parquet(vroom::vroom("data/uniprot_sprot.csv"),
    file.path("data/uniprot_sprot.parquet"))