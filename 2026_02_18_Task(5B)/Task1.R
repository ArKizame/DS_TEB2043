year <- as.integer(readline(prompt = "Input year: "))

if ((year %% 4 == 0 & year %% 100 != 0) | (year %% 400 == 0)) {
  print(paste("Output:", year, "is a leap year."))
} else {
  print(paste("Output:", year, "is a not leap year."))
}