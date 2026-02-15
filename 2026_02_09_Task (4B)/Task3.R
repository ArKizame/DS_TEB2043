v1 <- c(1:24)
v2 <- c(25:54)

array1 <- array(v1, dim = c(2, 4, 3))
array2 <- array(v2, dim = c(3, 2, 5))

print(paste("Array1"))
print(array1)

print(paste("Array2"))
print(array2)

print(paste('"The second row of the second matrix of the array:"'))
print(paste(array1[2, , 2], collapse = " "))

print(paste('"The element in the 3rd row and 3rd column of the 1st matrix:"'))
print(paste(array2[3, 2, 1]))