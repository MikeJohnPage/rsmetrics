% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hours.R
\name{rsmetrics_hours}
\alias{rsmetrics_hours}
\title{Retrieve Metrics for Hours of Application Usage}
\usage{
rsmetrics_hours(from = "31d", until = "0d", interval = "1d")
}
\arguments{
\item{from, until}{Date range starting timestamp (Unix timestamp or
relative time delta such as "2d" or "3w").}

\item{interval}{Summarization interval. Data points at intervals less then
this will be grouped. (Relative time delta e.g. "120s" or "1h" or "30d").}
}
\value{
A tibble containing the usage statistics, with the timestamp column

converted to a \code{POSIXct} object.
}
\description{
This function retrieves the usage statistics for application hours in a
specified time range. It returns the data as a tibble with timestamps
converted to the \code{POSIXct} format.
}
\examples{
\dontrun{
  # Return the average hourly usage per week over the past three months
  rsmetrics_hours(from = "90d", until = "0d", interval = "1w")
}
}
