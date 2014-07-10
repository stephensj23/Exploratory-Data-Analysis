## Process Data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075259,na.strings="?")
power.usage <- power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power.usage$Date <- as.Date(power.usage$Date,format="%d/%m/%Y")
power.usage$Time <- as.character(power.usage$Time)
power.usage$DateTime <- paste(power.usage$Date,power.usage$Time)
power.usage$DateTime <-strptime(power.usage$DateTime,format="%Y-%m-%d %H:%M:%S")

## Open plot
png("plot4.png",height=480,width=480)

## Set up plot with 4 sub plots by columns
par (mfcol = c(2,2))

## Plot 1
plot(power.usage$DateTime,power.usage$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power")

## Plot 2
plot(power.usage$DateTime,power.usage$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(power.usage$DateTime,power.usage$Sub_metering_2,col="red")
lines(power.usage$DateTime,power.usage$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

##Plot 3
plot(power.usage$DateTime,power.usage$Voltage, type="l", ylab="Voltage",xlab="datetime")

## Plot 4
plot(power.usage$DateTime,power.usage$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")

dev.off()

