library(neonUtilities)

# stackByTable("data_downloads/NEON_count-ticks.zip",
#              savepath="raw_data/tick_data")

stackByTable("data_downloads/NEON_count-mosquitoes.zip",
             savepath="raw_data/mosquito_data")

stackByTable("data_downloads/NEON_pathogens-mosquito.zip",
             savepath="raw_data/mosq_path")

# stackByTable("data_downloads/NEON_pathogens-tick.zip",
#              savepath="raw_data/tick_path")

#stack weather
# stackByTable("data_downloads/NEON_temp-air-triple.zip",
#              savepath="weather_raw/temp")
# 
# stackByTable("data_downloads/NEON_precipitation.zip",
#              savepath="weather_raw/rain")

stackByTable("data_downloads/NEON_weather-stats.zip",
             savepath="raw_data/NEON_weather")

# stackByTable("data_downloads/NEON_rel-humidity.zip",
#              savepath="weather_raw/humidity")
