# load and subset data
data<-read.table('./Exploratory Data Analysis/household_power_consumption.txt',sep=';',
                 header=TRUE,stringsAsFactors=FALSE,dec='.')
subdata<-subset(data, Date == '1/2/2007' | Date == '2/2/2007')
str(subdata)

# merge Date and Time columns
subdata$Datetime<-paste(subdata$Date,' ',subdata$Time)
subdata$Datetime<-strptime(subdata$Datetime, format='%d/%m/%Y %H:%M:%S')

# plot2
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
png('plot2.png',width=480, height=480)
plot(subdata$Datetime,subdata$Global_active_power,xlab=NA,ylab='Global Active Power (kilowatts)',type='l')
dev.off()
