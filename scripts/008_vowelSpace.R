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

### creating label means
ut_means <- vowels_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = phoneme_ipa
  )

ut_1990_means <- vowels_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c(phoneme_ipa, pre_1990)
  )

ut_county_means <- vowels_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c(phoneme_ipa, hometown_county)
  )

ut_gender_means <- vowels_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c(phoneme_ipa, gender)
  )

### Plotting vowels by herz
vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2,
      y = F1,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space",
    x = "F2 (Hz)",
    y = "F1 (Hz)"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_hz

### ∆F normalization
vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2_df,
      y = F1_df,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space",
    x = "F2/∆F",
    y = "F1/∆F"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_df

vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2_df,
      y = F1_df,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_gender_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space (by gender)",
    x = "F2/∆F",
    y = "F1/∆F"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::facet_wrap(. ~ gender) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_df_gender

### vowel plots in neary
vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_neary

vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_gender_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space (by gender)",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::facet_wrap(. ~ gender) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_neary_gender

vowels_norm |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = phoneme_ipa,
      label = phoneme_ipa
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(
    data = ut_1990_means,
    colour = "black"
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT English vowel space (pre 1990)",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::facet_wrap(. ~ pre_1990) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> vowels_neary_1990

### saving the plots
# vowels_neary |>
# ggplot2::
