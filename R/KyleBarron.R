library(gmapsdistance)
library(readr)
library(tidyverse)

#Sets the API key to the code I downloaded from Google
set.api.key('redacted')

#Sets the origins variable equal to the values from the CSV
origins <- read_csv('../data/asentamientos_ambaindec_ring1_xy.csv') %>%
  select(origin_id = ID_TECHO, origin_x = POINT_X, origin_y = POINT_Y) %>%
  mutate(to_merge = 1)

#Sets the destinations variable equal to the values from the CSV, in this case the railroad stations
dests <- read_csv("../data/stations_railroad.csv") %>%
  select(dest_id = idlineaest, dest_x = X, dest_y = Y) %>%
  mutate(to_merge = 1)

#Merges the origin and destination CSV files into one unitary file.
full_data <- full_join(origins, dests, by = 'to_merge') %>%
  select(-to_merge)

small <- full_data[1:5,]
small <- small %>%
  mutate_at(c('origin_x', 'origin_y', 'dest_x', 'dest_y'), as.character) %>%
  mutate(origin = str_c(origin_y, '+', origin_x),
         dest = str_c(dest_y, '+', dest_x))

#Gives the actual parameters of the tool
distances = vector(mode = 'numeric', length = nrow(small))
times = vector(mode = 'numeric', length = nrow(small))
statuses = vector(mode = 'character', length = nrow(small))
for (i in 1:nrow(small)) {
  results = gmapsdistance(small$origin[i], small$dest[i], mode = 'transit')
  distances[i] = results$Distance
  times[i] = results$Time
  statuses[i] = results$Status
}