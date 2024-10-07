## Name         : Yash Kumar Singh
## Program Title: Constructing plot4.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
NEI <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/summarySCC_PM25.rds")
SCC <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/Source_Classification_Code.rds")

library(ggplot2)
graph <- merge(NEI, SCC, by = "SCC")
index <- grep("coal", graph$Short.Name, ignore.case = TRUE)
graph <- graph[index,]
graph <- aggregate(Emissions ~ year, graph, sum) 

##-------------------------------------------------------------------
## Constructing plot1.png
##-------------------------------------------------------------------
png(filename = "~/Exploratory-Data-Analysis-Assignment-2/plot4.png", width = 480, height = 480, units = "px", bg = "white")
g <- ggplot(graph, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions from Coal Combustion") + ggtitle("Variation in Coal Combustion Related Emissions over the years")
print(g)
dev.off()

##-------------------------------------------------------------------
