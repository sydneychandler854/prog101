# What do the following expressions do?
temp_F <- temp_C * 9/5 - 32
# convert temperature in Farenheit to Celsius
rect_area <- rect_length * rect_width
# find area of rectangle

# Fill in the question marks to complete these expressions
triangle_area <- 1/2 * base * height
cylinder_volume <- pi * r^2 * height

# What are the errors in these expressions?
speed_m_s <- distance_m / time_s
#changed * to /
acceleration_m_s2 <- speed_m_s / time_s
#changed acceleration units to _m_s2
#acceleration has to be connected to m_s2 so _m_s2
force_N <- mass * acceleration_m_s2
#added - to arrow and changed + to *

# The energy density of market squid is 4850 joules per gram[1]. If a 225 kg
# Risso's dolphin needs 5 million joules of energy per day[2] and a typical
# market squid is 35 g[1], then how many squid does a Risso's dolphin need to
# eat each day? Solve the above word problem in R. Consider how many variables
# you need to create, what to name them to make the code readable, and how to
# combine them into expressions.

#variable for energy density squid
energy_density_squid_J_g <- 4850

#variable for weight squid
weight_squid_g <- 35

#variable for dolphin energy requirement
dolphin_energy_req_J <- 5000000

#find energy of one squid
energy_onesquid_J <- energy_density_squid_J_g * weight_squid_g


#find how many squid the dolphin needs to eat per day
squid_eaten <- dolphin_energy_req_J / energy_onesquid_J

#about 30 squid

# [1] Price et al. 2024 https://doi.org/10.3389/fmars.2023.1345525
# [2] Barlow et al. 2008 https://doi.org/10.3354/meps07695

