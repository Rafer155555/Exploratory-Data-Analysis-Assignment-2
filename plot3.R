## Name         : Yash Kumar Singh
## Program Title: Constructing plot3.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
NEI <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/summarySCC_PM25.rds")
SCC <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/Source_Classification_Code.rds")

library(ggplot2)
graph <- NEI[NEI$fips == "24510",]
graph <- aggregate(Emissions ~ year + type, graph, sum) 

##-------------------------------------------------------------------
## Constructing plot1.png
##-------------------------------------------------------------------
png(filename = "~/Exploratory-Data-Analysis-Assignment-2/plot3.png", width = 600, height = 480, units = "px", bg = "white")
g <- ggplot(graph, aes(year, Emissions, col = type))
g <- g + geom_line() + xlab("Year") + ylab("Total PM2.5 Emission in Baltimore City") + ggtitle("Variation in PM2.5 Emission in Baltimore City over the years")
print(g)
dev.off()

##-------------------------------------------------------------------
