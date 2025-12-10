\name{VARselect}
\alias{VARselect}
\title{VARselect}
\description{Estimation in the regression model : \eqn{Y= X \beta + \sigma N(0,1)}\cr
Variable selection by choosing the best predictor among
predictors emanating \cr from different methods as lasso,
elastic-net, adaptive lasso, pls, randomForest.}
\usage{VARselect(Y, X, dmax = NULL, normalize = TRUE, method = c("lasso", 
    "ridge", "pls", "en", "ALridge", "ALpls", "rF", "exhaustive"), 
    pen.crit = NULL, lasso.dmax = NULL, ridge.dmax = NULL, pls.dmax = NULL, 
    en.dmax = NULL, ALridge.dmax = NULL, ALpls.dmax = NULL, rF.dmax = NULL, 
    exhaustive.maxdim = 5e+05, exhaustive.dmax = NULL, en.lambda = c(0.01, 
        0.1, 0.5, 1, 2, 5), ridge.lambda = c(0.01, 0.1, 0.5, 
        1, 2, 5), rF.lmtry = 2, pls.ncomp = 5, ALridge.lambda = c(0.01, 
        0.1, 0.5, 1, 2, 5), ALpls.ncomp = 5, max.steps = NULL, 
    K = 1.1, verbose = TRUE, long.output = FALSE)}
