plot4 <- function() {
	## Reading data file "household_power_consumption.txt"
	##  for Data range: 1/2/2007 to 2/2/2007
	data <- read.csv("../household_power_consumption.txt", sep=";", skip=66636, nrows=2880)

	## Setting colnames to data
	colNames <- readLines(file("../household_power_consumption.txt"), n = 1)
	colNames <- unlist(strsplit(colNames, ";"))
	names(data) <- colNames
	
	## Plotting line graph
	dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	par(mfrow = c(2,2)) #making sure it is 4 panels diagram
	
	## - plotting Global_active_power against dateTime
	plot(dateTime, 
		data$Global_active_power, 
		type="l", 
		ylab="Global Active Power", 
		xlab="")	

	## - plotting Voltage against dateTime
	plot(dateTime, 
		data$Voltage, 
		type="l", 
		ylab="Voltage", 
		xlab="datetime")	

	## - plotting Sub_metering_n against dateTime
	plot(dateTime, 
		data$Sub_metering_1, 
		type="l", 
		ylab="Energy sub metering", 
		xlab="")
	
	lines(dateTime, data$Sub_metering_2, col="red")
	lines(dateTime, data$Sub_metering_3, col="blue")	

	legend("topright", 
		c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), 
		lty=c(1,1,1),       #lineType = 1(solid line)
		lwd=c(2.5,2.5,2.5), #lineWidth = 2.5
		col=c("black","red","blue")) #lineColor
	
	## - plotting Global_reactive_power against dateTime
	plot(dateTime, 
		data$Global_reactive_power, 
		type="l", 
		ylab="Global_reactive_power", 
		xlab="datetime")	


	## Saving plot into a png file
	dev.copy(png, "plot4.png")
	dev.off()
}