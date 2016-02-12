# 0-Clean.R

library(dplyr)
library(lubridate)

storms <- read.csv("storms.csv")

storms <- storms %>% 
  mutate(time = ymd_h(paste(year, month, day, hour))) %>% 
  select(name, year, time, lat, long, pressure, wind, type)

storms <- storms %>%
  filter(type != "Extratropical")

write.csv(storms, file = "storms.csv", row.names = FALSE)
  