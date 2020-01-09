# WALS great-circle distances

The file [`wals-distances.csv.gz`](https://github.com/hkauhanen/wals-distances/blob/master/wals-distances.csv.gz) contains the great-circle ("haversine") distance from each language recorded in the [WALS](https://wals.info) to each other language, calculated from the WALS coordinate pairs assuming a perfectly spherical Earth of radius 6,371 km, as a compressed comma-separated values file.

The following subsets are also provided for convenience:

* [`wals-distances-under1000km.csv`](https://github.com/hkauhanen/wals-distances/blob/master/wals-distances-under1000km.csv): Only neighbours at most 1,000 km away
* [`wals-distances-under5000km.csv`](https://github.com/hkauhanen/wals-distances/blob/master/wals-distances-under5000km.csv): Only neighbours at most 5,000 km away
* [`wals-distances-100closest.csv`](https://github.com/hkauhanen/wals-distances/blob/master/wals-distances-100closest.csv): Only the 100 nearest neighbours
* [`wals-distances-500closest.csv`](https://github.com/hkauhanen/wals-distances/blob/master/wals-distances-500closest.csv): Only the 500 nearest neighbours 

The script used to generate all of this is [`walsgeo.R`](https://github.com/hkauhanen/wals-distances/blob/master/walsgeo.R), which calls upon the [ritwals](https://github.com/hkauhanen/ritwals) package. Its runtime is about an hour on an ordinary computer (in 2020).
