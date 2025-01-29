\name{chooseq}
\alias{chooseq}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
optimize random effect # in mixed linear model
}
\usage{
chooseq(obj, y.obj, x.new, y.new)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
%%     ~~Describe \code{obj} here~~
}
  \item{y.obj}{
%%     ~~Describe \code{y.obj} here~~
}
  \item{x.new}{
%%     ~~Describe \code{x.new} here~~
}
  \item{y.new}{
%%     ~~Describe \code{y.new} here~~
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
function (obj, y.obj, x.new, y.new)
{
    rdef.all <- fakez(obj)
    dat.train <- lapply(1:length(rdef.all), function(i) {
        dat.train <- as.data.frame(scale(as.matrix(obj$x)))
        dat.train$y <- y.obj
        dat.train$z <- as.factor(as.character(rdef.all[[i]]$cluster))
        dat.train
    })
    q = lapply(1:length(dat.train), function(i) {
        length(levels(dat.train[[i]]$z))
    })
    dat.test = as.data.frame(x.new)
    nums <- unlist(lapply(dat.test, is.numeric))
    dat.test[, nums] <- scale(x.new[, nums])
    mlm <- lapply(1:length(dat.train), function(i) {
        tryCatch({
            if (length(rdef.all[[i]]$size) > (length(y.obj) -
                ncol(x.new) - 1)) {
                return(NA)
            }
            else {
                if (length(rdef.all[[i]]$size) == 1) {
                  mod.rlm <- lm(as.formula(paste("y~", paste(colnames(dat.test[,
                    nums]), collapse = "+"))), dat.train[[i]])
                }
                else {
                  mod.rlm <- lmer(as.formula(paste("y~", paste(colnames(dat.test[,
                    nums]), collapse = "+"), "+(1 | z)+(0)")),
                    dat.train[[i]])
                }
                center <- cent(dat = obj$x, cluster = rdef.all[[i]]$cluster)
                dat.test$z <- as.factor(as.character(clusters(x.new[,
                  nums], center)))
                yhat.rlm <- predict(mod.rlm, as.matrix(dat.test))
                sqrt(mean((y.new - yhat.rlm)^2))
            }
        }, error = function(e) {
            cat("ERROR :", conditionMessage(e), "\n")
        })
    })
    list(rmse = unlist(mlm), q = unlist(q), gamma = obj$gamma)
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
