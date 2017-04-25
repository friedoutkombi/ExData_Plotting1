#This R code will be for the creation of Plot 1 - Global Active Power.
#Basic steps are load in the data set.
#Analyse the data to get a feel for it.
#Cut down to the 2 day time period.
#Plot Global Active Power vs Frequency.
#Ensure labels, colours are good.


#Load in the data
df <- read.table("household_power_consumption.txt",header = TRUE, sep=";")

#Cull data down to the two days relevant to the time period
twodaydata <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

#Convert Date & Time to appropriate class (factor to Date/Time)
twodaydata$Date<-as.Date(twodaydata$Date, format="%d/%m/%Y")
