\name{print.bintest}
\alias{print.bintest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Method for formatting \code{bin.test} output
}
\description{
Function for printing the output from \code{bin.test} function. The code is available below.
}
\usage{
\method{print}{bintest}(x, ...)
}

\arguments{
  \item{x}{object to use print.bintest method on}
  \item{...}{Further arguments to be passed to or from methods.}
}


\author{
Rostislav Linda
}

\examples{
## The function is currently defined as
function (x)
{
    cat("\n Multiple comparisons of binomial proportions:")
    cat("\n =============================================\n")
    print(x$mc)
    cat("\n Numbers in first two columns depicts row numbers in input table.\n")
    cat(" -----------------------------------------------------------------\n")
    cat("\n Confidence intervals for probabilities:")
    cat("\n =============================================\n")
    cat("\n The estimate is computed for column named:", x$obs_variable)
    cat("\n\n")
    print(x$CI)
    cat(" -----------------------------------\n")
    cat("\n Error bar lengths:")
    cat("\n =============================================\n")
    print(x$errbars)
    cat(" -----------------------\n")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
