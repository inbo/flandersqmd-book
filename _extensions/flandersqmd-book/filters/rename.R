rename_output <- function() {
  Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES") |>
    strsplit(split = "\n") |>
    unlist() -> candidates
  relevant <- candidates[grepl("\\.pdf$", candidates)]
  if (length(relevant) == 0) {
    return(invisible(NULL))
  }
  yml <- quarto::quarto_inspect()
  stopifnot(
    "no `flandersqmd` section found in `_quarto.yml`" =
      "flandersqmd" %in% names(yml$config),
    "no `shorttitle` item in the `flandersqmd` section found in `_quarto.yml`" =
      "shorttitle" %in% names(yml$config$flandersqmd)
  )
  for (x in relevant) {
    dirname(x) |>
      file.path(
        paste0(gsub("-", "_", yml$config$flandersqmd$shorttitle), ".pdf")
      ) |>
      file.rename(from = x)
  }
}

rename_output()
