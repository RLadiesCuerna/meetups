#!/usr/bin/env Rscript
#  ggplot2_Rladies.R
#  Copyright 2020- E. Ernestina Godoy Lozano (tinagodoy@gmail.com)
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#

#### Load library
library(ggplot2)
library(gcookbook)
library(reshape2)

getwd()
setwd("~/Documents/RLadiesCuerna")

############ qplot() exercise

# Use data from numeric vectors
x <- 1:10
y <- rnorm(10, 4.5, 0.1)

# Basic plot
qplot(x,y)

# Add line
qplot(x, y, geom=c("point", "line"))

# Use data from a data frame, "mtcars" is include in ggplot2 library
# Explore data
head(mtcars)
dim(mtcars)
summary(mtcars)

qplot(x=mpg, y=wt, data=mtcars)

# Smoothing (add a smoothed line with its standard error)
qplot(x=mpg, y=wt, data = mtcars, geom = c("point", "smooth"))

# Linear fits by group
qplot(x=mpg, y=wt, data = mtcars, color = factor(cyl), geom=c("point", "smooth"))

# Change the color by a continuous numeric variable
qplot(x=mpg, y=wt, data = mtcars, colour = cyl)

# Change the color by groups (factor)
df <- mtcars
df[,'cyl'] <- as.factor(df[,'cyl'])
qplot(x=mpg, y=wt, data = df, colour = cyl)

# Add lines
qplot(mpg, wt, data = df, colour = cyl, geom=c("point", "line")) + theme_bw()
    
# Add layers
qplot(mpg, wt, data = df, colour = cyl, geom=c("point", "line")) + theme_bw()  


############ ggplot() exercise
## Use "iris" data included in ggplot2 library
# Explore the data
head(iris)
summary(iris)
dim(iris)

# add data to an object with the ggplot() function
p <- ggplot(data=iris)
## add aesthetics
p <- p + aes(x= Petal.Length, y = Petal.Width, colour = Species)

### Another way to do the previus code in one line

p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))

### We're gonna explore our "p" object
summary(p)

## Add layers
p <- p + geom_point()
p

### Do it in one line
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + geom_point()

### Transform stadistical of the data 
p <- p + geom_smooth()

# in one line
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + geom_point() + geom_smooth()

## Facet grid
### Vertical
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point() + geom_smooth() +  facet_grid(~ Species)

### Horizontal
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point() + geom_smooth() +  facet_grid(Species ~.)

## Change the Theme
p <- p + theme_bw()
p
# Change another elements in theme
p <- p +  theme_bw() +  theme(panel.background = element_rect(fill = "lightyellow"), panel.grid.minor = element_line(linetype = "dotted")) 
p

guides(color = FALSE, size = FALSE)

#### Save images

# First option
### PNG with a resolution of 300 px
png("dot_plot_iris_data.png", width=10 *300, height=8*300, res= 300)
p
dev.off()

### PDF (vectorized image)
pdf("dot_plot_iris_data.pdf", width=10, height=8)
p
dev.off()

# Second option
ggsave("dot_plot_iris_data.jpg", device= "jpg")


####### Exercice: Bar plots

# data
cabbage_exp

### crear datos

cabbage_exp <- data.frame(Cultivar=c(rep("c39", 3), rep("c52", 3)), Date=rep(c("d16", "d20", "d21"),2), Weight=c(3.18, 2.80, 2.74, 2.26, 3.11, 1.47), sd= c(0.9566144, 0.2788867, 0.9834181, 0.4452215, 0.7908505, 0.2110819), n=rep(10,6), se=c(0.30250803, 0.08819171, 0.31098410, 0.14079141, 0.25008887, 0.06674995))


ggplot(data= cabbage_exp, aes(x=Date, y= Weight)) + geom_bar(stat="identity")
ggplot(data= cabbage_exp, aes(x=Date, y= Weight)) + geom_bar(stat="identity", fill="dodgerblue")
ggplot(data= cabbage_exp, aes(x=Date, y= Weight)) + geom_bar(stat="identity", fill="dodgerblue") + theme_bw()

