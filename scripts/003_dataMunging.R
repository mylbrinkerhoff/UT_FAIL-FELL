#----------------------------------------------------------------------------------------
# File: 003_dataMunging.R
# Project: UT_FAIL-FELL
# Author: Mykel Brinkerhoff
# Date: 2026-06-01 (M)
# Description: What does this script do?
#
# Usage:
#   Rscript 003_dataMunging.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

ut_vowels_sub <- ut_vowels |>
  fave_code_allophones() |>
  dplyr::filter(
    stress == c(1, 2),
    group != "intvr",
    # !phoneme %in%
    #   c(
    #     "PRICE",
    #     "MOUTH",
    #     "CHOICE",
    #     "NURSE",
    #     "NEAR",
    #     "START",
    #     "FORCE",
    #     "SQUARE",
    #     "CURE"
    #   )
  ) |>
  joeyr::code_allophones(
    .old_col = phoneme,
    .pre_seg = pre_seg,
    .fol_seg = fol_seg
  ) |>
  dplyr::arrange(file_name, time)
