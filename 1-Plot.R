# 1-Plot.R

library(ggplot2)
library(dplyr)
library(maps)
library(mapproj)

map <- map_data("world") %>% 
  filter(region != "USSR")

ggplot(storms, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey50", data = map) +
  geom_path(aes(group = name), color = "blue") +
  facet_wrap(~ year) + 
  theme_bw() + 
  coord_map(projection = "ortho", orientation = c(21, -60, 0))

ggsave("storms.png", width = 7, height = 5)

# system('git remote add origin https://github.com/rohrkemper/git-project.git')