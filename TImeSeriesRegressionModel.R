install.packages("tsibbledata")
install.packages("tidyverse")
install.packages("mgcv")
install.packages('forecast', dependencies = TRUE)

library("tsibbledata")
library("tidyverse")
library("forecast")
library("ggplot2")
library("mgcv")

#7.10
#6
#a)
data(global_economy)
global_economy_filtered  <- subset(global_economy, Code == "AFG")
head(global_economy_filtered)

ggplot(global_economy_filtered, aes(x = Year, y = Population)) +
  geom_point()

#b)
ggplot(global_economy_filtered, aes(x = Year, y = Population)) +
  geom_point() + 
  geom_line(aes(x = 1980)) +
  geom_line(aes(x = 1989)) +
  geom_smooth(method = "lm") + # Fit a linear trend model
  geom_smooth(method = "gam") # Fit a piecewise linear trend model with knots at 1980 and 1989

#c
global_economy_filtered_shortened  <- subset(global_economy_filtered, Year <= 1995 & Year >= 1965)
head(global_economy_filtered_shortened)

ggplot(global_economy_filtered_shortened, aes(x = Year, y = Population)) +
  geom_point() + 
  geom_line(aes(x = 1980)) +
  geom_line(aes(x = 1989)) +
  geom_smooth(method = "lm") +
  geom_smooth(method = "gam")



