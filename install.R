#!/usr/bin/env Rscript

# PPM snapshot set in Rprofile.site; restated here for standalone reproducibility
options(repos = c(CRAN = "https://packagemanager.posit.co/all/__linux__/noble/2026-05-11+Fksl5Ok_"))

# --- CRAN packages ---
# Note: base R packages removed (base, boot, class, cluster, codetools, compiler,
# datasets, graphics, grDevices, grid, KernSmooth, lattice, MASS, methods, mgcv,
# nlme, nnet, parallel, rpart, spatial, splines, stats, stats4, survival,
# tcltk, tools, utils) — these ship with R and cannot be installed via CRAN.
#
# Note: rgdal removed — retired from CRAN in 2023; use sf/terra instead.
# Note: googlesheets removed — retired from CRAN; use googlesheets4 instead.

packages <- c(
  "abind", "AER", "anytime", "arrow", "askpass", "assertthat",
  "backports", "base64enc", "bdsmatrix", "BH", "BiocManager",
  "bit", "bit64", "blob", "blogdown", "bookdown", "brew",
  "brio", "broom", "bslib", "cachem", "callr", "car", "carData",
  "caret", "cellranger", "CFtime", "checkmate", "classInt", "cli",
  "clipr", "clock", "coda", "collapse", "colorspace", "cols4all",
  "commonmark", "conflicted", "coro", "covr", "cowplot", "cpp11",
  "crayon", "credentials", "crosstalk", "curl", "data.table",
  "DBI", "dbplyr", "deldir", "Deriv", "desc", "devtools",
  "diagram", "DiagrammeR", "dials", "DiceDesign", "dichromat",
  "diffobj", "digest", "distill", "distributional", "doBy",
  "docopt", "doFuture", "downlit", "dplyr", "dtplyr", "duckdb",
  "e1071", "ellipsis", "evaluate", "fable", "fabletools", "fansi",
  "farver", "fastmap", "feasts", "FNN", "fontawesome", "forcats",
  "foreach", "Formula", "fpp3", "fs", "fst", "fstcore", "furrr",
  "future", "future.apply", "gamlr", "gargle", "generics",
  "geojsonsf", "geometries", "geoR", "geosphere", "gert",
  "ggdist", "ggplot2", "gh", "gitcreds", "globals", "glue",
  "goftest", "googledrive", "googlesheets4", "gower", "GPfit",
  "gridExtra", "gstat", "gtable", "hardhat", "haven", "hdf5r",
  "highr", "Hmisc", "hms", "htmlTable", "htmltools", "htmlwidgets",
  "httpuv", "httr", "httr2", "ids", "igraph", "ini", "intervals",
  "ipred", "IRdisplay", "isoband", "iterators", "jquerylib",
  "jsonify", "jsonlite", "knitr", "labeling", "Lahman", "later",
  "lava", "lazyeval", "leafem", "leafgl", "leaflegend",
  "leaflet.providers", "leafpop", "leafsync", "LearnBayes", "lhs",
  "lidR", "lifecycle", "listenv", "littler", "lme4", "logger",
  "lubridate", "lwgeom", "magrittr", "mapdata", "maps", "mapview",
  "MatrixModels", "maxLik", "memoise", "microbenchmark", "mime",
  "miniUI", "minqa", "miscTools", "modeldata", "modelenv",
  "ModelMetrics", "modelr", "munsell", "mvtnorm", "ncdf4",
  "ncmeta", "nloptr", "numDeriv", "nycflights13", "openssl",
  "packrat", "parallelly", "parsnip", "pbdZMQ", "pbkrtest",
  "pillar", "pkgbuild", "pkgconfig", "pkgdown", "pkgload", "PKI",
  "plm", "plogr", "plyr", "png", "polyclip", "praise",
  "prettyunits", "pROC", "processx", "prodlim", "profvis",
  "progress", "progressr", "proj4", "promises", "proxy", "ps",
  "purrr", "quadprog", "Quandl", "quantmod", "quantreg", "r2d3",
  "R6", "ragg", "randomizr", "rapidjsonr", "rappdirs", "raster",
  "rbibutils", "rcmdcheck", "Rcpp", "RcppArmadillo", "RcppEigen",
  "Rdpack", "readr", "readxl", "recipes", "redland", "reformulas",
  "rematch", "rematch2", "remotes", "renv", "repr", "reprex",
  "reshape2", "rex", "rgl", "rJava", "rlang", "rlas", "RMariaDB",
  "rmarkdown", "RNetCDF", "roxygen2", "RPostgres", "rprojroot",
  "rsample", "rsconnect", "RSQLite", "rstudioapi", "rticles",
  "rversions", "rvest", "s2", "safetensors", "sandwich", "sass",
  "satellite", "scales", "selectr", "servr", "sessioninfo",
  "sfarrow", "sfd", "sfheaders", "sftime", "shape", "shiny",
  "slider", "sourcetools", "spacesXYZ", "spacetime", "SparseM",
  "sparsevctrs", "spatialreg", "spatstat", "spatstat.data",
  "spatstat.explore", "spatstat.geom", "spatstat.linnet",
  "spatstat.model", "spatstat.random", "spatstat.sparse",
  "spatstat.univar", "spatstat.utils", "spData", "spdep",
  "splancs", "SQUAREM", "stargazer", "stringdist", "stringi",
  "stringr", "strucchange", "svglite", "sys", "systemfonts",
  "tensor", "terra", "testit", "testthat", "textshaping",
  "TH.data", "tibble", "tidymodels", "tidync", "tidyr",
  "tidyselect", "timechange", "timeDate", "tinytex", "tmap",
  "tmaptools", "torch", "tseries", "tsibble", "tsibbledata",
  "TTR", "tufte", "tune", "tzdb", "units", "urca", "urlchecker",
  "usethis", "utf8", "uuid", "vars", "vcd", "vctrs", "viridisLite",
  "visNetwork", "vroom", "waldo", "warp", "webshot", "whisker",
  "whoami", "withr", "wk", "wooldridge", "workflows",
  "workflowsets", "xaringan", "xfun", "XML", "xml2", "xopen",
  "xtable", "xts", "yaml", "yardstick", "zip", "zoo",

  # phw-272a
  "ggmap",

  # ottr
  "ottr",

  # ph-251b.r
  "fGarch", "SASxport", "measurements", "dagitty", "coxed",

  # ph-251
  "formatR", "gtsummary", "lemon", "reactable", "flexdashboard", "rio"
)

to_install <- packages[!sapply(packages, requireNamespace, quietly = TRUE)]

if (length(to_install) > 0) {
  message("Installing CRAN packages: ", paste(to_install, collapse = ", "))
  install.packages(to_install, dependencies = TRUE)
} else {
  message("All CRAN packages already installed.")
}

