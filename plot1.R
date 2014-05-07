## This program reads a subset of "household_power_consumption.txt" file and creates a histogram
## on the Global_active_power column.  The histogram is saved as a .png file named "plot1.png"


input <- read.table("household_power_consumption.txt",skip=66637,nrow=2880,sep=";",
                    col.names=colnames(read.table("household_power_consumption.txt",nrow=1,header=TRUE,sep=";")))

## create .png file of the histogram
png("plot1.png",width=480,height=480)
hist(input$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")
dev.off()   ## Close graphics file
