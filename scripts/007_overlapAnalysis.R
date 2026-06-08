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

male_post1990 <- prelateral |>
  dplyr::filter(
    pre_1990 == FALSE,
    gender == "male",
    allophone %in% c("FLAIL", "SHELF")
  )

male_pre1990 <- prelateral |>
  dplyr::filter(
    pre_1990 == TRUE,
    gender == "male",
    allophone %in% c("FLAIL", "SHELF")
  )

female_post1990 <- prelateral |>
  dplyr::filter(
    pre_1990 == FALSE,
    gender != "male",
    allophone %in% c("FLAIL", "SHELF")
  )

female_pre1990 <- prelateral |>
  dplyr::filter(
    pre_1990 == TRUE,
    gender != "male",
    allophone %in% c("FLAIL", "SHELF")
  )

### overlap calculation
all_overlap <- fell_fail |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(fell_fail) / 2)
  )
all_overlap

### age group
pre_overlap <- pre_1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(pre_1990_df) / 2)
  )
pre_overlap

post_overlap <- post_1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(post_1990) / 2)
  )
post_overlap

### gender overlap
male_overlap <- male |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(male) / 2)
  )
male_overlap

female_overlap <- female |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(female) / 2)
  )
female_overlap

### gender and 1990 overlap
male_pre1990_overlap <- male_pre1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(male_pre1990) / 2)
  )
male_pre1990_overlap

male_post1990_overlap <- male_post1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(male_post1990) / 2)
  )
male_post1990_overlap

female_pre1990_overlap <- female_pre1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(female_pre1990) / 2)
  )
female_pre1990_overlap

female_post1990_overlap <- female_post1990 |>
  dplyr::summarise(
    bhatt = overlap(F1_lm, F2_lm, vowel = allophone, method = "BA"),
    bhatt_dist = -log(overlap(F1_lm, F2_lm, vowel = allophone, method = "BA")),
    pillai = overlap(F1_lm, F2_lm, vowel = allophone, method = "pillai"),
    pillai_p = manova_p(cbind(F1_lm, F2_lm) ~ allophone),
    pillai_cutoff = exp(1) / (nrow(female_post1990) / 2)
  )
female_post1990_overlap


overlap_table <- dplyr::bind_rows(
  all_overlap,
  pre_overlap,
  post_overlap,
  female_overlap,
  female_pre1990_overlap,
  female_post1990_overlap,
  male_overlap,
  male_pre1990_overlap,
  male_post1990_overlap,
  .id = "id"
) |>
  dplyr::mutate(
    id = c(
      "all",
      "pre-1990",
      "post-1990",
      "females",
      "females (pre-1990)",
      "females (post-1990)",
      "males",
      "males (pre-1990)",
      "males (post-1990)"
    )
  )

overlap_table |>
  readr::write_csv(
    file = here::here(
      "data",
      "overlap_measures.csv"
    )
  )
