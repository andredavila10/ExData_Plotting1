#Read data
power <- read.table("household_power_consumption.txt", skip=1, sep=";")
#Name variables with given labels
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset power for the two days requested
powerdates <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007") 
powerdates$Date <- as.Date(powerdates$Date, format="%d/%m/%Y")
#Plotting histogram
hist(as.numeric(powerdates$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#Copying the plot to PNG
dev.copy(png, file="plot1.png", width = 480, height=480)
dev.off()

