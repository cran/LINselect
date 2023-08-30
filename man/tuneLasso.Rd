\name{tuneLasso}
\alias{tuneLasso}
\title{tuneLasso}
\description{tune the  lasso parameter in the 
regression model : \eqn{Y= X \beta + \sigma N(0,1)}
using the lasso or the gauss-lasso method}
\usage{tuneLasso(Y, X, normalize = TRUE, method = c("lasso", "Glasso"), 
    dmax = NULL, Vfold = TRUE, V = 10, LINselect = TRUE, a = 0.5, 
    K = 1.1, verbose = TRUE, max.steps = NULL)}
\arguments{
  \item{Y}{vector with n components : response variable.}
  \item{X}{matrix with n rows and p columns : covariates.}
  \item{normalize}{logical : corresponds to the input \code{normalize}
of the functions \code{\link[elasticnet]{enet}} and \code{\link[elasticnet]{cv.enet}}. \cr If TRUE the variates \code{X} are
normalized.}
  \item{method}{vector of characters whose components are subset of
(\dQuote{lasso}, \dQuote{Glasso})}
  \item{dmax}{integer : maximum number of variables in the lasso
estimator. \code{dmax} \eqn{\le} D where \cr 
D = min (3*p/4 , n-5) if  p\eqn{ \ge }n
\cr D= min(p,n-5) if
p < n. \cr Default : \code{dmax} = D.}
  \item{Vfold}{logical : if TRUE the tuning is done by Vfold-CV}
  \item{V}{integer. Gives the value of V in the Vfold-CV procedure}
  \item{LINselect}{logical : if TRUE the tuning is done by LINselect}
  \item{a}{scalar : value of the parameter \eqn{\alpha} in the LINselect criteria}
  \item{K}{scalar : value of the parameter \eqn{K} in the LINselect criteria}
  \item{verbose}{logical : if TRUE a trace of the current process is displayed in real time.}
  \item{max.steps}{integer : maximum number of steps in the lasso
procedure. \cr Corresponds to the input \code{max.steps} of the function
\code{\link[elasticnet]{enet}}. \cr
Default :
\code{max.steps} = 2*min(p,n)}
}

\value{A list with one or two components according to 
\code{method}. \cr
\code{lasso} if \code{method} contains "lasso" is a list with  one or two components
according to \code{Vfold} and \code{LINselect}.

\itemize{
\item{\code{Ls} if \code{LINselect}=TRUE. A list with components
\itemize{
\item{\code{support}: vector of integers. Estimated support of the
parameter vector \eqn{\beta}.}
\item{\code{coef}: vector whose first component is the estimated
intercept. \cr The other components are the estimated non zero
coefficients.}
\item{\code{fitted}: vector with length n. Fitted value of
the response.}
\item{\code{crit}: vector containing the values of the criteria for
each value of \code{lambda}.}
\item{\code{lambda}: vector containing the values of the tuning
parameter of the lasso algorithm.}
}
}
\item{\code{CV} if \code{Vfold}=TRUE. A list with components
\itemize{
\item{\code{support}: vector of integers. Estimated support of the
parameter vector \eqn{\beta}.}
\item{\code{coef}: vector whose first component is the estimated
intercept. \cr The other components are the estimated non zero
coefficients.}
\item{\code{fitted}: vector with length n. Fitted value of
the response.}
\item{\code{crit}: vector containing the values of the criteria for
each value of \code{lambda}.}
\item{\code{crit.err}: vector containing the estimated
standard-error of the criteria.}
\item{\code{lambda}: vector containing the values of the tuning
parameter of the lasso algorithm.}
}
}
}
\code{Glasso} if \code{method} contains "Glasso". The same as \code{lasso}.}
\references{See Baraud et al. 2010 
\url{http://hal.archives-ouvertes.fr/hal-00502156/fr/} \cr
Giraud et al., 2013,
\url{https://projecteuclid.org/DPubS?service=UI&version=1.0&verb=Display&handle=euclid.ss/1356098553}}
\author{Yannick Baraud, Christophe Giraud, Sylvie Huet}
\note{library \code{elasticnet} is loaded.}



\examples{#source("charge.R")
library("LINselect")

# simulate data with
\dontrun{ex <- simulData(p=100,n=100,r=0.8,rSN=5)}

\dontrun{ex1.tuneLasso <- tuneLasso(ex$Y,ex$X)}

\dontrun{data(diabetes)}
\dontrun{attach(diabetes)}
\dontrun{ex.diab <- tuneLasso(y,x2)}
\dontrun{detach(diabetes)}


}
