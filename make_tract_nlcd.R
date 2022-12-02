library(tidyverse)
library(sf)
library(terra)
library(CODECtools)
source("nlcd_legend.R")

tract <- terra::vect(cincy::tract_tigris_2010)

# NLCD - greenspace
nlcd_hc_2019 <- terra::rast("rasters/nlcd_hc_2019.tif")

pct_green <- 
  terra::extract(nlcd_hc_2019, 
                 tract) |>
  rename(value = Layer_1) |>
  left_join(nlcd_legend, by = "value") |>
  group_by(ID) |>
  summarize(pct_green_2019 = round(sum(green) / n() * 100)) |>
  select(-ID)

tract_nlcd <- bind_cols(cincy::tract_tigris_2010, pct_green)

# NLCD - impervious
impervious_hc_2019 <- terra::rast("rasters/impervious_hc_2019.tif")

pct_impervious <- 
  terra::extract(impervious_hc_2019, 
                 tract, 
                 fun = "mean") |>
  rename(value = Layer_1) |>
  summarize(pct_impervious_2019 = round(value))

tract_nlcd <- bind_cols(tract_nlcd, pct_impervious)

# NLCD - treecanopy
treecanopy_hc_2016 <- terra::rast("rasters/treecanopy_hc_2016.tif")

pct_treecanopy <- 
  terra::extract(treecanopy_hc_2016, 
                 tract, 
                 fun = "mean") |>
  rename(value = Layer_1) |>
  summarize(pct_treecanopy_2016 = round(value))

tract_nlcd <- bind_cols(tract_nlcd, pct_treecanopy)

# EVI
evi_hc_2018 <- terra::rast("rasters/evi_hc_2018.tif")

evi <- 
  terra::extract(evi_hc_2018, 
                 tract, 
                 fun = "mean", 
                 na.rm = TRUE) |>
  rename(evi_2018 = evi_June_2018_5072) |>
  mutate(evi_2018 = round(evi_2018 * 0.0001, 4)) |>
  select(-ID)

tract_nlcd <- bind_cols(tract_nlcd, evi)
tract_nlcd <- sf::st_drop_geometry(tract_nlcd)

tract_nlcd <- tract_nlcd |>
  add_attrs(
    name = "hamilton_landcover",
    title = "Hamilton County Landcover and Built Environment Characteristics",
    version = "0.1.0",
    homepage = "https://geomarker.io/hamilton_landcover"
  )

tract_nlcd <-
  tract_nlcd |>
  add_col_attrs(census_tract_id, title = "Census Tract Identifier") |>
  add_col_attrs(pct_green_2019, title = "Percent Greenspace 2019", description = "percent of pixels in each tract classified as green") |>
  add_col_attrs(pct_impervious_2019, title = "Percent Impervious 2019", description = "average percent imperviousness for pixels in each tract") |>
  add_col_attrs(pct_treecanopy_2016, title = "Percent Treecanopy 2016", description = "average percent tree canopy for pixels in each tract") |>
  add_col_attrs(evi_2018, title = "Enhanced Vegetation Index 2018", description = "average enhanced vegetation index for pixels in each tract")

tract_nlcd <- add_type_attrs(tract_nlcd)

# write metadata.md
cat("#### Metadata\n\n", file = "metadata.md", append = FALSE)
CODECtools::glimpse_attr(tract_nlcd) |>
  knitr::kable() |>
  cat(file = "metadata.md", sep = "\n", append = TRUE)

cat("\n#### Schema\n\n", file = "metadata.md", append = TRUE)
tract_nlcd |>
  CODECtools::glimpse_schema() |>
  knitr::kable() |>
  cat(file = "metadata.md", sep = "\n", append = TRUE)

write_tdr_csv(tract_nlcd)
