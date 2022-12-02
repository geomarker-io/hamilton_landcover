nlcd_legend <-
  tibble::tribble(
    ~value, ~landcover_class, ~landcover, ~green,
    11, "water", "water", FALSE,
    12, "water", "ice/snow", FALSE,
    21, "developed", "developed open", TRUE,
    22, "developed", "developed low intensity", TRUE,
    23, "developed", "developed medium intensity", FALSE,
    24, "developed", "developed high intensity", FALSE,
    31, "barren", "rock/sand/clay", FALSE,
    41, "forest", "deciduous forest", TRUE,
    42, "forest", "evergreen forest", TRUE,
    43, "forest", "mixed forest", TRUE,
    51, "shrubland", "dwarf scrub", TRUE,
    52, "shrubland", "shrub/scrub", TRUE,
    71, "herbaceous", "grassland", TRUE,
    72, "herbaceous", "sedge", TRUE,
    73, "herbaceous", "lichens", TRUE,
    74, "herbaceous", "moss", TRUE,
    81, "cultivated", "pasture/hay", TRUE,
    82, "cultivated", "cultivated crops", TRUE,
    90, "wetlands", "woody wetlands", TRUE,
    95, "wetlands", "emergent herbaceous wetlands", TRUE
  )
