\name{plotpath}
\alias{plotpath}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A Capitalized Title (ideally limited to 65 characters)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotpath(sol)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sol}{
%%     ~~Describe \code{sol} here~~
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
function (sol) 
{
    nGamma <- sol$nGamma
    df.paths <- data.frame(x = c(), y = c(), group = c())
    for (j in 1:nGamma) {
        pcs <- sol$U[[j]]
        x <- pcs[1, ]
        y <- pcs[2, ]
        df <- data.frame(x.1 = pcs[1, ], x.2 = pcs[2, ], group = 1:length(x))
        df.paths <- rbind(df.paths, df)
    }
    data_plot <- ggplot(data = df.paths, aes(x = x.1, y = x.2))
    data_plot <- data_plot + geom_path(aes(group = group), colour = "grey30", 
        alpha = 0.5)
    data_plot <- data_plot + xlab("pcs.1") + ylab("pcs.2")
    data_plot + theme_bw()
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
