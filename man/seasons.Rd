% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seasons.R
\docType{data}
\name{seasons}
\alias{seasons}
\title{Seasons}
\format{
A data frame with 8 variables:
\describe{
\item{key_id}{\code{integer}. The unique ID number for the observation.}
\item{season_id}{\code{text}. The unique ID number for the season. Has the
format \code{S-####-#}, where the first number is the year in which the
season started, the second number is the tier. In the third tier, from the
1921-22 season through the 1957-58 season, there were North and South
subdivisions. These are indicated by a \code{-N} or \code{-S} suffix.}
\item{season}{\code{integer}. The year that the season started.}
\item{tier}{\code{integer}. The tier in English football. The possible
values are \code{1} through \code{4}.}
\item{division}{\code{text}. The division in English football. For the
current league structure, the possible values are \code{Premier League},
\code{Championship}, \code{League One}, and \code{League Two}. For previous
league structures, the possible values are \code{First Division},
\code{Second Division}, \code{Third Division}, and \code{Fourth Division}.}
\item{subdivision}{\code{text}. The subdivision in English football. In the
third tier, from the 1921-22 season through the 1957-58 season, there were
North and South subdivisions. The possible values are \code{North},
\code{South}, and \code{None}.}
\item{winner}{\code{text}. The name of the team that won the league.}
\item{count_teams}{\code{integer}. The number of teams in the league (that
actually played a match).}
}
}
\usage{
seasons
}
\description{
This dataset records all seasons in the English Football League and the
Premier League from inaugural season of the Football League (1888-89)
through the most recent season (2021-22). There is one observation per
season. It indicates the tier, division, subdivision, winner, and number of
teams for each season.
}
\keyword{datasets}
