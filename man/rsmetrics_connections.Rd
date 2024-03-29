% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connections.R
\name{rsmetrics_connections}
\alias{rsmetrics_connections}
\title{Measure the Number of Connections from an Application}
\usage{
rsmetrics_connections(from = "31d", until = "0d", interval = "1d")
}
\arguments{
\item{from, until}{Date range starting timestamp (Unix timestamp or
relative time delta such as "2d" or "3w").}

\item{interval}{Summarization interval. Data points at intervals less then
this will be grouped. (Relative time delta e.g. "120s" or "1h" or "30d").}
}
\value{
A tibble containing the connection metrics within the specified time
range and interval.
}
\description{
This function retrieves and processes the metrics related to the number of
connections from an application. The metrics are retrieved using the
\code{rsconnect::showMetrics} function and the results are converted to a tibble.
}
\examples{
\dontrun{
  rsmetrics_connections("15d", "1d", "1h")
}
}
