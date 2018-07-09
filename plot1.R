library(data.table)
dataFull <- fread("Project1/household_power_consumption.txt")
data <- dataFull[Date=="1/2/2007" | Date=="2/2/2007"]
data$Global_active_power <- data[,as.numeric(Global_active_power)]
png()
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power")
dev.off()

