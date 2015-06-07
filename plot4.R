household.data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep=";")
household.data$Full_date <- paste(as.character(household.data$Date), as.character(household.data$Time), sep = " ")

household.data$Date <- as.Date(household.data$Date, "%d/%m/%Y")
household.subset <- household.data[(household.data$Date == ymd("2007-02-01")) | (household.data$Date == ymd("2007-02-02")),]
household.subset$new_date <- strptime(household.subset$Full_date, "%d/%m/%Y %H:%M:%S")

min_date <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
max_date <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

png(filename="./ExData_Plotting1/plot4.png", height=480, width=480, bg="white")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(household.subset, {
    plot(household.subset$new_date,household.subset$Global_active_power, type = "l",yaxt="n",xaxt="n",xlab="",ylab="Global active power")
    axis.POSIXct(1, at=seq(min_date, max_date, by="day"))
    axis(side=2, at=seq(0, 3000, 1000), labels=seq(0, 6, 2))
    plot(household.subset$new_date, household.subset$Voltage, type = "l", yaxt="n", xlab = "datetime", ylab = "Voltage")
    axis(side=2, at=c(800, 1200, 1600, 2000), labels=c(234, 238, 242, 246))
    plot(household.subset$new_date,household.subset$Sub_metering_1, type = "l",yaxt="n",xaxt="n",xlab="",ylab="Global active power")
    lines(household.subset$new_date, household.subset$Sub_metering_2, type = "l", col = "red")
    lines(household.subset$new_date, household.subset$Sub_metering_3, type = "l", col = "blue")
    axis.POSIXct(1, at=seq(min_date, max_date, by="day"))
    axis(side=2, at=seq(0, 40, 10), labels=seq(0, 40, 10))
    legend("topright", pch = 95, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    plot(household.subset$new_date, household.subset$Global_reactive_power, type = "l", yaxt="n", xlab ="datetime", ylab = "Global_reactive_power")
    axis(side=2, at=c(0, 50, 100, 150, 200, 250), labels=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
})




