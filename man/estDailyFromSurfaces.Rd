% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estDailyFromSurfacesJ.R
\name{estDailyFromSurfaces}
\alias{estDailyFromSurfaces}
\alias{getConcFluxFromSurface}
\alias{getSurfaceEstimates}
\alias{bin_Qs}
\title{Estimates all daily values of Concentration, Flux, Flow-Normalized Concentration, and Flow Normalized Flux}
\usage{
estDailyFromSurfaces(eList, localsurfaces = NA, localDaily = NA)

getConcFluxFromSurface(eList, allLogQsByDayOfYear, localDaily,
  localsurfaces = NA)

getSurfaceEstimates(eList, localsurfaces = NA, localDaily = NA)

bin_Qs(localDaily)
}
\arguments{
\item{eList}{named list with at least the Daily and INFO dataframes, and the surface matrix}

\item{localsurfaces}{surface over-riding the one stored in eList.  Default is NA.}

\item{localDaily}{data frame to override eList$Daily.  Default is NA.}

\item{allLogQsByDayOfYear}{list}
}
\value{
egret object with altered Daily dataframe

Daily dataframe with yHat, SE, ConcDay and FluxDay calulated
}
\description{
Uses the surfaces matrix estimated in estSurfaces to estimate 6 daily time series
  and appends them to the Daily data frame.  The time series are (in order):
  yHat, the estimated natural log of concentration, dimensionless
  SE, the standard error of the natural log of concentration
  ConcDay, the estimated concentration in mg/L
  FluxDay, the estimated flux in kg/day
  FNConc, the flow-normalized concentration in mg/L
  FNFlux, the flow-normalized flux in kg/day

Bin the LogQ values by day-of-year.
}
\details{
The results are stored in an augmented version of the Daily data frame, which is returned as part of an EGRET object.
}
\examples{
eList <- Choptank_eList
#################################################
# This is usually done in modelEstimation:
Daily <- getDaily(eList)
surfaceIndexParameters<-surfaceIndex(Daily)
INFO <- eList$INFO
INFO$bottomLogQ<-surfaceIndexParameters[['bottomLogQ']]
INFO$stepLogQ<-surfaceIndexParameters[['stepLogQ']]
INFO$nVectorLogQ<-surfaceIndexParameters[['nVectorLogQ']]
INFO$bottomYear<-surfaceIndexParameters[['bottomYear']]
INFO$stepYear<-surfaceIndexParameters[['stepYear']]
INFO$nVectorYear<-surfaceIndexParameters[['nVectorYear']]
eList$INFO <- INFO
#################################################
\donttest{
Daily <- estDailyFromSurfaces(eList)
}
}
\keyword{statistics}
\keyword{water-quality}
