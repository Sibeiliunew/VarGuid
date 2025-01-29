\name{simulation.sum}
\alias{simulation.sum}
\docType{data}
\title{
Data simulation
}
\description{
 simulate data and provide symbolic function  used for testing interaction detection algorithms now extended to handle correlations added more interesting simulations
}
\usage{data("simulation.sum")}
\format{
  The format is:
List of 12
 $ cobra2   :function (n = 1000, d = 10, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 29 12 42 3 12 3 31 44
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ cobra8   :function (n = 1000, d = 9, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 44 12 60 3 12 3 46 62
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ friedman1:function (n, d = 5, sd = 1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 63 15 80 3 15 3 65 82
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ friedman3:function (n, d = 4, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 82 15 114 3 15 3 84 116
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ inx1     :function (n = 1000, d = 6, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 116 10 141 3 10 3 118 143
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ inx2     :function (n = 1000, d = 6, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 143 10 158 3 10 3 145 160
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ inx3     :function (n = 1000, d = 3, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 160 10 173 3 10 3 162 175
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ lm       :function (n = 1000, d = 30, sd = 15, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 175 8 192 3 8 3 177 194
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ lmi      :function (n = 1000, d = 20, sd = 0.1, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 194 9 215 3 9 3 196 217
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ lmi2     :function (n = 1000, d = 15, sd = 15, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 217 10 233 3 10 3 219 235
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ sup      :function (n = 1000, d = 6, sd = 0.5, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 235 9 248 3 9 3 237 250
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
 $ sup2     :function (n = 1000, d = 10, sd = 0.5, corrv = 0)
  ..- attr(*, "srcref")= 'srcref' int [1:8] 250 10 266 3 10 3 252 268
  .. ..- attr(*, "srcfile")=Classes 'srcfilealias', 'srcfile' <environment: 0x12602e808>
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
by Hemant Ishwaran
}
\examples{
data(simulation.sum)
## maybe str(simulation.sum) ; plot(simulation.sum) ...
}
\keyword{datasets}
