library(readr)
tennisdata <- read_csv("~/Notre Dame/ANN/tennisdata.csv")

library(readr)
match_scores_1991_2016_unindexed_csv <- read_csv("~/Notre Dame/ANN/match_scores_1991-2016_unindexed_csv.csv")

iddata<-match_scores_1991_2016_unindexed_csv

retiredata<-merge(tennisdata, iddata, by = "match_id")

flagrows <- grep("(RET)", retiredata$match_score_tiebreaks)

retiredata<-retiredata[-c(flagrows), ]

data<-retiredata

data<-data[, -c(1:5)]
data<-data[, -c(49:71)]




for (i in 1:nrow(data)){
  randint[i] = sample(0:1, 1)
  print(i)
  if (randint[i] == 0){
    data[i, c(1:24)] <- NA
    data[i, 49] = 0
  }
  if (randint[i] == 1){
    data[i, c(25:48)] <- NA
    data[i, 49] = 1
  }
}

winnerdata<-as.data.frame(matrix(0, ncol = 49))
names(winnerdata) <- names(data)
loserdata<-as.data.frame(matrix(0, ncol = 49))
names(loserdata) <- names(data)




for (i in 1:nrow(data)){
  print(i)
  if (data[i, 49] == 0){
    loserdata<-rbind(loserdata, data[i, ])
  }
  if (data[i, 49] == 1){
    winnerdata<-rbind(winnerdata, data[i, ])
  }
}

names(winnerdata)[49] <- "Result"
names(loserdata)[49] <- "Result"


for (i in 1:48){
  names(winnerdata)[i] <- substring(names(winnerdata[i]), 8:100)
}

for (i in 1:48){
  names(loserdata)[i] <- substring(names(loserdata[i]), 7:100)
}

winnerdata<-winnerdata[-c(25:48)]
loserdata<-loserdata[-c(1:24)]
winnerdata<-winnerdata[-1, ]
loserdata<-loserdata[-1, ]

finaldata<-merge(winnerdata, loserdata, all = TRUE)

write.csv(finaldata, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/FinalData.csv')

finaldatanew<-finaldata[finaldata$total_points_total!=0, ]

#Let's do 70000 training points and 18682 test points

train_ind <- sample(nrow(finaldatanew), size = 70000)

traindata<-finaldatanew[train_ind, ]
testdata<-finaldatanew[-train_ind, ]

traindatanona<-traindata[is.na(traindata$Result)==FALSE, ]
testdatanona<-testdata[is.na(testdata$Result)==FALSE, ]

final_ind_train <- sample(nrow(traindatanona), size = 69000)
final_ind_test <- sample(nrow(testdatanona), size = 18000)

traindatafinal <- traindatanona[final_ind_train, ]
testdatafinal <- testdatanona[final_ind_test, ]



#write.table(traindatainputs, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TrainDataInputs.csv', row.names = FALSE, col.names = FALSE, sep = ",")
#write.table(testdatainputs, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TestDataInputs.csv', row.names = FALSE, col.names = FALSE, sep = ",")
#write.table(traindataoutputs, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TrainDataOutputs.csv', row.names = FALSE, col.names = FALSE, sep = ",")
#write.table(testdataoutputs, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TestDataOutputs.csv', row.names = FALSE, col.names = FALSE, sep = ",")

write.table(traindatafinal, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TrainData.csv', row.names = FALSE, col.names = FALSE, sep = ",")
write.table(testdatafinal, file = 'C:/Users/birdz/OneDrive/Documents/Notre Dame/ANN/Project/TestData.csv', row.names = FALSE, col.names = FALSE, sep = ",")


