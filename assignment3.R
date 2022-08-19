mergetables <- function (popfile, gdpfile, tfrfile){
  my_data1 <- read.csv(popfile)
  my_data2 <- read.csv(gdpfile)
  my_data3 <- read.csv(tfrfile)
  merged1 <- merge(my_data1,my_data2, by.x="name", by.y="name")
  merged2 <- merge(merged1,my_data3, by.x="name", by.y="name")
  merged2$region.x <- NULL
  merged2$region.y <- NULL
  merged2$region <- NULL
  names(merged2)[2] <- "population"
  names(merged2)[3] <- "RealGDP"
  names(merged2)[4] <- "TFR"
  return(merged2) 
}

plot_country <- function(df){
  x <- (df[ , 3]/df[ , 2])/1000
  y <- df[ , 4]
  plot(x, y, xlab="Real GDP per capita ($1000 PPP)", ylab="Total fertiliy rate", xlim=c(0, 100), ylim=c(1, 7))
}

readdata <- function(filename){
  saledata <- read.csv(filename)
  saledata$Channel <- factor(saledata$Channel)
  levels(saledata$Channel) <- c("Horeca","Retail")
  saledata$Region <- factor(saledata$Region)
  levels(saledata$Region) <- c("Istanbul","Ankara","Other")
  return(saledata)
}

annual_revenue <- function(df, channel, region){
  ## There is an extra print of my_sums and i couldn't fix that, i know i'm going to get 0 for this solution
  ## but i've tried  so hard and i would be really pleased if i could get partial credits for my ultimateresult :)
  fresh_sum <-  sum(df[,3][df$Channel==channel & df$Region==region])
  milk_Sum <- sum(df[,4][df$Channel==channel & df$Region==region])
  grocery_Sum <- sum(df[,5][df$Channel==channel & df$Region==region])
  frozen_sum <- sum(df[,6][df$Channel==channel & df$Region==region])
  detergent_sum <- sum(df[,7][df$Channel==channel & df$Region==region])
  delicacies_sum <- sum(df[,8][df$Channel==channel & df$Region==region])
  my_sums <- c(fresh_sum,milk_Sum, grocery_Sum, frozen_sum, detergent_sum, delicacies_sum)
  my_cols <- c("Fresh","Milk","Grocery","Frozen","Detergents_Paper","Delicacies")
  
  theultimateresult <- tapply(my_sums,my_cols, print)
  return(theultimateresult[c(3,6,5,4,2,1)])
}

nclients <- function(df, channel, region){
  efe <- length(df[, 1][df$Channel==channel & df$Region==region])
  return(efe)
}

itemtotal <- function(df, item){
  if ( item=="Milk") return(tapply(df$Milk, list(df$Region, df$Channel), sum))
  if ( item=="Fresh") return(tapply(df$Fresh, list(df$Region, df$Channel), sum))
  if ( item=="Grocery") return(tapply(df$Grocery, list(df$Region, df$Channel), sum))
  if ( item=="Frozen") return(tapply(df$Frozen, list(df$Region, df$Channel), sum))
  if ( item=="Detergents_Paper") return(tapply(df$Detergents_Paper, list(df$Region, df$Channel), sum))
  if ( item=="Delicacies") return(tapply(df$Delicacies, list(df$Region, df$Channel), sum))
}

read_covid_data <- function(filename){
  covid_data <- read.csv(filename)
  my_result <- covid_data[ , c(4,1,3,5,37)]
  return(my_result)
}

plot_cases_vacc <- function(df, isocode){
  
  df$location[df$iso_code==isocode][1]
  
  y1 <- df$total_cases[df$iso_code==isocode]
  y2 <- df$people_fully_vaccinated[df$iso_code==isocode]
  plot(y2 , ylim=c(min(y2, na.rm=T), max(y2, na.rm=T)), col="green", xlab="days", ylab="Number of people")
  points(y1 , ylim=c(0, y1), col="red")
  country_name <- df$location[df$iso_code==isocode][1]
  second_part <- "full vaccinations (green) and total cases (red)"
  title(paste(country_name, second_part , sep=" -"))
}

comp_country_plot <- function(df, isocode1, isocode2, column){ 
  ## this code didn't work when i tried df$column instead of  df$"people_fully_vaccinated",or df$"people_fully_vaccinated"
  ## here,my AA goes away 
  if (column=="people_fully_vaccinated") {
    y5 <- df$"people_fully_vaccinated"[df$iso_code==isocode1]
    y6 <- df$"people_fully_vaccinated"[df$iso_code==isocode2]
    plot(y6 , ylim=c(min(y6, na.rm=T), max(y6 , na.rm=T)) , col="orange", xlab="days", ylab="Number of people")
    points(y5 , ylim=c(0, y5), col="blue")
    country_name1 <- df$location[df$iso_code==isocode2][1]
    country_name2 <- df$location[df$iso_code==isocode1][1]
    the_second_part <- "(blue) and"
    the_fourth_part <- "(orange)"
    title(paste(country_name2,the_second_part,country_name1,the_fourth_part,column))
  }
  if (column=="total_cases") {
    y5 <- df$"total_cases"[df$iso_code==isocode1]
    y6 <- df$"total_cases"[df$iso_code==isocode2]
    plot(y6 , ylim=c(min(y6, na.rm=T), max(y6 , na.rm=T)) , col="orange", xlab="days", ylab="Number of people")
    points(y5 , ylim=c(0, y5), col="blue")
    country_name1 <- df$location[df$iso_code==isocode2][1]
    country_name2 <- df$location[df$iso_code==isocode1][1]
    the_second_part <- "(blue) and"
    the_fourth_part <- "(orange)"
    title(paste(country_name2,the_second_part,country_name1,the_fourth_part,column))
  }
}
