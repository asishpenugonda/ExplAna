data<- "./HPC.txt"
HPC<- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
HPC.date<- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower<- as.numeric(HPC.date$Global_active_power)
HPC.datatime <- strptime(paste(HPC.date$Date, HPC.date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("Plot2.png")
plot(HPC.datatime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
