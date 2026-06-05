#----------------------------------------------------------------------------------------
# File: .R
# Project:
# Author: Mykel Brinkerhoff
# Date: YYYY-MM-DD (M-Su)
# Description: What does this script do?
#
# Usage:
#   Rscript .R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### Remove outliers by F0
vowels_clean <- ut_vowels_sub |>
  dplyr::mutate(
    F0z = (f0 - mean(f0, na.rm = T)) / sd(f0, na.rm = T),
    .by = group
  ) |>
  dplyr::mutate(
    F0_outlier = dplyr::if_else(abs(F0z) > 3, "outlier", "OK"),
  ) |>
  dplyr::filter(
    F0_outlier == "OK"
  )

# Remove outliers by formants
vowels_clean <- vowels_clean |>
  dplyr::mutate(
    is_outlier = joeyr::find_outliers(F1, F2, keep = 0.95),
    .by = c("allophone"),
  ) |>
  dplyr::filter(
    !is_outlier
  )

# # Remove outliers by energy
# zapotec_clean$energy[zapotec_clean$energy == 0] <- NA

# zapotec_energy <- zapotec_clean |>
#   dplyr::mutate(
#     log_energy = log10(energy)
#   ) |>
#   dplyr::filter(
#     !is.na(log_energy)
#   )

# zpq <- zapotec_energy
