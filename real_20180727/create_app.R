library(cydar)
contents <- readRDS("objects.rds")
FUNVIEWER <- function(i, x) {
    barplot(assay(x)[i,]/x$totals*100, ylab="Percentage of cells",
        col=rep(c("red", "blue", "darkgreen"), each=6))
}

tab <- contents$tab.rescue
is.sig <- tab$FDR <= 0.05

#app <- interpretSpheres(contents$data, select=NULL, metrics=tab, red.coords=contents$TSNE, red.highlight=is.sig, add.plot=FUNVIEWER)
app <- interpretSpheres(contents$data[is.sig,], select=NULL, metrics=tab[is.sig,], red.coords=contents$TSNE[is.sig,], add.plot=FUNVIEWER)
