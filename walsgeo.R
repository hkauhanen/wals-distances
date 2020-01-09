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

# Break down language-by-language - github has 100MB file limit :((((((
#
breakdown <- function(df,
		      folder = "languages") {
	lges <- unique(df$language_ID)
	for (lge in lges) {
		thisdf <- df[df$language_ID==lge, ]
		write.csv(thisdf, file=paste0(folder, "/", lge, ".csv"), row.names=FALSE)
	}
}

# Break down into three parts
#
breakdown2 <- function(df) {
	N <- round(nrow(df)/3)
	write.csv(df[1:N, ], file="wals-distances-1.csv", row.names=FALSE)
	write.csv(df[(N+1):(2*N), ], file="wals-distances-2.csv", row.names=FALSE)
	write.csv(df[(2*N+1):nrow(df), ], file="wals-distances-3.csv", row.names=FALSE)
}
