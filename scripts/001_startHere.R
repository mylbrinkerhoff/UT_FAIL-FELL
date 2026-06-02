#----------------------------------------------------------------------------------------
# File: 001_startHere.R
# Project: UT_FAIL-FELL
# Author: Mykel Brinkerhoff
# Date: 2026-05-31 (Su)
# Description: What does this script do?
#
# Usage:
#   Rscript 001_startHere.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### install packages if not yet installed
# renv::install(
#   packages = c(
#     "tidyverse",
#     "viridis",
#     "here",
#     "remotes",
#     "tidynorm",
#     "ggokabeito",
#     "adehabitatHR",
#     "sp",
#     "purrr",
#     "reticulate",
#     "geomtextpath"
#   )
# )

# remotes::install_github("joeystanley/joeyr") # helper functions from joeystanley
# remotes::install_github("joeystanley/joeysvowels") # vowel datasets

### restore R session and packages to versions found in the renv.lock file
renv::restore()

### Load helper packages
library(dplyr) # for data manipulation, graphic, and data wrangling
library(readr) # loading in data
library(stringr) # look for stuff in strings
library(purrr)
library(forcats)
library(reticulate)
library(ggplot2) # for plotting
library(geomtextpath)
library(here) # for creating pathways relative to the top-level directory
# library(remotes) # allows accessing github
library(joeyr) # needed for the find_outliers function
library(ggokabeito) # colorblind friendly color based on Okabe-Ito scheme
library(sp) # needed for Bhattacharyya's Affinity calculation
library(adehabitatHR) # needed for Bhattacharyya's Affinity calculation


### Load vowel specific packages
library(tidynorm) # package for vowel normalization

### loading functions found in the /scripts/functions/ folder
source(here::here(
  "scripts",
  "functions",
  "overlap.R"
))

source(here::here(
  "scripts",
  "functions",
  "fave_code_allophones.R"
))
