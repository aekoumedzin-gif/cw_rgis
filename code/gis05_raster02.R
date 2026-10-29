if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               terra,
               tidyterra,
               mapview,
               stars)
(spr_prec <- rast("data/spr_prec_us.tif"))
ext(spr_prec)
spr_prec_crop <- crop(x = spr_prec,
                      y = c(-80, -75, 34, 37))
sf_nc_county <- readRDS("data/sf_nc_county.rds")

ggplot() +
  geom_spatraster(data = spr_prec_crop) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)
spr_prec_nc <- crop(x = spr_prec,
                    y = sf_nc_county)

ggplot() +
  geom_spatraster(data = spr_prec_nc) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

writeRaster(spr_prec_nc,
            "data/spr_prec_nc.tif",
            overwrite = TRUE)

# Merge

spr_nw <- rast("data/spr_tmp_ncnw.tif")
spr_ne <- rast("data/spr_tmp_ncne.tif")
spr_sw <- rast("data/spr_tmp_ncsw.tif")
spr_se <- rast("data/spr_tmp_ncse.tif")

list_spr <- list(spr_nw, spr_ne, spr_sw, spr_se)
spr_col <- sprc(list_spr)
spr_merge <- merge(spr_col)
ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

# Stack

crs(spr_prec_nc)
crs(spr_merge)

dim(spr_prec_nc)
dim(spr_merge)

compareGeom(spr_prec_nc, spr_merge)
spr_stack <- c(spr_prec_nc, spr_merge)
spr_stack
plot(spr_stack)

# Reproject

spr_stack_proj <- project(
  x = spr_stack,
  y = "EPSG:32617",
  method = "bilinear"
)

crs(spr_stack_proj)

plot(spr_stack_proj)


## Exercise

#1 

spr_nw <- rast("data/spr_tmp_ncnw.tif")
spr_ne <- rast("data/spr_tmp_ncne.tif")
spr_sw <- rast("data/spr_tmp_ncsw.tif")
spr_se <- rast("data/spr_tmp_ncse.tif")

list_spr <- list(spr_nw, spr_ne, spr_sw, spr_se)

spr_col <- sprc(list_spr)

spr_merge <- merge(spr_col)

ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county, alpha = 0.25)

#2

sf_camden <- sf_nc_county %>%
  filter(county == "camden")

sf_camden

spr_tmp_camden <- crop(
  x = spr_merge,
  y = sf_camden
)

ggplot() +
  geom_spatraster(data = spr_tmp_camden) +
  geom_sf(data = sf_camden, fill = NA, color = "black")

#3

spr_tmp_camden_proj <- project(
  x = spr_tmp_camden,
  y = "EPSG:32618",
  method = "bilinear"
)

crs(spr_tmp_camden_proj)

plot(spr_tmp_camden_proj)