## These are tests that require internet functionality, and
## a working Internet connection.
## We attempt to test for those.

if(!capabilities()["http/ftp"]) {
    warning("no internet capabilities")
    q()
}

if(.Platform$OS.type == "unix" &&
   is.null(nsl("cran.r-project.org"))) q()

# test do_download.
nrow(available.packages(contrib.url("http://cran.r-project.org")))

# test url connections on http
zz <- url("http://cran.r-project.org/")
readLines(zz)
close(zz)

# and via read.table, test http and ftp.

read.table("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat")
read.table("ftp://ftp.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat")
