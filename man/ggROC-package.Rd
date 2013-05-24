\name{ggROC-package}
\alias{ggROC-package}
\alias{ggROC}
\docType{package}
\title{package for roc curve plot with ggplot2}
\description{package for roc curve plot with ggplot2}
\details{
\tabular{ll}{
Package: \tab ggROC\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-05-24\cr
License: \tab What license is it under?\cr
}
}
\author{Honglong Wu wuhonglong.china@gmail.com}
\references{
none
}
\keyword{ roc }
\seealso{
none
}
\examples{
	data(roc)
	ggroc(roc, 0.01,"green",19,output="roc.pdf")
}
