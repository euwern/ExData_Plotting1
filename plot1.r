plot1 <- function() {
	## Reading data file "household_power_consumption.txt"
	##  for Data range: 1/2/2007 to 2/2/2007
	data <- read.csv("../household_power_consumption.txt", sep=";", skip=66636, nrows=2880)

	## Setting colnames to data
	colNames <- readLines(file("../household_power_consumption.txt"), n = 1)
	colNames <- unlist(strsplit(colNames, ";"))
	names(data) <- colNames
	
	## Plotting hist
	par(mfrow = c(1,1)) #making sure it is a single panel diagram
	hist(data$Global_active_power, 
		col='red', 
		main="Global Active Power", 
		xlab="Global Active Power (kilowatts)")	

	## Saving plot into a png file
	dev.copy(png, "plot1.png")
	dev.off()
}