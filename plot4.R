# Read File
df<-read.csv("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,
             na.strings="?",quote="\"",check.names=FALSE,comment.char="",sep=";")

# Transform dates and times 
df$Date<-as.Date(df$Date,"%d/%m/%Y")

# Retrieve months of interest (subset)
df<-subset(df,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Merge Date and Time into a new column
df$Datetime<-paste(df$Date,df$Time)
df$Datetime<-strptime(df$Datetime,"%Y-%m-%d %H:%M:%S")

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(df, {
  plot(x=Datetime,y=Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(x=Datetime,y=Voltage, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(x=Datetime,y=Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(x=Datetime,y=Sub_metering_2,col='Red')
  lines(x=Datetime,y=Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         ,cex=0.7, pt.cex = 1,y.intersp=0.5)
  plot(x=Datetime,y=Global_reactive_power, type="l", 
       xlab="datetime")
})

# Save to PNG File 
dev.copy(png,file="plot4.png", height=504, width=504)
dev.off()