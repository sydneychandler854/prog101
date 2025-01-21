##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)
?kefj
# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
# Kenai Fjords (a site)

#How was temperature monitored? HOBO V2 temperature loggers deployed at each
#site that were placed in pipes embedded in the rock took temperature readings
#every 20, 30, or 60 mins

# What's the difference between absolute temperature and temperature anomaly?
# Absolute temperature is a temperature reading at a site that falls within the
# acceptable range of values, a temperature anomaly is calculated from the mean
# - regional mean.

# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there?
# 7

# How long are they?
# 2187966

# What do they represent? temperature (Celsius), site (name) temperature was
# read at , date and time (via POSIXct vector?) at time of temperature reading,
# tide level (m) at time of temperature reading, exposure (to air?), season
# reading was taken in

# Link to sketch: https://drive.google.com/drive/home

length(kefj_datetime)
# trying to find most common sampling interval
kefj_datetime_Aialik <- kefj_datetime[kefj_site == "Aialik"]
# define the site whose datetime we're concerned with
kefj_interval_Aialik <- kefj_datetime_Aialik[2:length(kefj_datetime_Aialik)] - kefj_datetime_Aialik[1:length(kefj_datetime_Aialik)-1]
table(kefj_interval_Aialik)
# get a table of values, showing how often each time interval was used. Most
# common sampling interval was 30 minutes, with 262735 values

# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?
# The hottest occurred at Aialik on 7/3/2018 at 13:00
# Coldest occurred at Aialik on 1/27/2013 at 21:00

# Link to sketch
# https://drive.google.com/drive/home

# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
# finding max temp
hottest_time <- kefj_datetime[hottest_idx]
# finding date/time of the hottest temp
hottest_site <- kefj_site[hottest_idx]
# site where hottest temp was measured
hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
# defining the boundaries of the day
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# Repeat for the coldest day

coldest_idx <- which.min(kefj_temperature)
# finding min temp
coldest_time <- kefj_datetime[coldest_idx]
# finding date/time of the coldest temp
coldest_site <- kefj_site[coldest_idx]
# site where hottest temp was measured
coldday_start <- as.POSIXct("2013-01-27 00:00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59:59", tz = "Etc/GMT+8")
# defining the boundaries of the day
coldday_idx <- kefj_site == coldest_site &
  kefj_datetime >= coldday_start &
  kefj_datetime <= coldday_end
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ? Temperature reaches max/min
# during exposure to air, temperature is hottest during the middle of the day
# and coldest at night which matches what I think would happen. Also,
# temperature decreases with exposure to water instead of air or an in-between
# intertidal state.

# How did Traiger et al. define extreme temperature exposure?
# extreme warm (≥25°C) and cold (≤−4°C) during exposure to air

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.
# What I need is to find the amount of time the mussels were exposed to air
# during the hottest time of day. The answer is going to be in time(?) calculated
# from the start and end of extreme heat exposure. We want that lil yellow strip

extremeheat_interval <- hotday_exposure == "air"
table(extremeheat_interval)

# how do we get what the one TRUE is?

extremeheat_time <- hotday_datetime[extremeheat_interval == "TRUE"]

# Compare your answer to the visualization you made. Does it look right to you?
# YES 11:30 on July 3rd 2018 matches my plot, this is when the mussels are
# exposed to air (shown by the yellow strip) at an extreme temperature (>= 25).
# This might just be the time when the mussels were exposed to air, but it does
# work.

# Repeat this process for extreme cold exposure on the coldest day.
extremecold_interval <- coldday_exposure == "air"
extremecold_time <- coldday_datetime[extremecold_interval == "TRUE"]

# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
