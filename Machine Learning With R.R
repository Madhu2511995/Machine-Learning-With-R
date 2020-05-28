# Machine Learning with R

# Linear Regression
# Create An input 
x<-c(151,174,138,186,128,136,179,163,152,131)
y<-c(63,81,56,91,47,57,76,72,62,48)

# Create Linear Model
model=lm(y~x)
print(model)

# Plot the Model
plot(x,y,col="blue",asp=4)
abline(model,col="red")

#Prediction 
a<-data.frame(x=174)
result=predict(model,a)
print(result)


# Multi Regression

# Show inbuilt dataset r
View(mtcars)

# Create Input
input=mtcars[,c("mpg","disp","hp","wt")]
View(input)

# Create Multi Regression Model 
model=lm(mpg~disp+hp+wt,data=input)
print(model)
summary(model)

# Predication
a=data.frame(disp=221,hp=102,wt=2.91)
result=predict(model,a)
cat("Mileage:-",result)



# Classification Technique
# Decision Tree
# Read The data
head(iris)

# Create Decision tree model
tree<-rpart(Species~Petal.Length+Petal.Width,data=iris,method = "class")
tree

# Plot Decision tree
rpart.plot(tree)

# Draw rhe confusion matrix
table(iris$Species,predict(tree,type = "class"))

# Give our data to find the value 
a<-data.frame(Species=90,Petal.Length=50,Petal.Width=50)
p=predict(tree,a,type = "class")
p
View(p)

# Random Forest
library(party)
library(randomForest)
View(readingSkills)

table(readingSkills$nativeSpeaker)

# Create Random Forest model
output_forest<- randomForest(nativeSpeaker~age+shoeSize+score,readingSkills)
print(output_forest)

# Predication
df=data.frame(age=11,shoeSize=30,score=35)
predict(output_forest,df)



# SVM(Support Vector Machine)
library(e1071)

# Create SVM model
output_Svm<- svm(nativeSpeaker~age+shoeSize+score,readingSkills)
print(output_Svm)

# Predication
df=data.frame(age=10,shoeSize=30,score=52)
predict(output_Svm,df)




