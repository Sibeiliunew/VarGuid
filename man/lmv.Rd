\name{lmv}
\alias{lmv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lmv(X, Y, M = 10, step = 1, tol = exp(-10), lasso = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
%%     ~~Describe \code{X} here~~
}
  \item{Y}{
%%     ~~Describe \code{Y} here~~
}
  \item{M}{
%%     ~~Describe \code{M} here~~
}
  \item{step}{
%%     ~~Describe \code{step} here~~
}
  \item{tol}{
%%     ~~Describe \code{tol} here~~
}
  \item{lasso}{
%%     ~~Describe \code{lasso} here~~
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
function (X, Y, M = 10, step = 1, tol = exp(-10), lasso = FALSE) 
{
    X <- as.matrix(X)
    n <- length(Y)
    diff1 <- step
    o1 <- o <- beta_est(X, Y, w = rep(1, nrow(X)), lasso = lasso)
    beta <- beta1 <- o1$beta
    obj.OLS <- o1$obj
    for (i in 1:M) {
        old_beta <- beta
        res <- w_est(X, beta_obj = o$obj, lasso = lasso)
        w <- res$w
        o <- beta_est(X, Y, w, step = step, lasso = lasso)
        if (diff1 > tol) {
            beta <- o$beta
            obj.varGuid <- o$obj
        }
        else {
            step <- 0.1 * step
            next
        }
        diff1 = sum((beta - old_beta)^2, na.rm = TRUE)
    }
    obj.coef <- obj.lasso <- list()
    if (lasso == FALSE) {
        obj.coef$MLE <- obj.varGuid
        obj.coef$HC3 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC3"))
        obj.coef$HC <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC"))
        obj.coef$HC0 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC0"))
        obj.coef$HC1 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC1"))
        obj.coef$HC2 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC2"))
        obj.coef$HC4 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC4"))
        obj.coef$HC4m <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC4m"))
        obj.coef$HC5 <- coeftest(obj.varGuid, vcov = vcovHC(obj.varGuid, 
            "HC5"))
    }
    else {
        obj.lasso <- obj.OLS
        obj.OLS <- list()
    }
    list(beta = beta, obj.OLS = obj.OLS, obj.lasso = obj.lasso, 
        obj.varGuid = obj.varGuid, res = res$res, obj.varGuid.coef = obj.coef, 
        X = X)
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
