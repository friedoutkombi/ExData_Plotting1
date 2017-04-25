#This R code will be for the creation of Plot 3 - 


#Load in the data
df <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=FALSE,dec=".")


#Cull data down to the two days relevant to the time period
twodaydata <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

#convert date/time structures
datetime<-strptime(paste(twodaydata$Date, twodaydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Export to png format
png("plot2.png", width=480, height=480)

#plot
plot(datetime,twodaydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Close Window
dev.off()
