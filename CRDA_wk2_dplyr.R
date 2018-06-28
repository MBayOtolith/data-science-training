library(tidyverse)
str(iris)

#data frames allow for multiple classes
#matrices do not
as.matrix(iris) #converts all to character
as.matrix(iris[,1:4]) #subset only numbers, matrix is only numbers

summary(iris) #quick summary of diff quantiles, means, sample size
View(iris)  #provides almost spread sheet window that can be popped out

#$ can extract columns by their name
mean(iris$Sepal.Length)   #mean for the whole data frame

#use filter to find species specific means
help(filter)
filter(starwars, species == "Human") #from examples 
filter(iris, Species == "virginica") #adapt to our data
#means for only 1 species
v <- filter(iris, Species == "virginica")
mean(v$Sepal.Length)  #so these are different

#dplry's data manipulation fxns play well w/ each other
#ALWAYS RETURNS A DATA.FRAME 
#mutate() select()
#shared sytax fxname(data.frame.name)
select(iris, -Petal.Length)
l <- select(iris, -Petal.Width, -Sepal.Width)
write.csv(l, filename = "lenghts.csv")  #will write to working directory, use getwd() to find directory

#
mutate(iris, avg = mean(Sepal.Length))  #add the global mean to a new col called avg
#to calc species specific means, old way in R makes you think invertedly
mutate(filter(iris, Species == "virignica"), avg = mean(Sepal.Length))
#dplyr suggests coding is read Left To Right w/ a fxn called "the pipe" %>%
#keystroke is CMD/CTRL + SHIFT + M 

#group by applys the functions based on groups of "Species" (in this case)
iris %>% group_by(Species) %>% mutate(means = mean(Sepal.Length)) %>% View()
iris %>% mutate(means = mean(Sepal.Length)) %>% View()


iris %>% group_by(Species) %>% summarize(means = mean(Sepal.Length))
#can string together summary statements separated by commas
iris %>% group_by(Species) %>% summarize(means = mean(Sepal.Length), 
                                         medians = median(Sepal.Length), 
                                         mins = min(Sepal.Length), 
                                         sd = sd(Sepal.Length))

#write out data to a data frame & make it a csv
lengths <- iris %>% group_by(Species) %>% summarize(means = mean(Sepal.Length), 
                                                    medians = median(Sepal.Length), 
                                                    mins = min(Sepal.Length), 
                                                    sd = sd(Sepal.Length))
write.csv(lengths, file = "lengths.csv")

#do it based on ratio of Length to Width
iris %>% group_by(Species) %>% summarize(mean = mean(Sepal.Length), 
                                         ratio = mean(Sepal.Length/Sepal.Width), 
                                         medians = median(Sepal.Length), 
                                         mins = min(Sepal.Length), 
                                         sd = sd(Sepal.Length))

#use select to disregard (or keep columns)
iris %>% group_by(Species) %>% 
  mutate(ratio = Sepal.Length/Sepal.Width) %>% 
  select(-Sepal.Length, -Sepal.Width) %>% 
  #select(Petal.Length, Petal.Width, Species, ratio)  #these ^^ cmds are equivalent
  #arrange() can order the data.frame
  arrange(ratio) %>% 
  #can also do it in reverse
  arrange(desc(ratio))
