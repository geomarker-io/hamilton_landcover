library(tidyverse)
library(sf)
library(terra)

hc <- cincy::county_7cc_2010 |> filter(county_name == "Hamilton")

# nlcd
nlcd_tif <- s3::s3_get(glue::glue("s3://geomarker/nlcd_cog/nlcd_landcover_2019.tif"))
nlcd <- terra::rast(nlcd_tif)
nlcd_hc_2019 <- terra::crop(nlcd, hc)
terra::writeRaster(nlcd_hc_2019, "rasters/nlcd_hc_2019.tif")
fs::dir_delete("s3_downloads")

# impervious
impervious_tif <- s3::s3_get(glue::glue("s3://geomarker/nlcd_cog/nlcd_impervious_2019.tif"))
impervious <- terra::rast(impervious_tif)
impervious_hc_2019 <- terra::crop(impervious, hc)
terra::writeRaster(impervious_hc_2019, "rasters/impervious_hc_2019.tif")
fs::dir_delete("s3_downloads")

# tree canopy
tree_tif <- s3::s3_get(glue::glue("s3://geomarker/nlcd_cog/nlcd_treecanopy_2016.tif"))
treecanopy <- terra::rast(tree_tif)
treecanopy_hc_2016 <- terra::crop(treecanopy, hc)
terra::writeRaster(treecanopy_hc_2016, "rasters/treecanopy_hc_2016.tif")
fs::dir_delete("s3_downloads")

# evi
evi_tif <- s3::s3_get(glue::glue("s3://geomarker/modis_evi_ndvi/evi_June_2018_5072.tif"))
evi <- terra::rast(evi_tif)
evi_hc_2018 <- terra::crop(evi, hc)
terra::writeRaster(evi_hc_2018, "rasters/evi_hc_2018.tif")
fs::dir_delete("s3_downloads")
