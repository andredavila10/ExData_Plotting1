#Read data
power <- read.table("household_power_consumption.txt", skip=1, sep=";")
#Name variables with given labels
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset power for the two days requested
powerdates <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007") 
#Converting data and time to Date and POSIXlt
powerdates$Date <- as.Date(powerdates$Date, format="%d/%m/%Y")
powerdates$Time <- strptime(powerdates$Time, format="%H:%M:%S")

#Creating plot (without data)
plot(powerdates$Time, powerdates$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
#Annotating plot
with(powerdates,lines(Time,as.numeric(Sub_metering_1)))
with(powerdates,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(powerdates,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Copying the plot to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()