# hikeOSM-print

This is a version of the hikeOSM style used for print maps, specifically using our tiles2print utility

There are gridlines added and features specially highlighted at zoom levels 13-14, which is the zoom level
that we print at for 1:50000 maps.

----------------------------------------------------

- Forked from Mapbox Outdoors Layer
- Greater emphasis on OpenStreetMap data
- More topographic map specific features

### Setup
First, download and Install Mapbox Studio Classic (https://www.mapbox.com/mapbox-studio-classic/)

Then, clone this repository to your machine:

	git clone https://github.com/tcta/mb-classic-hikeOSM.tm2.git

Open Mapbox Studio Classic. Go to Styles & Sources -> Browse and locate the cloned directory. Click Open.

### Layers
The following is a list of data layers included in this map. Please contact for any suggestions of additions or changes.

|        Layer        |        Datasource        |                    Notes                      |
| ------------------- | ------------------------ | --------------------------------------------- |
| contour.label       | mapbox.mapbox-streets-v7 |                                               |
| housenum_label      | mapbox.mapbox-streets-v7 |                                               |
| waterway_label      | mapbox.mapbox-streets-v7 |                                               |
| road_label          | mapbox.mapbox-streets-v7 |                                               |
| poi_label           | mapbox.mapbox-streets-v7 |                                               |
| mountain_peak_label | mapbox.mapbox-streets-v7 |                                               |
| water_label         | mapbox.mapbox-streets-v7 |                                               |
| place_label         | mapbox.mapbox-streets-v7 |                                               |
| state_label         | mapbox.mapbox-streets-v7 |                                               |
| marine_label        | mapbox.mapbox-streets-v7 |                                               |
| country_label       | mapbox.mapbox-streets-v7 |                                               |
| country_label_line  | mapbox.mapbox-streets-v7 |                                               |
| admin               | mapbox.mapbox-streets-v7 |                                               |
| bridge              | mapbox.mapbox-streets-v7 |                                               |
| road                | mapbox.mapbox-streets-v7 |                                               |
| tunnel              | mapbox.mapbox-streets-v7 |                                               |
| landuse_overlay     | mapbox.mapbox-streets-v7 |                                               |
| building            | mapbox.mapbox-streets-v7 |                                               |
| barrier_line        | mapbox.mapbox-streets-v7 |                                               |
| aeroway             | mapbox.mapbox-streets-v7 |                                               |
| water               | mapbox.mapbox-streets-v7 |                                               |
| waterway            | mapbox.mapbox-streets-v7 |                                               |
| hillshade           | mapbox.mapbox-terrain-v2 | Some small style changes made to better smooth the hillshade  |
| contour.line        | mapbox.mapbox-terrain-v2 | Basically the same as Mapbox Outdoors with some thikcness changes |
| landuse             | mapbox.mapbox-streets-v7 | This is left mostly unedited from Mapbox Outdoors Style; but it comes in stronger at earlier zoom levels, and glaciers from this layer has been made to replace snow from the landcover layer; remember that the features in this layer come from OpenStreetMap, so if something doesn't look good, edit it! |
| landcover           | mapbox.mapbox-terrain-v2 | wood, scrub, grass, crop, and snow; very generalized and only used for stylistic purposes, so it has been mostly removed except at low zoom levels; The OSM data in the landuse layer replaces it, which is (or should be) more accurate; Edits to OSM will show up in the landuse layer. |

#### To add
- Valleys
- Ridges, Ranges
- Other Locales, such as Plateaus
- spot heights (MB only seems to have some of them, in OSM they are marked as peaks)
- mountain passes
- escarpments? (maybe)
- monadnock
- individual trees, hedges
- springs (water sources)
- campsites
- emphasize trails, tracks



#### More layer references
For more info on the layers see:

- mapbox.mapbox-terrain-v2 - https://www.mapbox.com/vector-tiles/mapbox-terrain/
- mapbox.mapbox-streets-v7 - https://www.mapbox.com/vector-tiles/mapbox-streets-v7/