print("Check whether an n digits number is Armstrong or not:")
print("-------------------------------------------------------")

num <- as.integer(readline(prompt = "Input an integer: "))

sum <- 0
temp <- num
n <- nchar(as.character(num))

while (temp > 0) {
  digit <- temp %% 10
  sum <- sum + (digit ^ n)
  temp <- temp %/% 10
}

if (num == sum) {
  print(paste(num, "is an Armstrong number."))
} else {
  print(paste(num, "is not an Armstrong number."))
}