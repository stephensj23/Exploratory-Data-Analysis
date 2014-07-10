power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075259,na.strings="?")
power.usage <- power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power.usage$Date <- as.Date(power.usage$Date,format="%d/%m/%Y")
power.usage$Time <- as.character(power.usage$Time)
power.usage$DateTime <- paste(power.usage$Date,power.usage$Time)
power.usage$DateTime <-strptime(power.usage$DateTime,format="%Y-%m-%d %H:%M:%S")
png("plot2.png",height=480,width=480)
plot(power.usage$DateTime,power.usage$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
