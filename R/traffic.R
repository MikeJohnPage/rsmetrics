#' Measure the Network Traffic Transmitted Out from an Application
#'
#' This function retrieves and processes the metrics related to the network
#' traffic transmitted out from an application. The metrics are retrieved using
#' the `rsconnect::showMetrics` function and the results are converted to a
#' tibble and then returned in megabytes.
#'
#' @param from,until Date range starting timestamp (Unix timestamp or
#'  relative time delta such as "2d" or "3w").
#' 
#' @param interval Summarization interval. Data points at intervals less then
#'  this will be grouped. (Relative time delta e.g. "120s" or "1h" or "30d").
#'
#' @return A tibble containing the metrics with the values scaled to megabytes.
#' 
#' @export
#' 
#' @examples
#' \dontrun{
#'   # Return the average hourly network traffic per week over the past three
#'   # months
#'   traffic_data <- rsmetrics_traffic_transmitted(from = "90d", interval = "1w")
#' }
rsmetrics_traffic_transmitted <- function(from = "31d", until = "0d", interval = "1d") {
  df <- rsconnect::showMetrics(
    metricSeries = "docker_container_net",
    metricNames = "tx_bytes",
    from = from,
    until = until,
    interval = interval
  )

  df <- tibble::as_tibble(df)

  df$tx_bytes <- df$tx_bytes / (2^20)

  colnames(df)[colnames(df) == "tx_bytes"] <- "megabytes_transmitted"

  df$name <- NULL

  return(df)
}
