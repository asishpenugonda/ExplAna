data<- "./HPC.txt"
HPC<- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
HPC.date<- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower<- as.numeric(HPC.date$Global_active_power)
HPC.datatime <- strptime(paste(HPC.date$Date, HPC.date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(HPC.date$Sub_metering_1)
subMetering2 <- as.numeric(HPC.date$Sub_metering_2)
subMetering3 <- as.numeric(HPC.date$Sub_metering_3)

png("plot3.png")
plot(HPC.datatime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(HPC.datatime, subMetering2, type="l", col="red")
lines(HPC.datatime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
