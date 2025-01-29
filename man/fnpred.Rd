\name{fnpred}
\alias{fnpred}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
prediction using final model
}
\usage{
fnpred(mod, lmvo, newdata)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mod}{
%%     ~~Describe \code{mod} here~~
}
  \item{lmvo}{
%%     ~~Describe \code{lmvo} here~~
}
  \item{newdata}{
%%     ~~Describe \code{newdata} here~~
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
function (mod, lmvo, newdata)
{
    newdata <- as.matrix(newdata)
    dat.test <- as.data.frame(newdata)
    nums <- unlist(lapply(dat.test, is.numeric))
    if (dim(newdata)[2] == 1) {
        newdata <- data.frame(X = as.vector(newdata))
        nums <- c(1, 1)
    }
    if (length(mod$center) == 0) {
        dat.test$z <- NA
        mod$data$z <- lmvo$obj.varGuid$model$Y
    }
    else {
        dat.test$z <- as.character(clusters(newdata[, nums],
            mod$center))
    }
    if (length(lmvo$obj.OLS) == 0) {
        lmvo$obj.OLS <- lmvo$obj.lasso
        yhat0 <- yhat <- yhat2 <- predict(lmvo$obj.varGuid, as.matrix(newdata))
        yhat0b <- yhatb <- yhat2b <- predict(lmvo$obj.OLS, as.matrix(newdata))
    }
    else {
        yhat0 <- yhat <- yhat2 <- predict(lmvo$obj.varGuid, as.data.frame(newdata))
        yhat0b <- yhatb <- yhat2b <- predict(lmvo$obj.OLS, as.data.frame(newdata))
    }
    datrf <- data.frame(Y = c(lmvo$obj.varGuid$residuals), subset(lmvo$obj.varGuid$model,
        select = -c(1, ncol(lmvo$obj.varGuid$model))))
    if (dim(datrf)[2] == 1) {
        datrf <- data.frame(Y = c(lmvo$obj.varGuid$residuals),
            lmvo$X)
    }
    rfo <- rfsrc(Y ~ ., data = datrf)
    mod$data$y <- rfo$predicted.oob
    ycenter <- aggregate(y ~ z, data = mod$data, mean)
    yhat <- yhat0 + ycenter$y[match(dat.test$z, ycenter$z)]
    yhatb <- yhat0b + ycenter$y[match(dat.test$z, ycenter$z)]
    resd <- abs(lmvo$obj.varGuid$residuals) - sqrt(abs(lmvo$res$fitted.values))
    mod$data$y[which(resd < 0)] <- 0
    ycenter <- aggregate(y ~ z, data = mod$data, mean)
    yhat2 <- yhat0 + ycenter$y[match(dat.test$z, ycenter$z)]
    yhat2b <- yhat0b + ycenter$y[match(dat.test$z, ycenter$z)]
    data.frame(yhatVarGuidOriginal = yhat0, yhatVarGuid1 = yhat,
        yhatVarGuid2 = yhat2, yhatVarGuid3 = yhatb, yhatVarGuid4 = yhat2b,
        yhatOLS = yhat0b)
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
