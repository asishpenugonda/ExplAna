data<- "./HPC.txt"
HPC<- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
HPC.date<- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower<- as.numeric(HPC.date$Global_active_power)
globalReactivePower <- as.numeric(HPC.date$Global_reactive_power)
voltage <- as.numeric(HPC.date$Voltage)
HPC.datatime <- strptime(paste(HPC.date$Date, HPC.date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(HPC.date$Sub_metering_1)
subMetering2 <- as.numeric(HPC.date$Sub_metering_2)
subMetering3 <- as.numeric(HPC.date$Sub_metering_3)

png("plot4.png")
par(mfrow = c(2, 2)) 

plot(HPC.datatime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(HPC.datatime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(HPC.datatime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(HPC.datatime, subMetering2, type="l", col="red")
lines(HPC.datatime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(HPC.datatime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
