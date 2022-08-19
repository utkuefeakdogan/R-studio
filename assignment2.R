distance <- function(u,v) {
  if(length(u)!=length(v)){
    print("vectors must have the same length")
    return(NULL)
  }
  baba <- 0
  efe <- 0
  for(i in 1:length(u))
  {
    efe <- ((u[i]-v[i])**2)
    baba <- (efe+baba)
  }
  result <- sqrt(baba)
  return(result)
}

get_neighbor <- function(x, m, k) {
    mesafeler <- NULL
    a <- length(m)/2
    if(k>a){
      print("k is larger than the rows of m.")
      return(NULL)
    }
    for (i in 1:a){
      mesafe <- sqrt((m[i,1]-x[1])**2 + (m[i,2]-x[2])**2)
      mesafeler <- c(mesafeler,mesafe)
    }
    result <- m[order(mesafeler)[k],]
    return(result)
  }

number_to_text <- function(x) {
  ones <- c("one","two","three","four","five","six","seven","eight","nine","ten")
  teens <- c("eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen")
  tens <- c("ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety")
  a <- x %% 10
  b <- x %% 100
  if(x==0){
    return("zero")
  }
  if(x<=10){
    return(ones[x])
  }
  if(10<x && x<20){
    return(teens[a])
  }
  if(x<91 && x%%10==0){
    return(tens[x/10])
  }
  if(x<99){
    first <- tens[floor(x/10)]
    second <- ones[a]
    result <- paste(first,second,sep="-")
    return(result)
  }
  if(x<901 && x%%100==0){
    first <- ones[x/100]
    second <- "hundred"
    result <- paste(first,second," ")
    return(result)
  }
  if(x<1000 && b<10){
    first <- ones[floor(x/100)]
    second <- "hundred and"
    third <- ones[b]
    result <- paste(first,second,third,sep=" ")
    return(result)
  }
  if(x<1000 && b<20){
    first <- ones[floor(x/100)]
    second <- "hundred and"
    third <- teens[a]
    result <- paste(first,second,third)
    return(result)
  }
  
  if(x<1000 && b>20){
    first <- ones[floor(x/100)]
    second <- "hundred and"
    efe <- x%%100
    baba <- floor(efe/10)
    baba2 <- efe%%10
    third <- tens[baba]
    fourth <- ones[baba2]
    thfo <- paste(third,fourth,sep="-")
    
    result <- paste(first,second,thfo,sep=" ")
    return(result)
  }
}

powerseries <- function(x, n){
  if (n<0){
    print("parameter n should not be negative")
    return(NULL)
  }
  vectorresult <- NULL
  for(k in 1:length(x)){
    my_vector <- NULL
    for (i in 0:n){
      addthis <- x[k]**i
      dividewith <- factorial(i)
      ultimate <- addthis/dividewith
      my_vector <- c(my_vector,ultimate)
    }
    result <- sum(my_vector)
    vectorresult <- c(vectorresult,result)
  }
  return(vectorresult)
}

plot_series <- function(z, n){
  x <- z
  y <- powerseries(z,n)
  y2 <- exp(z)
  plot(x,y,type="l")
  points(x,y2,type="l",col="red")
  title("exp(x) and power series")
}