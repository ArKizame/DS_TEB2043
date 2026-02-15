weight<- readline(prompt = "Enter Your Weight: ")
weight<-as.numeric(weight)
height<- readline(prompt = "Enter Your Height: ")
height<-as.numeric(height)
bmi<- weight/ (height/100)^2
Underweight<-FALSE
Normal<-FALSE
Overweight<-FALSE
Obese<-FALSE
if (bmi <= 18.4){
  Underweight<-TRUE
} else if (bmi >= 18.5 && bmi<= 24.9) {
  Normal<-TRUE
} else if (bmi >= 25 && bmi<= 39.9) {
  Overweight<-TRUE
} else if (bmi >= 40.0) {
  Obese<-TRUE
}  
print(paste("BMI: ",bmi))
print(paste("Underweight: ",Underweight))
print(paste("Normal: ",Normal))
print(paste("Overweight: ",Overweight))
print(paste("Obese: ",Obese))