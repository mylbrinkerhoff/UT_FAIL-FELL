#----------------------------------------------------------------------------------------
# File: 002_loadData.R
# Project: UT_FAIL-FELL
# Author: Mykel Brinkerhoff
# Date: 2026-05-31 (Su)
# Description: What does this script do?
#
# Usage:
#   Rscript 002_loadData.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### load demographics
demographs <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "demographics.csv"
  )
)

### load fave_results
ut_003 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_003_points.csv"
  )
)

ut_004 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_004_points.csv"
  )
)

ut_005 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_005_points.csv"
  )
)

ut_006 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_006_points.csv"
  )
)

ut_007 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_007_points.csv"
  )
)

ut_008 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_008_points.csv"
  )
)

ut_009 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_009_points.csv"
  )
)

ut_010 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_010_points.csv"
  )
)

ut_011 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_011_points.csv"
  )
)

ut_012 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_012_points.csv"
  )
)

ut_013 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_013_points.csv"
  )
)

ut_014 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_014_points.csv"
  )
)

ut_015 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_015_points.csv"
  )
)

ut_016 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_016_points.csv"
  )
)

ut_017 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_017_points.csv"
  )
)

ut_018 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_018_points.csv"
  )
)

ut_019 <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "fave_results",
    "UT_019_points.csv"
  )
)

### joining UT_### and demographics dataframes
ut_vowels <- dplyr::bind_rows(
  ut_003,
  ut_004,
  ut_005,
  ut_006,
  ut_007,
  ut_008,
  ut_009,
  ut_010,
  ut_011,
  ut_012,
  ut_013,
  ut_014,
  ut_015,
  ut_016,
  ut_017,
  ut_018,
  ut_019
) |>
  dplyr::left_join(
    demographs,
    by = join_by(file_name, group)
  )
