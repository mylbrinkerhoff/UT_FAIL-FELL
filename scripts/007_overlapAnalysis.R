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

### create dataframes for FAIL-FELL merger based on gender, pre-1990, hometown_county, and overall.

### overall
fell_fail <- prelateral |>
  dplyr::filter(allophone %in% c("FLAIL", "SHELF"))

### gender splits
male <- prelateral |>
  dplyr::filter(
    gender == "male",
    allophone %in% c("FLAIL", "SHELF")
  )

female <- prelateral |>
  dplyr::filter(
    gender != "male",
    allophone %in% c("FLAIL", "SHELF")
  )

### pre-1990
pre_1990_df <- prelateral |>
  dplyr::filter(
    pre_1990 == TRUE,
    allophone %in% c("FLAIL", "SHELF")
  )

post_1990 <- prelateral |>
  dplyr::filter(
    pre_1990 == FALSE,
    allophone %in% c("FLAIL", "SHELF")
  )

### overlap calculation
all_overlap <- fell_fail |>
  dplyr::summarise(
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(fell_fail) / 2),
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")
  )
all_overlap

### age group
pre_overlap <- pre_1990 |>
  dplyr::summarise(
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(pre_1990_df) / 2),
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")
  )
pre_overlap

post_overlap <- post_1990 |>
  dplyr::summarise(
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(post_1990) / 2),
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")
  )
post_overlap

### gender overlap
male_overlap <- male |>
  dplyr::summarise(
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(male) / 2),
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")
  )
male_overlap

female_overlap <- female |>
  dplyr::summarise(
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(female) / 2),
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")
  )
female_overlap


overlap_table <- dplyr::bind_rows(
  all_overlap,
  pre_overlap,
  post_overlap,
  female_overlap,
  male_overlap,
  .id = "id"
) |>
  dplyr::mutate(
    id = c("all", "pre-1990", "post-1990", "females", "males")
  )

overlap_table
