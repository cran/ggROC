\name{ggroc}
\alias{ggroc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{package for roc curve plot with ggplot2}
\description{package for roc curve plot with ggplot2}
\usage{
ggroc(data = data, bin = 0.01, roccol = "green", sp = 19, output = "roc.pdf")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
}
  \item{bin}{
%%     ~~Describe \code{bin} here~~
}
  \item{roccol}{
%%     ~~Describe \code{roccol} here~~
}
  \item{sp}{
%%     ~~Describe \code{sp} here~~
}
  \item{output}{
%%     ~~Describe \code{output} here~~
}
}
\details{
none
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
 data frame
}
\references{
none
%% ~put references to the literature/web site here ~
}
\author{
Honglong Wu
%%  ~~who you are~~
}
\note{
none
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
none
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data = data, bin = 0.01, roccol = "green", sp = 19, 
    output = "roc.pdf") 
{
    pn <- nrow(subset(data, data[, 2] == 1))
    fn <- nrow(data) - pn
    diag = data.frame(x = seq(0, 1, by = bin), y = seq(0, 1, 
        by = bin))
    cutoffs <- seq(0, 1, by = bin)
    x = 0
    y = 0
    for (i in cutoffs) {
        tpn <- nrow(subset(data, data[, 1] >= i & data[, 2] == 
            1))
        fpn <- nrow(subset(data, data[, 1] >= i & data[, 2] == 
            0))
        fnn <- pn - tpn
        tnn <- fn - fpn
        tpr <- tpn/(tpn + fnn)
        fpr <- fpn/(fpn + tnn)
        x <- c(x, fpr)
        y <- c(y, tpr)
    }
    rocdata <- data.frame(FPR = x, TPR = y)
    p <- ggplot(data = rocdata, aes(x = FPR, y = TPR)) + geom_point(color = roccol) + 
        geom_line(color = roccol) + geom_line(data = diag, aes(x = x, 
        y = y), color = "red")
    f <- p + geom_point(data = diag, aes(x = x, y = y), color = "red", 
        shape = sp) + theme(axis.text = element_text(size = 16), 
        title = element_text(size = 18)) + labs(x = "False Positive Rate", 
        y = "True Positive Rate", title = "ROC curve")
    ggsave(f, filename = output, width = 8, height = 6, units = c("in"))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
