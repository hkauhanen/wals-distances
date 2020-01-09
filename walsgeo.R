if (!require(ritwals)) devtools::install_github("hkauhanen/ritwals")

# Find the distances between all language-language pairs in WALS.
#
walsgeo <- function(languages = unique(ritwals::WALS_languages$language_ID)) {
  myfun <- function(X) {
    ngh <- ritwals::nearest_geo_neighbours(id=X, k=nrow(ritwals::WALS_languages))
    ngh$target_ID <- X
    ngh$rank <- 1:nrow(ngh)
    ngh <- ngh[, c("target_ID", "language_ID", "rank", "distance")]
    names(ngh)[c(1,2)] <- c("language_ID", "neighbour_ID")
    ngh
  }

  do.call(rbind, lapply(X=languages, FUN=myfun))
}

