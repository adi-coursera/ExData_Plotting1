library(data.table)
dataFull <- fread("household_power_consumption.txt")
data <- dataFull[Date=="1/2/2007" | Date=="2/2/2007"]
data$Global_active_power <- data[,as.numeric(Global_active_power)]
data$Date <- data[,as.Date(Date,format="%d/%m/%Y")]
data <- data[,datetime:=as.POSIXct(strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))]
data$Voltage <- data[,as.numeric(Voltage)]
data$Global_intensity <- data[,as.numeric(Global_intensity)]
png()
with(data,plot(datetime,Global_intensity,type="n"))
with(data,lines(datetime,Global_intensity))
dev.off()
