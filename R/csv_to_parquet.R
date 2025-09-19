library(arrow)
library(vroom)
arrow::write_parquet(vroom::vroom("brick/uniprot_sprot.csv"),
    file.path("brick/uniprot_sprot.parquet"))