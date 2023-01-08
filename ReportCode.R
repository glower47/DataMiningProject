install.packages("tsibbledata")
install.packages("tidyverse")
install.packages("mgcv")
install.packages('forecast', dependencies = TRUE)

library("tsibbledata")
library("tidyverse")
library("forecast")
library("ggplot2")

#7.10
#6
afg_people <- data.frame(Year = subset(global_economy, Code == "AFG")$Year, Population = subset(global_economy, Code == "AFG")$Population)

#a)
ggplot(afg_people, aes(x = Year, y = Population)) +
  geom_point()

#b)
ggplot(afg_people, aes(x = Year, y = Population)) +
  geom_point() + 
  geom_line(aes(x = 1980)) +
  geom_line(aes(x = 1989)) +
  geom_smooth(method = "lm") + # Fit a linear trend model
  geom_smooth(method = "gam") # Fit a piecewise linear trend model with knots at 1980 and 1989

#c
# Fit a linear model to the data
lm_model <- lm(Population ~ Year, data = afg_people)

# Generate the forecasted values for the next 5 years
forecast <- data.frame(Year = seq(max(afg_people$Year) + 1, max(afg_people$Year) + 5))
forecast$Population <- predict(lm_model, newdata = forecast)

# Combine the original data and the forecasted values
final_forecast <- rbind(afg_people, forecast)

# Plot the forecasted values using geom_line()
ggplot(final_forecast, aes(x = Year, y = Population)) +
  geom_point() + 
  geom_smooth(method = "lm")

#8.8
#1
#a)
pigs <- subset(aus_livestock, Animal == "Pigs" & State == "Victoria")

mymodel <- ets(pigs$Count)
myforecast <- forecast(mymodel, level = 95, fan = TRUE, h = 4)
autoplot(myforecast)

