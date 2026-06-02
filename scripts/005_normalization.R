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

vowels_norm <- vowels_clean |>
  tidynorm::norm_nearey(
    F1:F3,
    .by = group
  ) |>
  tidynorm::norm_deltaF(
    F1:F3,
    .by = group
  )
