\name{sominit.random}
\alias{sominit.random}
\alias{sominit.random.default}
\alias{sominit.random.dist}
\alias{sominit.random.kernelmatrix}
\title{Initialise the prototypes of a SOM via some random sample}
\description{
Initialise the prototypes of a Self-Organising Map by choosing randomly
some subset of the data, or as centre of mass of the clusters of a
random partition of the data, or as uniformly sampled random points in
the hypercube spanned by the data.
}
\usage{
sominit.random(data, somgrid, method=c("prototypes","random","cluster"),\dots)
\method{sominit.random}{default}(data, somgrid, method=c("prototypes","random","cluster"),weights,\dots)
\method{sominit.random}{dist}(data, somgrid, method=c("prototypes","random","cluster"),weights,\dots)
\method{sominit.random}{kernelmatrix}(data, somgrid, method=c("prototypes","random","cluster"),weights,\dots)
}
\arguments{
  \item{data}{the data to which the SOM will be fitted. This can be,
    e.g., a matrix or data frame of observations (which should be scaled), a
    distance matrix or a kernel matrix}
  \item{somgrid}{a \code{somgrid} object}
  \item{method}{the initialisation method (see details)}
  \item{weights}{optional weights for the data points}
  \item{\dots}{additional parameters}
}
\details{
  There are three methods for generating the initial prototypes:
  \describe{
    \item{\code{"prototypes"}}{the standard method proceeds by choosing
    randomly a subset of the data of the requested size (with repetition
    if the grid size is larger than the data size). If the
    \code{weights} parameter is given, the probability of choosing a data
  point is proportionnal to its weight.}
  \item{\code{"random"}}{the \code{"random"} method generate prototypes
    randomly and uniformly in the hypercube spanned by the data for
    standard Euclidean data. For dissimilarity data or for the Kernel
    data, the method generates prototypes via random convex combinations
    of the data points. In the Euclidean case, the optional
  \code{weights} are not taken into account as they do
  not modify the definition of the span of the data. In the
  dissimilarity/kernel case, \code{weights} are used to define the prior
  importance of each observation in the random convex conbinations: if
  the first observation has weight 2 while the second has weight 1, then
  in average, the coefficient of the first observation in random convex
  combinations will be twice the one of the second observation. 
}
  \item{\code{"cluster"}}{the clustering initialisation method build a
    random partition the data into balanced clusters and uses as initial
  prototypes the centre of mass of those clusters. The optional
  \code{weights} are taken into account for balancing the clusters: the
  algorithm produces random clusters with approximate identical total weights.}
    }
  }
\value{
  A matrix containing appropriate initial prototypes. It should be
  compatible with the SOM prior structure (i.e., it should have as many
  rows as the size of the grid) and with the data. 
}
\author{Fabrice Rossi}
\seealso{\code{\link{sominit.pca}} for a PCA based initialisation.}
\examples{
X <- cbind(rnorm(500),rnorm(500))

sg <- somgrid(xdim=7,ydim=7,topo="rect")

proto <- sominit.random(X,sg)

plot(X,pch="+",col="red",xlim=range(X[,1],proto[,1]),
     ylim=range(X[,2],proto[,2]))
points(proto,pch=20)

}
\keyword{cluster}

