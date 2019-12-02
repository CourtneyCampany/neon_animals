mean_rmna <- function(x) mean(x, na.rm=TRUE)

##rain data

rain <- read.csv("raw_data/NEON_weather/stackedFiles/wss_daily_precip.csv")
rain$date <- as.Date(rain$date)
rain$month <- lubridate::month(rain$date, label=TRUE)

rain_agg <- doBy::summaryBy(wssPrecipTotal ~ month + siteID, FUN=mean_rmna,
                            data=rain, keep.names = TRUE)

##temp
temp <- read.csv("raw_data/NEON_weather/stackedFiles/wss_daily_temp.csv")
temp$date <- as.Date(temp$date)
temp$month <- lubridate::month(temp$date, label=TRUE)

temp_agg <- doBy::summaryBy(wssTempTripleMean + wssTempTripleMinimum + 
                              wssTempTripleMaximum ~ month + siteID, 
                            data=temp, FUN=mean_rmna, keep.names = TRUE)

##wind
wind <- read.csv("raw_data/NEON_weather/stackedFiles/wss_daily_wind.csv")
wind$date <- as.Date(wind$date)
wind$month <- lubridate::month(wind$date, label=TRUE)

wind_agg <- doBy::summaryBy(wssWindSpeedMean ~ month + siteID, FUN=mean_rmna,
                            data=wind, keep.names = TRUE)

##humidity
humid <- read.csv("raw_data/NEON_weather/stackedFiles/wss_daily_humid.csv")
humid$date <- as.Date(humid$date)
humid$month <- lubridate::month(humid$date, label=TRUE)

humid_agg <- doBy::summaryBy(wssRHMean + wssRHMinimum + wssRHMaximum
                             ~ month + siteID, FUN=mean_rmna,
                            data=humid, keep.names = TRUE)


#radiation
radiate <- read.csv("raw_data/NEON_weather/stackedFiles/wss_daily_shortRad.csv")
radiate$date <- as.Date(radiate$date)
radiate$month <- lubridate::month(radiate$date, label=TRUE)

radiate_agg <- doBy::summaryBy(wssShortRadMean + wssShortRadMinimum + 
                             wssShortRadMaximum
                             ~ month + siteID, FUN=mean_rmna,
                             data=radiate, keep.names = TRUE)

mergeCols = c("siteID", "month")

library(dplyr)
weather  <- temp_agg %>% left_join(rain_agg,  by = mergeCols) %>%
                  left_join(wind_agg,  by = mergeCols) %>%
                  left_join(humid_agg,  by = mergeCols) %>%
                  left_join(radiate_agg,  by = mergeCols)


write.csv(weather, "module_data/weather_summary.csv")
