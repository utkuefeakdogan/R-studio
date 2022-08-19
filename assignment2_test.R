# Run this script ("Source with Echo") to get the output from your functions
# defined in "assignment2.R" and check it against the examples in the assignment.
# The file "assignment2.R" must be in the same directory.

# Run this after restarting R to avoid contamination by prior assignments.

# You can comment out parts related to unfinished problems.

# This script is just a collection of the same examples in the assignment 
# description. It is not a guarantee of the correctness of your solutions.
# However, if you get errors or wrong results here, your code is almost 
# certainly incorrect.

rm() # remove all existing variables
source("assignment2.R") # source the file containing your function definitions.

# Problem 1
distance(c(3,0), c(0,4))
distance(c(1,2,5-1,2), c(0,4,1-2,3))
distance(c(1,2), c(1,2,3))

# Problem 2
x <- c(0,2)
m <- rbind( c(1,1), c(1,2), c(3,3), c(2,0) )
get_neighbor(x, m, 1)
get_neighbor(x, m, 4)
get_neighbor(x, m, 5)

RNGversion("3.3.1")
set.seed(12345)
m <- matrix( runif(100), ncol=2) # A random matrix with 50 rows
x <- c(0.5, 0.5)
get_neighbor(x, m, 20) # get the 20th nearest point to x.

# Problem 3
for (x in c(0,5,10,15,57,100,105,213,538,999)) 
  print(number_to_text(x))

# Problem 4
powerseries(x=1, n=0)
powerseries(x=1, n=7)
powerseries(x=c(-1,0,1), n=7)
powerseries(x=2, n=-1)

plot_series(seq(-5,5,length.out = 101), n=3)
plot_series(seq(-5,5,length.out = 101), n=7)