# Run this script ("Source with Echo") to get the output from your functions
# defined in "assignment1.R" and check it against the examples in the assignment.
# The file "assignment1.R" must be in the same directory.

# Run this after restarting R to avoid contamination by prior assignments.

# You can comment out parts related to unfinished problems.

# This script is just a collection of the same examples in the assignment 
# description. It is not a guarantee of the correctness of your solutions.
# However, if you get errors or wrong results here, your code is almost 
# certainly incorrect.

rm() # remove all existing variables
source("assignment1.R") # source the file containing your function definitions.

# Problem 1
squarediff(10)
squarediff(20)
squarediff(2)

# Problem 2
weighted_scores(st_names = c("Fatma","Ilker","Zafer","Cem","Hande","Meral"),
                midterm = c(26,78,68,35,89,65),
                final = c(65,86,57,16,58,78),
                attendance = c(10,11,11,14,9,13))

# Problem 3
RNGversion("3.3.1")
set.seed(20200501)
fundreturn(40000, 24, 0.02, 0.007)

# Problem 4
triangle_area(c(0,0), c(2,0), c(0,2))
triangle_area(c(1,0), c(2,0), c(3,0))
triangle_area(c(1,0.5), c(-2,3), c(5,2))

# Problem 5
plot_poly( c(1,2,-2,0.5), 0, 3, 0.1)
plot_poly(c(4,0,-1,0), -2, 2, 0.25, pch=3, col="blue", main="inverted parabola")
plot_poly(c(4,-4,0,1), -3, 2, 0.1, col="red", type="l", xlab="The x axis", ylab="The y axis")