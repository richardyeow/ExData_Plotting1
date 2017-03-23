## read data from the txt file, remove ";" separator, use the header, change those dataset with missing values to "?".
HPC <- read.table("Household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## Convert dates format
as.Date(HPC$Date, "%d/%m/%Y")

## Subset the data
Selected_Date <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"), ]

## Combine dates and times
Selected_Date$DateTime <- strptime(paste(Selected_Date$Date, Selected_Date$Time), "%d/%m/%Y %H:%M:%S")


## Plot 3
with(Selected_Date, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(Selected_Date$DateTime, Selected_Date$Sub_metering_2, col = "Red")
lines(Selected_Date$DateTime, Selected_Date$Sub_metering_3, col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save plot3.png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
