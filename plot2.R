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


# Plot 2
plot(x=df$Datetime,y=df$Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab="")
# Save to PNG File 
dev.copy(png,file="plot2.png", height=504, width=504)
dev.off()
