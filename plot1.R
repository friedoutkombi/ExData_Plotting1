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

#Convert Date  to appropriate class (Date)
twodaydata$Date<-as.Date(twodaydata$Date, format="%d/%m/%Y")

#Convert Global Active Power to Numeric
twodaydata$Global_active_power<-as.numeric(as.character(twodaydata$Global_active_power))

#Convert to kilowatts
twodaydata$Global_active_power<-twodaydata$Global_active_power
#Create a histogram with the 
hist(twodaydata$Global_active_power,main="Global Active Power",col="Red",
     xlab="Global Active Power (kilowatts)")

#Export to png format
png("plot1.png", width=480, height=480)

#Create a histogram with the 
hist(twodaydata$Global_active_power,main="Global Active Power",col="Red",
     xlab="Global Active Power (kilowatts)")
#Close Window
dev.off()
