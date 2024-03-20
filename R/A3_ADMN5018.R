install.packages("ggplot2")
library(ggplot2)

df <- Car
str(df)


#Scatter Plot
pl <- ggplot(df,aes(x=Engine_size, y=Horsepower))  
pl + geom_point()
pl + geom_point(aes(color=Fuel_efficiency))
pl + geom_point(aes(color=Fuel_efficiency), size=2)+
  scale_color_gradient(high = 'darkred', low = 'green')+
  ggtitle('Engine Size, Horsepower, and Fuel Efficiency Correlation')

#BoxPlot
df <- Car
pl <- ggplot(df,aes(Fuel_efficiency))
pl + geom_boxplot(aes(fill=factor(Vehicle_type))) + coord_flip() +
ggtitle('Comparison of Fuel Efficiency Across Vehicle Types')

#Histogram
pl <- ggplot(df, aes(x=Fuel_efficiency))
pl + geom_histogram()
pl + geom_histogram(binwidth = 2, color='black', fill = 'darkred', linetype = 'longdash')+ 
  xlab("Fuel_efficiency")+
  ylab("Occurences")+
  ggtitle('Fuel_efficiency_Distribution')

#Bar Plot
pl <- ggplot(df, aes(Fuel_efficiency))
pl + geom_bar()
pl + geom_bar(aes(fill=Vehicle_type))
pl + geom_bar(aes(fill=Vehicle_type),position = 'fill')

