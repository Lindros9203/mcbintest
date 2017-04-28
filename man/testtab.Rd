\name{testtab}
\alias{testtab}
\docType{data}
\title{
testtab -- sample data for \code{bin.test} function
}
\description{
Sample dataset for \code{bin.test} function.
}
\usage{data("testtab")}
\format{
  A data frame with 3 observations on the following 4 variables.
  \describe{
    \item{\code{treatment}}{a factor with levels \code{A} \code{B} \code{C}}
    \item{\code{alive}}{a numeric vector}
    \item{\code{dead}}{a numeric vector}
    \item{\code{total}}{a numeric vector}
  }
}
\details{
Sample data obtained during tree seedlings growth experiment. The data frame depicts number of dead and surviving trees under selected treatments A, B and C after experiment. The A, B and C treatments stands for different concentrations of growth stimulator.
}
\source{
Presented data were obtained by Department of Silviculture, Faculty of Forestry and Wood Sciences, Czech University of Life Sciences Prague.
}

\examples{
## ---- Sample analysis ---
bin.test(testtab)
}
\keyword{datasets}
