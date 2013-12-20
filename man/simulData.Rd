\name{simulData}
\alias{simulData}
\title{simulData}
\description{Function to simulate data \eqn{Y = X \beta + \sigma N(0, 1)}}
\usage{simulData(p = 100, n = 100, beta = NULL, C = NULL, r = 0.95, 
    rSN = 10)}
\arguments{
  \item{p}{integer : number of variates. Should be >15 if \code{beta=NULL}}
  \item{n}{integer : number of observations}
  \item{beta}{vector with \code{p} components. See details.}
  \item{C}{matrix \code{p x p}. Covariance matrix of X. See details.}
  \item{r}{scalar for calculating the covariance of X when \code{C=NULL}.}
  \item{rSN}{scalar : ratio signal/noise}
}
\details{When \code{beta} is \code{NULL}, then \code{p} should be
greater than 15 and
\code{beta=c(rep(2.5,5),rep(1.5,5),rep(0.5,5),rep(0,p-15))}

When \code{C} is \code{NULL}, then \code{C} is block
diagonal with \cr
\code{C[a,b] = r**abs(a-b)} for \eqn{1 \le a, b \le 15} \cr
\code{C[a,b] = r**abs(a-b)} for \eqn{16 \le a, b \le p} \cr

The lines of \code{X} are \code{n} i.i.d. gaussian variables with
mean 0 and covariance matrix \code{C}.

The variance \code{sigma**2} equals the squared euclidean
norm of \eqn{X \beta} divided by \code{rSN*n}.}
\value{A list with components :
\item{Y}{vector \code{n} : \eqn{Y = X \beta + \sigma N(0, 1)}}
\item{X}{matrix \code{n x p} : values of the covariates. See
details.}
\item{C}{matrix \code{p x p}. See details}
\item{sigma}{scalar. See details.}
\item{beta}{vector with \code{p} components. See details.}}

\author{Yannick Baraud, Christophe Giraud, Sylvie Huet}
\note{Library \code{mvtnorm} is loaded.}




