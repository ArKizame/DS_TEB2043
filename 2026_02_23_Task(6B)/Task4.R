score.data <- data.frame(
  name = c("Anastasia","Dima","Michael","Matthew","Laura","Kevin","Jonas"),
  score = c(12.5,9.0,16.5,12.0,9.0,8.0,19.0),
  attempt = c(1,3,2,3,2,1,2)
)
score.data$qualify = c("yes","no","yes","no","no","no","yes")
score.newdata <- data.frame(
  name = c ("Emily"),
  score = c(14.5),
  attempt = c(1),
  qualify = c("yes")
)
score.finaldata <- rbind(score.data,score.newdata)

score.finaldata$qualify <- as.factor(score.finaldata$qualify)

print(paste("Number of rows:", nrow(score.finaldata)))
print(paste("Number of columns:", ncol(score.finaldata)))

print("Structure of the Data Frame:")
str(score.finaldata)

print("Summary of the Data Frame:")
summary(score.finaldata)
print(score.finaldata)