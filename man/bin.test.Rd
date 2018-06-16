\name{bin.test}
\alias{bin.test}
\title{
\code{bin.test} -- Multiple comparisons of several binomial distributions
}
\description{
A function for performing multiple comparisons of several binomial distributions. Used algorithm is based on method proposed by Agresti & Bini (2008).
}
\usage{
bin.test(x,...)
}
\arguments{
  \item{x}{A data frame in required form (see Details or README file).}
  \item{...}{Further arguments to be passed to or from methods.}
}

\details{
The input data frame should have at least three columns and two rows (treatments), each row for one variant (treatment). Further columns are omitted. The treatment should be specified in the first column, second and third columns specify two options of the response. Each cell of the data frame should contain number (counts) of respective treatment/response combination.

For sample data, please see included data frame named \code{testtab}.
}
\value{
\item{mc}{A data frame with results of multiple comparisons. Row names specifies respective pairwise comparison.}
\item{CI}{Confidence intervals for probability of ratio of counts in second/third column of \code{x}.}
\item{errbars}{Length of error bars for denoting \code{1-alpha} CI}
\item{obs_variable}{Variable, for whose probability the confidence intervals are computed (name of second column of input data frame \code{x})}

}
\references{
Agresti, A., Bini, M., Bertaccini, B. and Ryu, E. (2008), Simultaneous Confidence Intervals for Comparing Binomial Parameters. Biometrics, 64: 1270-1275. doi:10.1111/j.1541-0420.2008.00990.x
}
\author{
Rostislav Linda
}
\note{
The method works either with balanced or unbalanced data (total number of observations for each treatment), but does not work well when the ratio (probability) of counts in second/third column of input data frame \code{x} are very close to 0 or 1 (Agresti, Bini et al., 2008).
}

\examples{
## ---- Sample analysis on provided data frame ----

bin.test(testtab)
}

\keyword{data}
\keyword{category}
\keyword{binomial}