\arguments{
  \item{Y}{vector with n components : response variable.}
  \item{X}{matrix with n rows and p columns : covariates.}
  \item{dmax}{integer : maximum number of variables in the lasso
estimator. \code{dmax} \eqn{\le} D where \cr 
D = min (3*p/4 , n-5) if  p\eqn{ \ge }n
\cr D= min(p,n-5) if
p < n. \cr Default : \code{dmax} = D.}
  \item{normalize}{logical : if TRUE the columns of X are scaled}
  \item{method}{vector of characters  whose components are subset of \cr
\dQuote{lasso}, \dQuote{ridge}, \dQuote{pls}, \dQuote{en},
\dQuote{ALridge}, \dQuote{ALpls}, \dQuote{rF},
\dQuote{exhaustive}.}
  \item{pen.crit}{vector with \code{dmax}+1 components : for d=0,
..., \code{dmax}, \code{penalty[d+1]} gives the value of the
penalty for the dimension d. Default : \code{penalty} = NULL. In
that case, the
penalty will be calculated by the function penalty. }
  \item{lasso.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{ridge.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{pls.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{en.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{ALridge.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{ALpls.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{rF.dmax}{integer lower than \code{dmax}, default = \code{dmax}.}
  \item{exhaustive.maxdim}{integer : maximum number of subsets of
covariates considered  in the exhaustive method. See details.}
  \item{exhaustive.dmax}{integer lower than \code{dmax}, default = \code{dmax}}
  \item{en.lambda}{vector : tuning parameter of the
ridge. It is the input parameter \code{lambda} of function
\code{\link[elasticnet]{enet}}}
  \item{ridge.lambda}{vector : tuning parameter of the
ridge. It is the input parameter lambda of function
\code{lmridge:lm.ridge}}
  \item{rF.lmtry}{vector : tuning paramer \code{mtry} of function
\code{\link[randomForest]{randomForest}}, \code{mtry} =p/\code{rF.lmtry}.}
  \item{pls.ncomp}{integer : tuning parameter of the pls. It is the
input parameter \code{ncomp} of the function
\code{\link[pls:mvr]{plsr}}. See details.}
  \item{ALridge.lambda}{similar to
\code{ridge.lambda} in the adaptive lasso procedure.}
  \item{ALpls.ncomp}{similar to \code{pls.ncomp} in the
adaptive lasso procedure. See details.}
  \item{max.steps}{integer. Maximum number of steps in the lasso
procedure. Corresponds to the input \code{max.steps} of the function
\code{\link[elasticnet]{enet}}. \cr
Default :
\code{max.steps} = 2*min(p,n)}
  \item{K}{scalar : value of the parameter \eqn{K} in the LINselect criteria.}
  \item{verbose}{logical : if TRUE a trace of the current process is displayed in real time.}
  \item{long.output}{logical : if FALSE only the component summary
will be returned. See Value.}
}
\details{When method is \code{pls} or \code{ALpls}, the
\code{LINselect} procedure is carried out considering the number
of components in the \code{pls} method as the tuning
parameter. \cr This tuning parameter varies from 1 to \code{pls.ncomp}.

When method is \code{exhaustive}, the maximum
number of variate d is calculated as
follows.\cr
Let q be the largest integer such that \code{choose(p,q)} <
\code{exhaustive.maxdim}. Then d = \code{min(q, exhaustive.dmax,dmax)}.}
\value{A list with at least \code{length(method)}
components. \cr 
For each procedure in \code{method}  a list with components \cr
\itemize{
\item{\code{support}: vector of integers. Estimated support of the
parameters \eqn{\beta} for the considered procedure.}
\item{\code{crit}: scalar equals to the LINselect criteria
calculated in the estimated support.}
\item{\code{fitted}: vector  with length n. Fitted value of
the response calculated when the support of \eqn{ \beta}
equals \code{support}.}
\item{\code{coef}: vector whose first component is the estimated
intercept. \cr The other components are the estimated non zero
coefficients when the support of \eqn{ \beta}
equals \code{support}.}
}
If \code{length(method)} > 1, the additional component \code{summary} is a list with three
components:
\itemize{ 
\item{\code{support}: vector of integers. Estimated support of the
parameters \eqn{\beta} corresponding to the minimum
of the criteria among all procedures.}
\item{\code{crit}:  scalar. Minimum value of the
criteria among all procedures.} 
\item{\code{method}: vector of characters. Names of the
procedures  for
which the minimum is reached}
}
If \code{pen.crit = NULL}, the component \code{pen.crit} gives the
values of the penalty calculated by the function \code{penalty}.
If \code{long.output} is TRUE the component named
\code{chatty} is a list  with \code{length(method)}
components. \cr 
For each procedure in \code{method}, a list with components
\itemize{
\item{\code{support} where \code{support[[l]]} is a vector of
integers containing an estimator of the support of the
parameters \eqn{ \beta}.}
\item{\code{crit} : vector where \code{crit[l]} contains the
value of the LINselect criteria calculated in
\code{support[[l]]}.}
}}
\references{See Baraud  et al. 2010 
\url{http://hal.archives-ouvertes.fr/hal-00502156/fr/} \cr
Giraud et al., 2013,
\url{https://projecteuclid.org/DPubS?service=UI&version=1.0&verb=Display&handle=euclid.ss/1356098553}}
\author{Yannick Baraud, Christophe Giraud, Sylvie Huet}
\note{When method is \code{lasso}, library \code{elasticnet} is loaded.

When method is \code{en}, library \code{elasticnet} is loaded.

When method is \code{ridge}, library \code{MASS} is loaded.

When method is \code{rF}, library \code{randomForest} is loaded.

When method is \code{pls}, library \code{pls} is loaded.

When method is \code{ALridge}, libraries \code{MASS} and \code{elasticnet} are loaded.

When method is \code{ALpls}, libraries \code{pls} and \code{elasticnet} are loaded.

When method is \code{exhaustive}, library \code{gtools}
is loaded.}



\examples{#source("charge.R")
library("LINselect")

# simulate data with
# beta=c(rep(2.5,5),rep(1.5,5),rep(0.5,5),rep(0,p-15))
ex <- simulData(p=100,n=100,r=0.8,rSN=5)

\dontrun{ex1.VARselect <- VARselect(ex$Y,ex$X,exhaustive.dmax=2)}

\dontrun{data(diabetes)}
\dontrun{attach(diabetes)}
\dontrun{ex.diab <- VARselect(y,x2,exhaustive.dmax=5)}
\dontrun{detach(diabetes)}


}
