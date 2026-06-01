# Vowel overlap function from Joey Stanley at BYU
# at https://joeystanley.com/blog/vowel-overlap-in-r-advanced-topics/
overlap <- function(F1, F2, vowel, method = "pillai") {
  vowel_data <- data.frame(vowel) %>%
    droplevels()

  if (nrow(vowel_data) < 1) {
    return(NA)
  } # not zero
  if (length(table(vowel_data)) < 2) {
    return(NA)
  } # both vowels are represented
  if (min(table(vowel_data)) < 5) {
    return(NA)
  } # there are at least 5 of each vowel

  if (method == "pillai") {
    summary(manova(cbind(F1, F2) ~ vowel))$stats["vowel", "Pillai"]
  } else if (method == "BA") {
    adehabitatHR::kerneloverlap(
      sp::SpatialPointsDataFrame(cbind(F1, F2), vowel_data),
      method = 'BA'
    )[2, 1]
  } else {
    warning("Improper method")
    return(NA)
  }
}
