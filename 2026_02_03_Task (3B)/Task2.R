student_names <- c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", 
                   "Larson", "Holland", "Paul", "Simu", "Renner")

exam_scores <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)

student_records <- as.list(exam_scores)
names(student_records) <- student_names

scores_vector <- unlist(student_records)

highest <- max(scores_vector)
lowest <- min(scores_vector)
avg <- mean(scores_vector)

high_student <- names(scores_vector)[scores_vector == highest]
low_student <- names(scores_vector)[scores_vector == lowest]

print(paste("Highest Score:", highest))
print(paste("Lowest Score:", lowest))
print(paste("Average Score:", avg))
print(paste("Student with highest score:", paste(high_student, collapse = ", ")))
print(paste("Student with lowest score:", paste(low_student, collapse = ", ")))