library(tidyverse)

install.packages("geometry")
library(geometry)
install.packages("factoextra")
library(factoextra)

#generating random data
set.seed(246)
W = sort(rnorm(30, 0, 2))
noise = rnorm(30, 0, 2)
X = 0.4 * W + noise

Y = sort(rnorm(10,0, 2))
noise = rnorm(10,0,2)
Z = 1 * Y + noise

random_data = data.frame(W, X, Y, Z)
head(random_data)

#compute outcome
outcome = 1 + 2 * W + 3 * X + 3 * Y + 2 * Z
outcome

#PCA
res_pca = prcomp(random_data, scale=TRUE)
summary(res_pca)

str(res_pca)

#visualize eigenvalues to show percentage of variances explained by each PC
fviz_eig(res_pca)

#individual point graph - visualized each point with color by quality of representation so points are grouped together based on similar profile
fviz_pca_ind(res_pca,
             col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))

#variable graph - added color to visualize level of contribution of each PC
fviz_pca_var(res_pca,         
             col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))
             

#biplot of individual points and variables
fviz_pca_biplot(res_pca, repel = TRUE,
                col.var = "#2E9FDF",
                col.ind = "#696969")
