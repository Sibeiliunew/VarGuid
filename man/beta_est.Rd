\name{beta_est}
\alias{beta_est}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The beta estimation function when using Varguid method
}
\description{
To estimate the betas
}
\usage{
beta_est(X, Y, w, step = 1, lasso = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{ the covariates
%%     ~~Describe \code{x} here~~
}
\item{Y}{ the outcome}
\item{w}{the weight}
\item{step}{default as 1}
\item{lasso}{set as TRUE or FALSE to use LASSO method}
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
function (x)
{
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
