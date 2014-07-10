power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075259,na.strings="?")
power.usage <- power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
png("plot1.png",height=480,width=480)
hist(power.usage$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
