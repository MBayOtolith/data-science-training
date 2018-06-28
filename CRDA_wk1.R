getwd()
setwd()

#here i define my working directory
wd <-  "Users/jhmoxley/Documents/Biologia & Animales/[[GitTank]]/CRDA"
setwd(wd)

c(1,2,3,4,5,6,7,8)
1:100 #this is the same as : seq(1,100,by=1)
seq(from = 0, to = 100, by = 10)
seq(from=0, to = 100, length.out=4)
seq(from=0, to = 100, length.out=5)

yearvec <- seq(from=1890, to = 2015, by = 1)
#vector, i.e. vec, same variable.. lots of values

names <- c("Katie", "Will", "Lizzie", "Alli")
str()
names[3]
help(subset)

df <- data.frame(years = yearvec, students = rep(names, length.out = length(yearvec)), stringsAsFactors = F)
head(df, 100); tail(df, 50)
#find instances of katie's name                 
df$students == "Katie"
#find rows where year is greater than 1986
df[df$years >= 1986,]
df['years' >= 1986,]
subset(df, years < 1986); 
df[df$students == "Alli",]; str(df[df$students == "Alli",]) 

#saving data frames
write.csv(df[df$students == "Alli",], file = "/Users/jhmoxley/Desktop/Alli.csv")


#writing csv 
write.csv(df[df$students == "Alli",], file = "/Users/jhmoxley/Desktop/Alli.csv")

