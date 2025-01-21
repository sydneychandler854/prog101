# Convert feet to meters
20/3.281

# Let's make a variable. We use "<-"
depth_ft <- 20
depth_m <- depth_ft / 3.281

# Environment is now populated! First purpose of variables: store information
# that can be used later.

# Second purpose of variables: make code easier to read and understand. We call
# this "encapsulation"
ft_to_m <- 1 / 3.281
depth_m <- depth_ft * ft_to_m

# Note: variables won't change unless you explicitly reassign them.
# This is often unintuitive.
depth_m * 2
depth_m <- depth_m * 2
