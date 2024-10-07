## Name         : Yash Kumar Singh
## Program Title: Constructing plot2.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
NEI <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/summarySCC_PM25.rds")
SCC <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/Source_Classification_Code.rds")

graph <- NEI[NEI$fips == "24510",]
graph <- aggregate(Emissions ~ year, graph, sum)

##-------------------------------------------------------------------
## Constructing plot1.png
##-------------------------------------------------------------------
png(filename = "~/Exploratory-Data-Analysis-Assignment-2/plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(1,1), mar = c(4,5,2.5,2))
barplot(height=graph$Emissions, col = 'wheat', xlab = "Year", ylab = "Total PM2.5 Emission in Baltimore City", main = "Variation in PM2.5 Emission in Baltimore City over the years")
dev.off()

##-------------------------------------------------------------------

