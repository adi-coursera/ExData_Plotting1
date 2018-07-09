library(data.table)
dataFull <- fread("household_power_consumption.txt")
data <- dataFull[Date=="1/2/2007" | Date=="2/2/2007"]
data$Global_active_power <- data[,as.numeric(Global_active_power)]
data$Date <- data[,as.Date(Date,format="%d/%m/%Y")]
data <- data[,datetime:=as.POSIXct(strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))]
data$Voltage <- data[,as.numeric(Voltage)]
png()
par(mfrow=c(2,2))
with(data, plot(datetime,Global_active_power,type = "n",xlab = "",ylab = "Global Active Power(kilowatts)"))
with(data, lines(datetime,Global_active_power))
with(data,plot(datetime,Voltage,type = "n",xlab = "",ylab = "Voltage"))
with(data,lines(datetime,Voltage))
plot(data$datetime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1,col="black")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Submetering 1","Submetering 2","Submetering 3"),col=c("black","red","blue"),lty=1)
with(data,plot(datetime,Global_reactive_power,type = "n",xlab = "",ylab = "Global Reactive Power"))
with(data,lines(datetime,Global_reactive_power))
dev.off()
