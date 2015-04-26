#' Generate histogram and boxplot of HarvestChoice layer(s)
#'
#' @param var character array of variables to summarize
#' @param iso3 optional country or region filter (3-letter code)
#' @return plot
#' @examples
#' # Plots of BMI and cassava yield distribution over sub-Saharan Africa 10km grid
#' stats(c("bmi", "cass_y"))
#' @export
stats <- function(var, iso3="SSA", by=NULL) {

  d <- getLayer(var, iso3, by)

  for(i in var) {
    t <- summary(d[[i]])
    p <- hist(d[[i]], plot=F)
    b <- (max(p$counts)-min(p$counts))/20

    hist(d[[i]], n=30, xlab=NA, ylim=c(-b, max(p$counts)), col="azure3",
      main=paste(vi[varCode==i, varTitle], names(iso)[iso==iso3], sep=" - "))
    boxplot(d[[i]], horizontal=T, at=-b, border="blue", boxwex=b*2, axes=F, outline=F, add=T)
    legend(x="topright", legend=paste(c("N", names(t)), c(dim(d)[1], t), sep=":   "), bg="white")
  }

}