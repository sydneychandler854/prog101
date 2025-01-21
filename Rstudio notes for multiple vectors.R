# From previous video
barnacle_density_m2 <- c(2.1,1.9,3.0,4.2)
site <- c("Point Arena", "Point Conception", "San Clemente", "Catalina")
region <- c("NorCal", "CenCal", "SoCal", "SoCal")

# How to work on vectors element-wise
site_area_m2 <- c(25, 12, 8, 9)
barnacle_count <- barnacle_density_m2 * site_area_m2
barnacle_count

paste(region, site)
#check that my character pairings look right

#use conditions of one vector to index another
#give me barnacle dansity of site Point Arena
barnacle_density_m2[site == "Point Arena"]

#Other conditional operators: !=, <, >, >=

#Give me sites where the region isn't norcal
site[region != "NorCal"]

#Give me sites where barnacle density is greater than average
site[barnacle_density_m2 > mean(barnacle_density_m2)]

#Pro-tip: use sum() to count the number of TRUEs (useful for class)
sum(region == "SoCal")
sum(barnacle_density_m2 > 4)
