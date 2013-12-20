\name{penalty}
\alias{penalty}
\title{penalty}
\description{Calculate the penalty function for estimators selection.}
\usage{penalty(Delta, n, p, K)}
\arguments{
  \item{Delta}{vector with \code{Dmax}+1 components : weights in the penalty function.}
  \item{n}{integer : number of observatons.}
  \item{p}{integer : number of variables.}
  \item{K}{scalar : constant in the penalty function.}
}

\value{A vector with the same length as Delta: for each \code{d}=0, ..., \code{Dmax}, let
\code{N}=\code{n}-\code{d}, \code{D}=\code{d+1} and \cr
\code{pen(d) = x K N/(N-1)} where  \code{x} satisfies
\cr
\cr
\eqn{\phi}\code{(x) = exp(-Delta(d))}, when \code{Delta(d)<50}, 
\cr
where  \eqn{\phi}\code{(x)=pf(q=x/(D+2),df1=D+2,df2=N-1,lower.tail=F)-(x/D)pf(q=(N+1)x/D(N-1),df1=D,df2=N+1,lower.tail=F)}
\cr
\cr
\eqn{\psi}\code{(x) = Delta(d)}, when
\code{Delta(d)}\eqn{\ge}\code{50}, \cr
where  \eqn{\psi}\code{(x)=lbeta(1+D/2,(N-1)/2)-log(2(2x+(N-1)D)/((N-1)(N+2)x))-(N-1)/2log((N-1)/(N-1+x))-(D/2)log(x/(N-1+x))
}}

\author{Yannick Baraud, Christophe Giraud, Sylvie Huet}
\note{The values of the penalty function greater than
1e+08 are set to 1e+08.

If for some \code{Delta(d)} the
equation \eqn{\phi}\code{(x) = exp(-Delta(d)/(d+1))}  has no
solution, then the execution is stopped.}




