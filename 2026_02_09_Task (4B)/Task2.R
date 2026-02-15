V1 <- c(2, 3, 1, 5, 4, 6, 8, 7, 9)

m1 <- matrix(V1, nrow = 3, ncol = 3, byrow = TRUE)

m2 <- t(m1)

rownames(m1) <- c("Row1", "Row2", "Row3")
colnames(m1) <- c("Col1", "Col2", "Col3")

rownames(m2) <- c("Row1", "Row2", "Row3")
colnames(m2) <- c("Col1", "Col2", "Col3")

mat_add <- m1 + m2
mat_sub <- m1 - m2
mat_mul <- m1 * m2
mat_div <- m1 / m2

print(paste("--- Matrix 1 ---"))
for (i in 1:3) {
  print(paste(m1[i, 1], m1[i, 2], m1[i, 3]))
}

print(paste("--- Matrix 2 (Transpose) ---"))
for (i in 1:3) {
  print(paste(m2[i, 1], m2[i, 2], m2[i, 3]))
}

print(paste("--- Addition Result ---"))
for (i in 1:3) {
  print(paste(mat_add[i, 1], mat_add[i, 2], mat_add[i, 3]))
}

print(paste("--- Subtraction Result ---"))
for (i in 1:3) {
  print(paste(mat_sub[i, 1], mat_sub[i, 2], mat_sub[i, 3]))
}

print(paste("--- Multiplication Result ---"))
for (i in 1:3) {
  print(paste(mat_mul[i, 1], mat_mul[i, 2], mat_mul[i, 3]))
}

print(paste("--- Division Result ---"))
for (i in 1:3) {
  print(paste(mat_div[i, 1], mat_div[i, 2], mat_div[i, 3]))
}