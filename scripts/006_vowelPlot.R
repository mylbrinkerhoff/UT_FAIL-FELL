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

### prelateral
prelateral <- vowels_norm |>
  dplyr::filter(
    allophone_environment == "prelateral",
    !allophone %in%
      c(
        "CHILD",
        "TALC",
        "FAULT",
        "GOLF",
        "JOLT",
        "MULCH",
        "SPOOL",
        "WOLF"
      )
  ) |>
  dplyr::mutate(
    allophone = factor(allophone)
  )

prelateral_means <- prelateral |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = allophone
  )

prelateral_1990_means <- prelateral |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c(allophone, pre_1990)
  )

prelateral_county_means <- prelateral |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c(allophone, hometown_county)
  )

### plotting all speakers
prelateral |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = allophone,
      label = allophone
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = prelateral_means, colour = "black") +
  ggokabeito::scale_color_okabe_ito() +
  # viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT non-low front prelateral vowels",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") -> ut_prelateral
ut_prelateral

prelateral |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = allophone,
      label = allophone
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = prelateral_1990_means, colour = "black") +
  ggokabeito::scale_color_okabe_ito() +
  # viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT non-low front prelateral vowels (born before 1990)",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none") +
  ggplot2::facet_wrap(. ~ pre_1990) -> ut_prelateral_1990
ut_prelateral_1990

prelateral |>
  ggplot2::ggplot(
    aes(
      x = F2_lm,
      y = F1_lm,
      colour = allophone,
      label = allophone
    )
  ) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = prelateral_county_means, colour = "black") +
  ggokabeito::scale_color_okabe_ito() +
  # viridis::scale_colour_viridis(discrete = TRUE) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(
    title = "UT non-low front prelateral vowels (by county)",
    x = "F2 (Neary)",
    y = "F1 (Neary)"
  ) +
  ggplot2::theme_bw() +
  # ggplot2::theme(legend.position = "none") +
  ggplot2::facet_wrap(. ~ hometown_county) -> ut_prelateral_county
ut_prelateral_county

ggplot2::ggsave(
  here::here(
    "output",
    "plots",
    "prelaterals_ut.png"
  ),
  plot = ut_prelateral,
  height = 4,
  width = 6,
  units = "in",
  dpi = 600
)

ggplot2::ggsave(
  here::here(
    "output",
    "plots",
    "prelaterals_ut_pre1990.png"
  ),
  plot = ut_prelateral_1990,
  height = 4,
  width = 6,
  units = "in",
  dpi = 600
)

ggplot2::ggsave(
  here::here(
    "output",
    "plots",
    "prelaterals_ut_county.png"
  ),
  plot = ut_prelateral_county,
  height = 4,
  width = 6,
  units = "in",
  dpi = 600
)
