if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               sf,
               mapview)


# get fish site data
df_fish <- read_csv("data/data_finsync_nc_nc.csv")
print(df_fish)

# remove duplicates in the data
df_fish %>% 
  distinct(site_id, lon, lat) %>% 
  st_as_sf(coords = c("lon", "lat"),
           crs = 4326)

# mapping