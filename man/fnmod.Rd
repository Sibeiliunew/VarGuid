\name{fnmod}
\alias{fnmod}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
decide final model after optimizing gamma and phi
}
\usage{
fnmod(dat.x, dat.y, knn = 10, gamma = c(seq(0, 8.56, length.out = 5)), phi = 0.45)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat.x}{
%%     ~~Describe \code{dat.x} here~~
}
  \item{dat.y}{
%%     ~~Describe \code{dat.y} here~~
}
  \item{knn}{
%%     ~~Describe \code{knn} here~~
}
  \item{gamma}{
%%     ~~Describe \code{gamma} here~~
}
  \item{phi}{
%%     ~~Describe \code{phi} here~~
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
function (dat.x, dat.y, knn = 10, gamma = c(seq(0, 8.56, length.out = 5)),
    phi = 0.45)
{
    data <- as.data.frame(dat.x)
    nums <- unlist(lapply(data, is.numeric))
    obj <- covx(as.matrix(dat.x[, nums]), knn = knn, gamma = gamma,
        phi = phi)
    w <- obj$w
    n <- dim(obj$sol$U[[1]])[2]
    A <- create_adjacency(obj$sol$V[[1]], w, n)
    rdef.all <- find_clusters(A)
    data$z <- as.factor(as.character(rdef.all$cluster))
    data$y <- dat.y
    if (dim(dat.x)[2] == 1)
        dat.x <- cbind(dat.x, dat.x)
    center <- cent(dat = dat.x, cluster = rdef.all$cluster)
    list(clust = obj, data = data, center = center)
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
