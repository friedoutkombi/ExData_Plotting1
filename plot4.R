#This R code will be for the creation of Plot 4 - 

#Load in the data
df <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=FALSE,dec=".")

#Cull data down to the two days relevant to the time period
twodaydata <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

#convert date/time structures
datetime<-strptime(paste(twodaydata$Date, twodaydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create subs
sub_metering_1<-twodaydata$Sub_metering_1
sub_metering_2<-twodaydata$Sub_metering_2
sub_metering_3<-twodaydata$Sub_metering_3


#Export to png format
png("plot4.png", width=480, height=480)

#set par for 4 plots
par(mfrow=c(2,2))

#Plot1 c(1,1)
plot(datetime,twodaydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Plot2 c(1,2)
plot(datetime,twodaydata$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Plot3 c(2,1)
plot(datetime,sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(datetime,sub_metering_2,type="l",col="red")
points(datetime,sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,bty="n")

#Plot4 c(2,2)
plot(datetime,twodaydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Close Window
dev.off()
