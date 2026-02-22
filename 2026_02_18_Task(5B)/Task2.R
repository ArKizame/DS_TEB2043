n <- as.integer(readline(prompt = "Input an integer: "))

for (i in 1:n) {
  print(paste("Number is: ", i, " and cube of the ", i, " is :", i^3, sep = ""))
}