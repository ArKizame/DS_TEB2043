age <- c(55, 57, 56, 52, 51, 59, 58, 53, 59, 55, 60, 60, 60, 60, 52, 55, 56, 51, 60,
         52, 54, 56, 52, 57, 54, 56, 58, 53, 53, 50, 55, 51, 57, 60, 57, 55, 51, 50, 57, 58)

age_factor <- factor(age)

print(paste("Staff Age", "Total number of staff"))

unique_ages <- sort(unique(age))

for (a in unique_ages) {
  count <- 0
  for (x in age) {
    if (x == a) {
      count <- count + 1
    }
  }
  print(paste(a, count))
}

range1_count <- 0
range2_count <- 0
range3_count <- 0
range4_count <- 0
range5_count <- 0

for (x in age) {
  if (x >= 50 & x < 52) {
    range1_count <- range1_count + 1
  } else if (x >= 52 & x < 54) {
    range2_count <- range2_count + 1
  } else if (x >= 54 & x < 56) {
    range3_count <- range3_count + 1
  } else if (x >= 56 & x < 58) {
    range4_count <- range4_count + 1
  } else if (x >= 58 & x <= 60) {
    range5_count <- range5_count + 1
  }
}

print(paste("Age Range", "Total number of staff"))
print(paste("50-52", range1_count))
print(paste("52-54", range2_count))
print(paste("54-56", range3_count))
print(paste("56-58", range4_count))
print(paste("58-60", range5_count))

print(paste("Conclusion: The age range with the highest number of staff is 58-60."))