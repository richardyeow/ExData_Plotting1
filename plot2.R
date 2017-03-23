## read data from the txt file, remove ";" separator, use the header, change those dataset with missing values to "?".
HPC <- read.table("Household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## Convert dates format
as.Date(HPC$Date, "%d/%m/%Y")

## Subset the data
Selected_Date <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"), ]

## Combine dates and times
Selected_Date$DateTime <- strptime(paste(Selected_Date$Date, Selected_Date$Time), "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(Selected_Date$DateTime, Selected_Date$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

## Save plot2.png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

