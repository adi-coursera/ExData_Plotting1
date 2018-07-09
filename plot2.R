library(data.table)
dataFull <- fread("household_power_consumption.txt")
data <- dataFull[Date=="1/2/2007" | Date=="2/2/2007"]
data$Global_active_power <- data[,as.numeric(Global_active_power)]
data$Date <- data[,as.Date(Date,format="%d/%m/%Y")]
data <- data[,datetime:=as.POSIXct(strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))]
png()
with(data, plot(datetime,Global_active_power,type = "n",xlab = "",ylab = "Global Active Power(kilowatts)"))
with(data, lines(datetime,Global_active_power))
dev.off()
