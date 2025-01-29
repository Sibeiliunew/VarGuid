\name{ymodv}
\alias{ymodv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ymodv(obj, knn = 10, gamma = c(seq(0, 8.56, length.out = 5)), phi = 0.45)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
%%     ~~Describe \code{obj} here~~
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
function (obj, knn = 10, gamma = c(seq(0, 8.56, length.out = 5)), 
    phi = 0.45) 
{
    dat <- obj$obj.varGuid$model
    colnames(dat)[ncol(dat)] <- "weights"
    mod <- fnmod(dat.x = subset(dat, select = -c(Y, weights)), 
        dat.y = dat$Y, knn = knn, gamma = gamma, phi = phi)
    mod
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
