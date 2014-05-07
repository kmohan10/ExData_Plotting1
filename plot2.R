## This program reads a subset of "household_power_consumption.txt" file and creates a histogram
## on the Global_active_power column.  The histogram is saved as a .png file named "plot1.png"

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
png("plot2.png",width=480,height=480)
plot(input$dateTime2,input$Global_active_power,type='l',xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()   ## Close graphics file