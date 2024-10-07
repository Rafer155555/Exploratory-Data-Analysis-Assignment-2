## Name         : Yash Kumar Singh
## Program Title: Constructing plot1.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
NEI <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/summarySCC_PM25.rds")
SCC <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/Source_Classification_Code.rds")

graph <- NEI[,c(4,6)]
graph <- split(graph, graph$year)
graph <- lapply(graph, sum)
graph <- as.numeric(graph)
years <- c('1999', '2002', '2005', '2008')
m <- matrix(rep(0,4),nrow = 1, ncol = 4)
m[1,] <- graph
colnames(m) <- years
rm(graph,years)

##-------------------------------------------------------------------
## Constructing plot1.png
##-------------------------------------------------------------------
png(filename = "~/Exploratory-Data-Analysis-Assignment-2/plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(1,1), mar = c(4,5,2.5,2))
barplot(m, col = 'wheat', xlab = "Year", ylab = "Total PM2.5 Emission", main = "Variation in PM2.5 Emission in US over the years")
dev.off()

##-------------------------------------------------------------------

