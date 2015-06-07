household.data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep=";")
household.data$Full_date <- paste(as.character(household.data$Date), as.character(household.data$Time), sep = " ")

household.data$Date <- as.Date(household.data$Date, "%d/%m/%Y")
household.subset <- household.data[(household.data$Date == ymd("2007-02-01")) | (household.data$Date == ymd("2007-02-02")),]
household.subset$new_date <- strptime(household.subset$Full_date, "%d/%m/%Y %H:%M:%S")

min_date <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
max_date <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

png(filename="./ExData_Plotting1/plot2.png", height=480, width=480, bg="white")
plot(household.subset$new_date,household.subset$Global_active_power, type = "l",yaxt="n",xaxt="n",xlab="",ylab="Global active power")
axis.POSIXct(1, at=seq(min_date, max_date, by="day"))
axis(side=2, at=seq(0, 3000, 1000), labels=seq(0, 6, 2))
dev.off()


