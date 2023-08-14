#' Retrieve Metrics for Hours of Application Usage
#'
#' This function retrieves the usage statistics for application hours in a 
#' specified time range. It returns the data as a tibble with timestamps
#' converted to the `POSIXct` format.
#'
#' @param from,until,interval Date range starting timestamp (Unix timestamp or
#'  relative time delta such as "2d" or "3w").

#' @return A tibble containing the usage statistics, with the timestamp column
#' 
#' converted to a `POSIXct` object.
#' @export
#' 
#' @examples
#' \dontrun{
#'   # Return the average hourly usage per week over the past three months
#'   rsmetrics_hours(from = "90d", until = "0d", interval = "1w")
#' }
rsmetrics_hours <- function(from = "31d", until = "0d", interval = "1d") {
  df <- rsconnect::showUsage(
    usage = "hours",
    from = from,
    until = until,
    interval = interval
  )

  df <- tibble::as_tibble(df)

  df$timestamp <- as.numeric(df$timestamp)
  df$timestamp <- as.POSIXct(df$timestamp, origin = "1970-01-01")

  return(df)
}
