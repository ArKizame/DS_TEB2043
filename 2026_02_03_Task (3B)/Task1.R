scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

gred_A <- 0
gred_B <- 0
gred_C <- 0
gred_D <- 0
gred_E <- 0
gred_F <- 0

for (s in scores) {
  if (s >= 90) {
    gred_A <- gred_A + 1
  } else if (s >= 80) {
    gred_B <- gred_B + 1
  } else if (s >= 70) {
    gred_C <- gred_C + 1
  } else if (s >= 60) {
    gred_D <- gred_D + 1
  } else if (s >= 50) {
    gred_E <- gred_E + 1
  } else {
    gred_F <- gred_F + 1
  }
}

print(paste("Grade A students: ",gred_A))
print(paste("Grade B students: ",gred_B))
print(paste("Grade C students: ",gred_C))
print(paste("Grade D students: ",gred_D))
print(paste("Grade E students: ",gred_E))
print(paste("Grade F students: ",gred_F))


for (i in 1:length(scores)) {
  if (scores[i] > 49) {
    print(paste("Student", i, ": PASS \n"))
  } else {
    print(paste("Student", i, ": FAIL \n"))
  }
}