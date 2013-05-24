\docType{data}
\name{roc}
\alias{roc}
\title{Some random data}
\format{A data.frame}
\source{
  Generated from \code{library(ROCR);data(ROCR.simple);roc <- data.frame(preds=ROCR.simple$predictions,labs=ROCR.simple$labels)}
}
\description{
  A data.frame from ROCR package
}
\examples{
data(roc)
str(roc)
}
\keyword{datasets}
