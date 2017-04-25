#This R code will be for the creation of Plot 3 - 

#Load in the data
df <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=FALSE,dec=".")
#Cull data down to the two days relevant to the time period
twodaydata <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
#convert date/time structures
datetime<-strptime(paste(twodaydata$Date, twodaydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



#Export to png format
png("plot3.png", width=480, height=480)

#subs
sub_metering_1<-twodaydata$Sub_metering_1
sub_metering_2<-twodaydata$Sub_metering_2
sub_metering_3<-twodaydata$Sub_metering_3


#plot
plot(datetime,sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(datetime,sub_metering_2,type="l",col="red")
points(datetime,sub_metering_3,type="l",col="blue")


#Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

#Close Window
dev.off()
