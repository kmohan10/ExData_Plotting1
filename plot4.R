## This program reads a subset of "household_power_consumption.txt" file and creates multiple line plots
## The plot is saved as a .png file named "plot4.png"

input <- read.table("household_power_consumption.txt",skip=66637,nrow=2880,sep=";",
                    col.names=colnames(read.table("household_power_consumption.txt",nrow=1,header=TRUE,sep=";")))

# Reformat the input date to YYYY-MM-DD format
input$Date <- as.Date(input$Date,format="%d/%m/%Y")

# Merge reformated date and time to form a single field
dateTime <- paste(input$Date,input$Time)

# Convert to actual Date and Time value using strptime function
dateTime2 <- strptime(dateTime, "%Y-%m-%d %H:%M:%S", tz = "EST")

# cbind new dateTime2 column to input dataframe
input <- cbind(input,dateTime2)

# Plot date/time on x axis and Global active power on y axis and create .png file
png("plot4.png",width=480,height=480)

par(mfrow=(c(2,2)))  # Divide graphics window 2x2

# Plot2
plot(input$dateTime2,input$Global_active_power,type='l',xlab = "",ylab="Global Active Power (kilowatts)")

#Plot Voltage
plot(input$dateTime2,input$Voltage,type='l',xlab = "datetime",ylab="Voltage")

# Plot 3
plot(input$dateTime2, input$Sub_metering_1, type='l',col="black", xlab="",ylab="Energy sub metering")
points(input$dateTime2, input$Sub_metering_2, type='l',col="red")
points(input$dateTime2, input$Sub_metering_3, type='l',col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=1, lty=c(1,1,1),col=c("black","red","blue"))

#Plot Reactive Power
plot(input$dateTime2,input$Global_reactive_power,type='l',xlab = "datetime",ylab="Global_reactive_power")

dev.off()   ## Close graphics file

