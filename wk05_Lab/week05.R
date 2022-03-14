#'---
#' title: "Lab Week 5 Data visualization"
#' author: "Sam Altshuler (PID: A59010373)"
#' date: "2/2/2022"
#' ---
# load up ggplot, don't need to install every time
# install.packages("ggplot2")
library(ggplot2)

# cars dataset already loaded in base R
View(cars)

# typical base R clock
plot(cars)

# ggplot cars (no aesthetic choosen so blank square)
ggplot(cars)

# add in x and y variables and make a scatter plot
p <- ggplot(cars, aes(x= speed, y = dist))+
  geom_point()
p

#add an unnecessary line
p+geom_line()

# add a fitted line
p+ geom_smooth(method = "lm")

# add in some labels/titles and black and white theme
p + labs(title = "Speed vs Stopping Distance of Cars", 
         x = "Speed (mph)", y = "Stopping distance (feet)", 
         caption = "Dataset: 'cars'") + 
  theme_bw() +
  geom_smooth(method = "lm", se = F)


# add in some aesthetics witha new dataset
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Get some information about this dataset
nrow(genes)
ncol(genes)
colnames(genes)
table(genes$State)

# percent of total genes in each state with two significant figures
round( table(genes$State)/nrow(genes) *100, 2)

#plot the data from genes dataset
x <- ggplot(genes)+
  aes(x = Condition1, y = Condition2)+
  geom_point()
x

# color this plot by State (up, down, unchanging)
x <- ggplot(genes)+
  aes(x = Condition1, y = Condition2, col = State)+
  geom_point()
x
# Add some custom colors and labels 
x <- x + scale_color_manual( values = c("blue", "gray", "red")) + 
  labs(title = "Gene Expression Changes Upon Drug Treatment", 
         x = "Control (no drug)", y = "Drug Treatment")
x