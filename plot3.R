# load and subset data
data<-read.table('./Exploratory Data Analysis/household_power_consumption.txt',sep=';',
                 header=TRUE,stringsAsFactors=FALSE,dec='.')
subdata<-subset(data, Date == '1/2/2007' | Date == '2/2/2007')
str(subdata)

# merge Date and Time columns
subdata$Datetime<-paste(subdata$Date,' ',subdata$Time)
subdata$Datetime<-strptime(subdata$Datetime, format='%d/%m/%Y %H:%M:%S')

# plot3
subdata$Sub_metering_1<-as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2<-as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3<-as.numeric(subdata$Sub_metering_3)
png('plot3.png',width=480, height=480)
plot(subdata$Datetime,subdata$Sub_metering_1, type='l',ylab='Energy sub metering',xlab=NA)
lines(subdata$Datetime,subdata$Sub_metering_2,type='l',col='red')
lines(subdata$Datetime,subdata$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=1,lwd=2)
dev.off()
