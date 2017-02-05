setwd("./ExplAna/Week1")
data<- "./HPC.txt"
HPC<- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
HPC.date<- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower<- as.numeric(HPC.date$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power (Kilowatts)")
dev.off()
