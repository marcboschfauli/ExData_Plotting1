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

# Plot 3 
with(df,{
  plot(x=Datetime,y=Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="",cex=0.7) 
  ## add data to plot with lines 
  lines(x=Datetime,y=Sub_metering_2,col="red")
  lines(x=Datetime,y=Sub_metering_3,col="blue")
  
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7, pt.cex = 1,x.intersp=0,y.intersp=0.7)
# Save to PNG File 
dev.copy(png,file="plot3.png", height=504, width=504)
dev.off()
