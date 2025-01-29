\name{covx}
\alias{covx}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
convex clustering
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
covx(x, knn = 9, phi = 0.46, gamma = c(seq(0, 8.56, length.out = 5)))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{knn}{
%%     ~~Describe \code{knn} here~~
}
  \item{phi}{
%%     ~~Describe \code{phi} here~~
}
  \item{gamma}{
%%     ~~Describe \code{gamma} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or standard data sets, see data().

## The function is currently defined as
function (x, knn = 9, phi = 0.46, gamma = c(seq(0, 8.56, length.out = 5)))
{
    x <- as.data.frame(x)
    nums <- unlist(lapply(x, is.numeric))
    X <- t(scale(as.matrix(x[, nums])))
    n <- ncol(X)
    w <- kernel_weights(X, phi)
    if (!is.null(knn)) {
        k <- knn
        w <- knn_weights(w, k, n)
    }
    list(sol = cvxclust(X, w, gamma), w = w, x = x[, nums], x.all = x,
        gamma = gamma, knn = knn)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
