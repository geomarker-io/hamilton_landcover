#### Metadata

|name     |value                                                           |
|:--------|:---------------------------------------------------------------|
|name     |hamilton_landcover                                              |
|version  |0.1.0                                                           |
|title    |Hamilton County Landcover and Built Environment Characteristics |
|description | Greenspace, imperviousness, treecanopy, and greenness (EVI) for all tracts in Hamilton County |
|homepage |https://geomarker.io/hamilton_landcover                         |

#### Schema

|name                |title                          |type   |description                                                |
|:-------------------|:------------------------------|:------|:----------------------------------------------------------|
|census_tract_id     |Census Tract Identifier        |string |NA                                                         |
|pct_green_2019      |Percent Greenspace 2019        |number |percent of pixels in each tract classified as green        |
|pct_impervious_2019 |Percent Impervious 2019        |number |average percent imperviousness for pixels in each tract    |
|pct_treecanopy_2016 |Percent Treecanopy 2016        |number |average percent tree canopy for pixels in each tract       |
|evi_2018            |Enhanced Vegetation Index 2018 |number |average enhanced vegetation index for pixels in each tract |
