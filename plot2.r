plot2 <- function() {
	## Reading data file "household_power_consumption.txt"
	##  for Data range: 1/2/2007 to 2/2/2007
	data <- read.csv("../household_power_consumption.txt", sep=";", skip=66636, nrows=2880)

	## Setting colnames to data
	colNames <- readLines(file("../household_power_consumption.txt"), n = 1)
	colNames <- unlist(strsplit(colNames, ";"))
	names(data) <- colNames
	
	## Plotting line graph
	par(mfrow = c(1,1)) #making sure it is a single panel diagram
	dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	plot(dateTime, 
		data$Global_active_power, 
		type="l", 
		ylab="Global Active Power (kilowatts)", 
		xlab="")

	## Saving plot into a png file
	dev.copy(png, "plot2.png")
	dev.off()
}