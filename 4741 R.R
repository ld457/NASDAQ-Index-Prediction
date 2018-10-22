data<-read.csv("Data.V7.csv")
feature<-data[1:20]
# Correlation of features
a<-cor(feature)

# PCA
pca<-princomp(feature,cor=T)
pca
pca$loadings
s<-pca$sdev
s
round(s^2,4)
t<-sum(s^2)
round(s^2/t,4)
cumsum(s^2/t)
screeplot(pca,type="lines")

# Classification tree
data1<-data[c(-21,-22)]
library(rpart)
ctree<-rpart(Change~.,data=data1,method="class")
plot(ctree,asp=40)
text(ctree,use.n=T,cex=0.6)

n<-nrow(data1)
set.seed(11)
id<-sample(1:n,size=3000)
d1<-data1[id,]
d2<-data1[-id,]
ctree<-rpart(Change~.,data=d1,method="class")
summary(ctree)
plot(ctree,asp=40)
text(ctree,use.n=T,cex=0.6)
pr1<-predict(ctree)
cl1<-max.col(pr1)
table(cl1,d1$Change)
pr2<-predict(ctree,d2)
cl2<-max.col(pr2)
table(cl2,d2$Change)

error_train<-(table(cl1,d1$Change)[2]+table(cl1,d1$Change)[3])/sum(table(cl1,d1$Change))
error_test<-(table(cl2,d2$Change)[2]+table(cl2,d2$Change)[3])/sum(table(cl2,d2$Change))
error_train
error_test

data1<-data[c(13,15,20,23)]
data1

n<-nrow(data1)
set.seed(2)
id<-sample(1:n,size=3000)
d1<-data1[id,]
d2<-data1[-id,]
ctree<-rpart(Change~.,data=d1,method="class")
summary(ctree)
plot(ctree,asp=40)
text(ctree,use.n=T,cex=0.6)
pr1<-predict(ctree)
cl1<-max.col(pr1)
table(cl1,d1$Change)
pr2<-predict(ctree,d2)
cl2<-max.col(pr2)
table(cl2,d2$Change)

error_train<-(table(cl1,d1$Change)[2]+table(cl1,d1$Change)[3])/sum(table(cl1,d1$Change))
error_test<-(table(cl2,d2$Change)[2]+table(cl2,d2$Change)[3])/sum(table(cl2,d2$Change))
error_train
error_test


data3<-data[c(7,9,11,13,14,15,20,21,23)]

data1<-data[c(7,9,11,13,14,15,20,21,23)]
n<-nrow(data1)
set.seed(12306)
id<-sample(1:n,size=3000)
d1<-data1[id,]
d2<-data1[-id,]
ctree<-rpart(Change~.,data=d1,method="class")
summary(ctree)
plot(ctree,asp=40)
text(ctree,use.n=T,cex=0.6)
pr1<-predict(ctree)
cl1<-max.col(pr1)
table(cl1,d1$Change)
pr2<-predict(ctree,d2)
cl2<-max.col(pr2)
table(cl2,d2$Change)

error_train<-(table(cl1,d1$Change)[2]+table(cl1,d1$Change)[3])/sum(table(cl1,d1$Change))
error_test<-(table(cl2,d2$Change)[2]+table(cl2,d2$Change)[3])/sum(table(cl2,d2$Change))
error_train
error_test

library(rpart)
ctree<-rpart(Change~.,data=data2,method="class")
plot(ctree,asp=40)
text(ctree,use.n=T,cex=0.6)

# Artificial Neural Network
library(nnet)
data.nn<-nnet(feature,data1$Change,size=2,linout=T,try=10)
summary(data.nn)
pred<-round(data.nn$fit)
table(pred,data1$Change)

n<-nrow(data1)
set.seed(12345)
id<-sample(1:n,size=3000)
d1<-data1[id,]
d2<-data1[-id,]
data.nn<-nnet(d1[1:20],d1$Change,size=2,linout=T,try=10)
data.nn$Valune
summary(data.nn)
pred1<-round(data.nn$fit)
table(pred1,d1$Change)
pred2<-round(predict(data.nn,d2))
table(pred2,d2$Change)
error_train<-(table(pred1,d1$Change)[2]+table(pred1,d1$Change)[3])/sum(table(pred1,d1$Change))
error_test<-(table(pred2,d2$Change)[2]+table(pred2,d2$Change)[3])/sum(table(pred2,d2$Change))
error_train
error_test


# K-means Clustering
km<-kmeans(feature,2)
print(km)
table(km$cluster,data1$Change)
plot(feature,col=km$cluster)

#time series
LogRval=LogR$V2
LogRval=tail(LogRval,-1)
LogRvalTrain=LogRval[1:3607]
LogRvalTrue=LogRval[3608:3617]
fit=auto.arima(LogRvalTrain)
LogRvalPredict=forecast(fit,10)
plot(LogRvalPredict$mean)
par(new=TRUE)
plot(LogRvalTrue,type="o")
