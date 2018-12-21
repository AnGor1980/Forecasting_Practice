#library(survMisc)
library(fpp2)
library(GGally)

##ts objects
y <- ts(c(123,39,78,52,110), start=2012)

##Time plots
autoplot(melsyd[,"Economy.Class"]) +
  ggtitle("Economy class passengers: Melbourne-Sydney") +
  xlab("Year") +
  ylab("Thousands")

hist(melsyd[,"Economy.Class"])
shapiro.test(melsyd[,"Economy.Class"])

autoplot(a10) +
  ggtitle("Antidiabetic drug sales") +
  ylab("$ million") +
  xlab("Year")

##Seasonal plots
ggseasonplot(a10, year.labels=TRUE, year.labels.left=TRUE) +
  ylab("$ million") +
  ggtitle("Seasonal plot: antidiabetic drug sales")

ggseasonplot(a10, polar=TRUE) +
  ylab("$ million") +
  ggtitle("Polar seasonal plot: antidiabetic drug sales")

##Seasonal subseries plots
ggsubseriesplot(a10) +
  ylab("$ million") +
  ggtitle("Seasonal subseries plot: antidiabetic drug sales")

##Scatterplots
autoplot(elecdemand[,c("Demand","Temperature")], facets=TRUE) +
  xlab("Year: 2014") + ylab("") +
  ggtitle("Half-hourly electricity demand: Victoria, Australia")

qplot(Temperature, Demand, data=as.data.frame(elecdemand)) +
  ylab("Demand (GW)") + xlab("Temperature (Celsius)")

autoplot(visnights[,1:5], facets=TRUE) +
  ylab("Number of visitor nights each quarter (millions)")

GGally::ggpairs(as.data.frame(visnights[,1:5]))

##Lag plots
beer2 <- window(ausbeer, start=1972)
gglagplot(beer2)
ggAcf(beer2)

##Autocorrelation
aelec <- window(elec, start=1980)
autoplot(aelec) + xlab("Year") + ylab("GWh")
ggAcf(aelec, lag=48)
gglagplot(aelec, lag=3)

##White noise
set.seed(30)
y <- ts(rnorm(50))
autoplot(y) + ggtitle("White noise")
ggAcf(y)

##Exercises
###1
help(gold)
tsdisplay(gold)
autoplot(gold)
boxplot(gold)
gold[which.max(gold)]
frequency(gold)

help(woolyrnq)
tsdisplay(woolyrnq)
autoplot(woolyrnq)
boxplot(woolyrnq)
frequency(woolyrnq)

help(gas)
tsdisplay(gas)
autoplot(gas)
boxplot(gas)
frequency(gas)

###2
tute1 <- read.csv("http://otexts.org/fpp2/extrafiles/tute1.csv", header=TRUE)
#Convert the data to time series
mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)
autoplot(mytimeseries, facets=TRUE)

###3
library(readxl)
#download.file("https://otexts.org/fpp2/extrafiles/retail.xlsx", destfile = "retail.xlsx")
retaildata <- read_excel("retail.xlsx", skip=1)
myts <- ts(retaildata[,"A3349873A"],
           frequency=12, start=c(1982,4))
myts1 <- window(myts, start=2010)
autoplot(myts1)
ggseasonplot(myts)
ggsubseriesplot(myts1)
gglagplot(myts1)
ggAcf(myts)

###4
autoplot(bicoal)
autoplot(chicken)
autoplot(dole)
autoplot(usdeaths)
autoplot(lynx)
autoplot(goog) + xlab("Year")
autoplot(writing)
autoplot(fancy)
autoplot(a10)
autoplot(h02) 

###5
ggseasonplot(writing)
ggseasonplot(fancy)
ggseasonplot(a10)
ggseasonplot(h02)
