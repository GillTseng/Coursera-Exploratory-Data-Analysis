# Loading data
data<-read.table('./Exploratory Data Analysis/household_power_consumption.txt',sep=';',
                 header=TRUE,stringsAsFactors=FALSE,dec='.')
str(data)

# subset data from 2007-02-01 and 2007-02-02
subdata<-subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# plot1
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
png('plot1.png',width=480, height=480)
hist(subdata$Global_active_power, col='red', main= 'Global Active Power \n from 2007-2-1 to 2007-2-2', xlab='household global active power (kilowatt)')
dev.off()
