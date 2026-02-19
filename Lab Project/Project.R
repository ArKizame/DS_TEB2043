library(tidyverse)
library(lubridate)

raw_lines <- readLines("Unclean Dataset.csv")

header <- str_trim(unlist(str_split(raw_lines[1], ",")))

data_lines <- raw_lines[-1]

cleaned_lines <- str_remove_all(data_lines, ",+$")

remove_commas_in_quotes <- function(text) {
  str_replace_all(text, '"[^"]+"', function(m) str_replace_all(m, ",", ""))
}
cleaned_lines <- remove_commas_in_quotes(cleaned_lines)

cleaned_lines <- str_replace_all(cleaned_lines, "\\|", ",")

df_list <- list()
for (line in cleaned_lines) {
  parts <- str_trim(unlist(str_split(line, ",")))
  
  if (length(parts) > 0) {
    for (i in seq(1, length(parts), by = 8)) {
      chunk <- parts[i:min(i + 7, length(parts))]
      
      if (all(chunk == "")) next
      
      length(chunk) <- 8 
      df_list <- append(df_list, list(chunk))
    }
  }
}

uncleandata <- do.call(rbind, df_list) %>% as_tibble()
colnames(uncleandata) <- header

cleandata <- uncleandata %>%
  distinct() %>% 
  mutate(across(everything(), str_trim)) %>%
  
  mutate(
    Real_First_Name = ifelse(str_detect(Student_ID, "[A-Za-z]"), Student_ID, First_Name),
    Real_Student_ID = ifelse(str_detect(Student_ID, "[A-Za-z]"), NA_character_, Student_ID)
  ) %>%
  mutate(
    First_Name = Real_First_Name, 
    Student_ID = Real_Student_ID
  ) %>%
  select(-Real_First_Name, -Real_Student_ID) %>%
  
  mutate(
    Last_Name = ifelse(is.na(Last_Name) | Last_Name == "", word(First_Name, 2, -1), Last_Name),
    First_Name = word(First_Name, 1)
  ) %>%
  
  mutate(
    Hidden_Age = as.numeric(str_extract(Gender, "[0-9]+")),
    Gender = toupper(str_trim(str_remove_all(Gender, "[0-9]"))),
    Age = as.numeric(str_replace_all(Age, "[^0-9]", "")), 
    Age = ifelse(is.na(Age), Hidden_Age, Age)
  ) %>%
  select(-Hidden_Age) %>%
  
  mutate(
    Course = case_when(
      str_detect(Course, "(?i)Machine Learnin") ~ "Machine Learning",
      str_detect(Course, "(?i)Web Develop") ~ "Web Development",
      str_detect(Course, "(?i)Web Develp") ~ "Web Development",
      Course == "4" ~ NA_character_,
      TRUE ~ Course
    )
  ) %>%
  
  mutate(
    Total_Payments = str_replace_all(Total_Payments, "[^0-9.]", ""),
    Total_Payments = ifelse(is.na(Total_Payments) | Total_Payments == "", NA_character_, paste0("$", Total_Payments))
  ) %>%
  
  mutate(
    Enrollment_Date = na_if(Enrollment_Date, "NA"),
    Enrollment_Date = parse_date_time(Enrollment_Date, orders = c("ymd", "dmy", "mdy")),
    Enrollment_Date = as.Date(Enrollment_Date)
  ) %>%
  
  mutate(Student_ID = as.integer(Student_ID)) %>%
  mutate(
    Student_ID = if_else(
      is.na(Student_ID), 
      as.integer(max(Student_ID, na.rm = TRUE) + cumsum(is.na(Student_ID))), 
      Student_ID
    )
  )

View(cleandata)

write_csv(cleandata, "Cleaned_Dataset_Final.csv")
