household.data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep=";")
household.data$Full_date <- paste(as.character(household.data$Date), as.character(household.data$Time), sep = " ")

household.data$Date <- as.Date(household.data$Date, "%d/%m/%Y")
household.subset <- household.data[(household.data$Date == ymd("2007-02-01")) | (household.data$Date == ymd("2007-02-02")),]
household.subset$new_date <- strptime(household.subset$Full_date, "%d/%m/%Y %H:%M:%S")

min_date <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
max_date <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

png(filename="./ExData_Plotting1/plot3.png", height=480, width=480, bg="white")
plot(household.subset$new_date,household.subset$Sub_metering_1, type = "l",yaxt="n",xaxt="n",xlab="",ylab="Global active power")
lines(household.subset$new_date, household.subset$Sub_metering_2, type = "l", col = "red")
lines(household.subset$new_date, household.subset$Sub_metering_3, type = "l", col = "blue")
axis.POSIXct(1, at=seq(min_date, max_date, by="day"))
axis(side=2, at=seq(0, 40, 10), labels=seq(0, 40, 10))
legend("topright", pch = 95, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()


