#Read data
power <- read.table("household_power_consumption.txt", skip=1, sep=";")
#Name variables with given labels
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset power for the two days requested
powerdates <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007") 
#Converting data and time to Date and POSIXlt
powerdates$Date <- as.Date(powerdates$Date, format="%d/%m/%Y")
powerdates$Time <- strptime(powerdates$Time, format="%H:%M:%S")

#Setting parameters for joining four plots
par(mfrow=c(2,2))

#Building first plot
plot(powerdates$Time, as.numeric(powerdates$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") ## Plot 2
# Building second plot
plot(powerdates$Time,as.numeric(powerdates$Voltage), type="l",xlab="datetime",ylab="Voltage")
# Plot 3
plot(powerdates$Time, powerdates$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(powerdates,lines(Time,as.numeric(Sub_metering_1)))
with(powerdates,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(powerdates,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Building plot 4
plot(powerdates$Time,as.numeric(powerdates$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")

#Copying the plot to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()




