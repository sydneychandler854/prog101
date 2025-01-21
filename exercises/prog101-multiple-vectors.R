# What does the following code do?
#Tip: `%%` is the remainder operator. E.g. 10 %% 4 is 2.
instrument_deployed_hm <- c(730, 915, 1345)
#the first line is a vector for instrument_deployed_hm
instrument_deployed_h <- floor(instrument_deployed_hm / 100)
#second is a conditional operator aka it represents the
# largest integers not greater than the values of x, aka it ROUNDS them
instrument_deployed_hdec <- (instrument_deployed_hm %% 100) / 60
# finding the amount remaining after fitting 100 into the vector as much as you
# can. /60 bc 60 minutes in an hour
instrument_deployed <- instrument_deployed_h + instrument_deployed_hdec
#finding the variable for when instrument was deployed by adding two vectors that are
#affected by each other

# Based on the code above, calculate the duration of instrument deployments
# using the instrument recovery times below. What units do the durations have?
instrument_recovered_hm <- c(1600, 1920, 2015)
#units = time (hours:minutes)
instrument_recovered <- instrument_deployed_hm + instrument_deployed_hdec
#units =
instrument_durations <- instrument_recovered_hm - instrument_deployed_hm

# Which site had the longest duration? Use conditional indexing.
site <- c("Santa Cruz", "Santa Rosa", "San Miguel")
site[which.max(instrument_durations)]
#Santa Rosa?
?floor()
# floor() takes a single numeric argument X and returns a numeric vector
# containing the largest integers not greater than the corresponding elements of
# x
