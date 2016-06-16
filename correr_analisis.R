test <- read.table(paste(getwd(),"test/X_test.txt",sep = "/"),quote ="\"")
train <- read.table(paste(getwd(),"train/X_train.txt",sep = "/"),quote ="\"")
 
data <- rbind(train,test)
n <- ncol(data)
features <- read.table(paste(getwd(),"features.txt",sep = "/"),quote ="\"")[,2]
colnames(data) <- features

Meds <- grep('-(mean|std)\\(',features)
nn <- length(Meds)
ndata <- data.table(1:10299)
nam <- vector("character",0)

for(i in 1:nn){ 
    
    z <- Med[i]
    
    length(nam) <- length(nam)+1
    nam[i] <- as.character(features[z])
    ndata <- cbind(ndata,data[,z])
}

ndata$V1 <- NULL
colnames(ndata) <- nam

acttrain <- read.table(paste(getwd(),"train/y_train.txt",sep = "/"),quote ="\"")
acttest <- read.table(paste(getwd(),"test/y_test.txt",sep = "/"),quote ="\"")
actbind <- rbind(acttrain,acttest)[,1]

nact <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING")
actbind <- nact[actbind]
ndata <- cbind(Activity == actbind,ndata)

colnames(ndata) <- gsub("mean", "Mean", colnames(ndata))
colnames(ndata) <- gsub("std", "Std", colnames(ndata))
colnames(ndata) <- gsub("t", "Time", colnames(ndata))
colnames(ndata) <- gsub("f", "Frequency", colnames(ndata))
colnames(ndata) <- gsub("\\(\\)", "", colnames(ndata))
colnames(ndata) <- gsub("-", "", colnames(ndata))
colnames(ndata) <- gsub("BodyBody", "Body", colnames(ndata))
colnames(ndata) <- gsub("^", "MeanOf", colnames(ndata))
colnames(ndata)

mtrain <- read.table(paste(getwd(),"train/subject_train.txt",sep = "/"),quote ="\"")
mtest <- read.table(paste(getwd(),"test/subject_test.txt",sep = "/"),quote ="\"")
p <- rbind(mtrain,mtest)[,1]
ndata <- cbind(ind = p,ndata)

library(dplyr)
fmean <- ndata %>% group_by(ind,actbind) %>% summarise_each(funs(mean))