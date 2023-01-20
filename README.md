# Hamilton County Land Cover and Built Environment

## About

This R code generates the **Hamilton County Land Cover and Built Environment** (`hamilton_landcover`) data resource. Census tract-level measures of greenness, imperviousness, and treecanopy are derived from the National Land Cover Database (NLCD) and NASA MODIS satellite data. 

See [metadata.md](./metadata.md) for detailed metadata and schema information.

## Accessing Data

Read this CSV file into R directly from the [release](https://github.com/geomarker-io/hamilton_landcover/releases) with:

```
readr::read_csv("https://github.com/geomarker-io/hamilton_landcover/releases/download/v0.1.0/hamilton_landcover.csv")
```

Metadata can be imported from the accompanying `tabular-data-resource.yaml` file by using [{CODECtools}](https://geomarker.io/CODECtools/).

## Data Details

#### Defining greenspace using NLCD land cover classifications

A grid cell is considered greenspace if its NLCD land cover classification is in any category except water, ice/snow, developed medium intensity, developed high intensity, rock/sand/clay.

#### Enhanced Vegetation Index (EVI)

The Enhanced Vegetation Index (EVI) is a measure of greenness that ranges from -0.2 to 1, with higher values corresponding to more vegetation. A cloud-free composite EVI raster at a resolution of 250 × 250 m was created by assembling individual images collected via remote sensing between June 10 and June 25, 2018.



