#' Measure the Number of Connections from an Application
#'
#' This function retrieves and processes the metrics related to the number of
#' connections from an application. The metrics are retrieved using the
#' `rsconnect::showMetrics` function and the results are converted to a tibble.
#'
#' @param from,until Date range starting timestamp (Unix timestamp or
#'  relative time delta such as "2d" or "3w").
#' 
#' @param interval Summarization interval. Data points at intervals less then
#'  this will be grouped. (Relative time delta e.g. "120s" or "1h" or "30d").
#'
#' @return A tibble containing the connection metrics within the specified time
#'   range and interval.
#' 
#' @export
#' 
#' @examples
#' \dontrun{
#'   rsmetrics_connections("15d", "1d", "1h")
#' }
rsmetrics_connections <- function(from = "31d", until = "0d", interval = "1d") {
  df <- rsconnect::showMetrics(
    metricSeries = "container_status",
    metricNames = "connect_count",
    from = from,
    until = until,
    interval = interval
  )

  df <- tibble::as_tibble(df)

  df$name <- NULL

  return(df)
}