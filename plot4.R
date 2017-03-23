## read data from the txt file, remove ";" separator, use the header, change those dataset with missing values to "?".
HPC <- read.table("Household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## Convert dates format
as.Date(HPC$Date, "%d/%m/%Y")

## Subset the data
Selected_Date <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"), ]

## Combine dates and times
Selected_Date$DateTime <- strptime(paste(Selected_Date$Date, Selected_Date$Time), "%d/%m/%Y %H:%M:%S")


## create 2x2 chart area
par(mfrow = c(2, 2))

## Topleft chart
plot(Selected_Date$DateTime, Selected_Date$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

## Topright chart
plot(Selected_Date$DateTime, Selected_Date$Voltage, type = "l", xlab="datetime", ylab="Voltage")

## Bottomleft chart
with(Selected_Date, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(Selected_Date$DateTime, Selected_Date$Sub_metering_2, col = "Red")
lines(Selected_Date$DateTime, Selected_Date$Sub_metering_3, col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

## Bottomright chart
plot(Selected_Date$DateTime, Selected_Date$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")


## Save plot4.png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