### Graph with grouped bars
ggplot(data= cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
	geom_bar(stat="identity", position="dodge")

### Use another color palette
ggplot(data= cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
	geom_bar(stat="identity", position="dodge") +
	scale_fill_brewer(palette="Set1")

### Add text
ggplot(data= cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
	geom_bar(stat="identity") +
	scale_fill_brewer(palette="Set1") +
	geom_text(aes(label=Weight), vjust=1.5)

## position dodge
ggplot(data= cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
	geom_bar(stat="identity", position="dodge") +
	scale_fill_brewer(palette="Set1") +
	geom_text(aes(label=Weight), vjust=-0.4, position=position_dodge(0.9), size=3, colour="green4")

### Add error bars
ggplot(data= cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
	geom_bar(stat="identity", position="dodge") +
	scale_fill_brewer(palette="Set1") +
	g +
	theme_bw()

####### Exercice: Scatter plots

ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width)) +
	geom_point()
# split by color
ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width, colour=Species)) +
	geom_point()
#split by shape
ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width, shape=Species)) +
	geom_point()
#split by shape and color
ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width, shape=Species, colour=Species)) +
	geom_point() 
# change the values of shape
ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width, shape=Species, colour=Species)) +
	geom_point() +
	scale_shape_manual(values=c(1,2,3))

# change manual colors
ggplot(data= iris, aes(x= Petal.Length, y= Petal.Width, shape=Species, colour=Species)) +
	geom_point() +
	scale_shape_manual(values=c(1,2,3)) +
	scale_colour_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	theme_bw()

####### Exercice: Histograms
ggplot(data= iris, aes(x= Sepal.Width)) +
	geom_histogram()

# Pick a Better binwidth
ggplot(data= iris, aes(x= Sepal.Width)) +
	geom_histogram(binwidth=0.1)
	
# Divide the x range into 20 bins
binsize <- diff(range(iris$Sepal.Width))/20

# change the color of the bins
ggplot(data= iris, aes(x= Sepal.Width)) +
	geom_histogram(binwidth= binsize, colour="black", fill="royalblue4")

# Multiple histograms with different fill colors
ggplot(data= iris, aes(x= Sepal.Width, fill=Species)) +
	geom_histogram(binwidth= binsize, colour="black")
	
# Change the alpha
ggplot(data= iris, aes(x= Sepal.Width, fill=Species)) +
	geom_histogram(binwidth= binsize, position="identity", alpha=0.4)

# Density plot
ggplot(data= iris, aes(x= Sepal.Width, fill=Species, y= ..density..)) +
	geom_histogram(binwidth= binsize, position="identity", alpha=0.4, colour="gray") +	
	geom_density(alpha=0.4)

# Change the appearance
ggplot(data= iris, aes(x= Sepal.Width, fill=Species, y= ..density..)) +
	geom_histogram(binwidth= binsize, position="identity", alpha=0.4, colour="gray") +	
	geom_density(alpha=0.4) + 
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	theme_bw()

####### Exercice: Boxplots
# basic boxplot
ggplot(data=iris, aes(y= Sepal.Length, x= Species)) +
	geom_boxplot()

# With notch
ggplot(data=iris, aes(y= Sepal.Length, x= Species)) +
	geom_boxplot(notch= TRUE)
	
# Change the appearance
ggplot(data=iris, aes(y= Sepal.Length, x= Species, fill=Species)) +
	geom_boxplot(notch= TRUE) +
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	theme_bw()

## Change the labels
ggplot(data=iris, aes(y= Sepal.Length, x= Species, fill=Species)) +
	geom_boxplot(notch= TRUE) +
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	labs (title= " Boxplot Species", y= "Sepal length (cm)", x= "", fill= "") +
	theme_bw()

# Violin plot
ggplot(data=iris, aes(y= Sepal.Length, x= Species,  fill=Species)) +
	geom_violin() +
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	labs (title= " Boxplot Species", y= "Sepal length (cm)", x= "", fill= "") 

# Change the legend position
ggplot(data=iris, aes(y= Sepal.Length, x= Species,  fill=Species)) +
	geom_violin() +
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	labs (title= " Boxplot Species", y= "Sepal length (cm)", x= "", fill= "") +
	theme(legend.position="top")
	
#### Extra Exercice: Boxplots with facet wrap
library(reshape2)
tmp <- melt(iris)

# Explore the data
head(tmp)
dim(tmp)
summary(tmp)

# boxplot with facet wrap
ggplot(data= tmp, aes(x= Species, y= value)) +
	geom_boxplot() +
	facet_wrap(~variable)

# change the appearance
ggplot(data= tmp, aes(x= Species, y= value, fill= Species)) +
	geom_boxplot() +
	facet_wrap(~variable) +
	scale_fill_manual(values=c("deepskyblue", "seagreen2", "salmon")) +
	labs(y="cm", x="", fill="") +
	theme_bw()
