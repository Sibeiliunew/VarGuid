\name{cent}
\alias{cent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
calculate centers from clusters of training data
}
\usage{
cent(dat, cluster)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{dat} here~~
}
  \item{cluster}{
%%     ~~Describe \code{cluster} here~~
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
function (dat, cluster)
{
    x <- data.frame(matrix(NA, length(unique(cluster)), length(dat[1,
        ])))
    colnames(x) <- colnames(dat)
    for (i in sort(unique(cluster))) {
        if (length(which(cluster == i)) == 1) {
            x[i, ] <- dat[which(cluster == i), ]
        }
        else {
            x[i, ] <- colMeans(dat[which(cluster == i), ])
        }
    }
    x
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
