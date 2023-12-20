#install pre requisite packages
install.packages("stats")
install.packages("dplyr")
install.packages("corrr")
install.packages("ggcorrplot")
install.packages("FactoMineR")
install.packages("factoextra")

#Load required libraries
library(stats)
library(dplyr)
library(corrr)
library(ggcorrplot)
library(FactoMineR)
library(factoextra)


#diabetes data
#read.csv("E:\\Kaggle\\diabetes.xlsx")

read.csv("E:\\HPL\\Hazop excel\\BEU_a.csv")


mydata<- read.csv("E:\\Kaggle\\diabetes.csv", header = TRUE) 
mydata
head(mydata)
#unsupervised Learning - hence converting diabetes data into unlabeled data
mydata= select(mydata,c(1,2,3,4,5,6,7,8))
data_normalized <- scale(mydata)
head(data_normalized)


# check PCA eligibility #

corr_matrix <- cor(data_normalized)
ggcorrplot(corr_matrix)



# Principal component analysis #
data.pca <- princomp(corr_matrix)
summary(data.pca)


data.pca$loadings[, 1:3]

#Visualization of principal components

#scree plot

fviz_eig(data.pca, addlabels = TRUE)

#biplot of the atrribute#
# Graph of the variables #
fviz_pca_var(data.pca, col.var = "black")

fviz_cos2(data.pca, choice = "var", axes = 1:2)

fviz_pca_var(data.pca, col.var = "cos2",
             gradient.cols = c("black", "orange", "green"),
             repel = TRUE)

