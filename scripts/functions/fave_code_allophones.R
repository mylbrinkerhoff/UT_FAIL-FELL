fave_code_allophones <- function(.df) {
  mutate(
    .df,
    phoneme = forcats::fct_collapse(
      label,
      FLEECE = c("iy", "iyF"),
      KIT = "i",
      FACE = c("ey", "eyF"),
      DRESS = "e",
      TRAP = "ae",
      LOT = "o",
      THOUGHT = "oh",
      GOAT = c("ow", "owF"),
      FOOT = "u",
      GOOSE = c("Tuw", "uw"),
      STRUT = "ʌ",
      PRICE = c("ay", "ay0"),
      MOUTH = "aw",
      CHOICE = "oy",
      NURSE = "*hr",
      NEAR = "iyr",
      START = "ahr",
      FORCE = "owr",
      CURE = "uwr"
    ),
    .after = label
  )
}
