household.data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep=";")
household.data$Full_date <- paste(as.character(household.data$Date), as.character(household.data$Time), sep = " ")

household.data$Date <- as.Date(household.data$Date, "%d/%m/%Y")
household.subset <- household.data[(household.data$Date == ymd("2007-02-01")) | (household.data$Date == ymd("2007-02-02")),]


png(filename="./plot1.png", height=480, width=480, bg="white")
hist(as.numeric(household.subset$Global_active_power), xaxt='n', col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)");
axis(side=1, at=seq(0, 3000, 1000), labels=seq(0, 6, 2))
dev.off()

