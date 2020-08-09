#Read data
power <- read.table("household_power_consumption.txt", skip=1, sep=";")
#Name variables with given labels
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset power for the two days requested
powerdates <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007") 
#Converting data and time to Date and POSIXlt
powerdates$Date <- as.Date(powerdates$Date, format="%d/%m/%Y")
powerdates$Time <- strptime(powerdates$Time, format="%H:%M:%S")
#Formatting according to date
powerdates[1:1440,"Time"] <- format(powerdates[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerdates[1441:2880,"Time"] <- format(powerdates[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plotting scatterplot
plot(powerdates$Time, as.numeric(powerdates$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Copying the plot to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
