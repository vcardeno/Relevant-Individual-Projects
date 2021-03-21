#Importing Data

library(readr)
ProjectData <- read_csv("ProjectData.csv")
View(ProjectData)

ProjectData$X1<-NULL
ProjectData$`MINUTES PLAYED`<-NULL

#First, let's do analysis with random forest with position as a predictor and see what we get.

RandForData<-ProjectData
RandForData$RESULT <- factor(RandForData$RESULT, levels = c("Loss", "Tie", "Win"))

library(caret)

attach(ProjectData)

RF1<-train(RESULT ~ ., method = "rf", data = RandForData, trControl = trainControl(method = "cv"), na.action = na.exclude)
VI.RF1<-varImp(RF1)
VI.RF1

#Now let's do logistic regression comparing two classes.

#Start with Win/Loss

#Have to subset data 

WinLossLogData<-ProjectData[RESULT=="Win" | RESULT=="Loss", ]

WinLossLogData$RESULT[WinLossLogData$RESULT=="Win"]<-1
WinLossLogData$RESULT[WinLossLogData$RESULT=="Loss"]<-0

WinLossLogData$RESULT<-as.factor(WinLossLogData$RESULT)
  

WinLossLogReg<-train(RESULT ~ ., data = WinLossLogData, method = "glm")
WinLossLogReg$results

summary(WinLossLogReg)




#Now we split it up into positions the way I specified in proposal, and do logistic and random forest for each group



#Let's start with CBs



CBRandForData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

CBRandForData$RESULT <- factor(CBRandForData$RESULT, levels = c("Loss", "Tie", "Win"))

CBRandForData$`PLAYERS POSITION`<-NULL

CBRandFor<-train(RESULT ~ ., method = "rf", data = CBRandForData, trControl = trainControl(method = "cv"), na.action = na.exclude)
CBRandFor$results
VI.CBRandFor<-varImp(CBRandFor)
VI.CBRandFor



#Now let's do logistic regression comparing two classes.

#Start with Win/Loss

#Have to subset data 

CBLogData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

CBWinLossLogData<-CBLogData[CBLogData$RESULT=="Win" | CBLogData$RESULT=="Loss", ]

CBWinLossLogData$RESULT[CBWinLossLogData$RESULT=="Win"]<-1
CBWinLossLogData$RESULT[CBWinLossLogData$RESULT=="Loss"]<-0

CBWinLossLogData$RESULT<-as.factor(CBWinLossLogData$RESULT)

CBWinLossLogData$`PLAYERS POSITION`<-NULL

CBWinLossLogReg<-train(RESULT ~ ., data = CBWinLossLogData, method = "glm")
CBWinLossLogReg$results

summary(CBWinLossLogReg)






#Now we do defensive midfielders


DMRandForData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="DMC" | ProjectData$`PLAYERS POSITION`=="DML" | ProjectData$`PLAYERS POSITION`=="DMR") , ]

DMRandForData$RESULT <- factor(DMRandForData$RESULT, levels = c("Loss", "Tie", "Win"))

DMRandForData$`PLAYERS POSITION`<-NULL

DMRandFor<-train(RESULT ~ ., method = "rf", data = DMRandForData, trControl = trainControl(method = "cv"), na.action = na.exclude)
DMRandFor$results
VI.DMRandFor<-varImp(DMRandFor)
VI.DMRandFor






#Now let's do logistic regression comparing two classes.

#Start with Win/Loss

#Have to subset data 

DMLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="DMC" | ProjectData$`PLAYERS POSITION`=="DML" | ProjectData$`PLAYERS POSITION`=="DMR") , ]

DMWinLossLogData<-DMLogData[DMLogData$RESULT=="Win" | DMLogData$RESULT=="Loss", ]

DMWinLossLogData$RESULT[DMWinLossLogData$RESULT=="Win"]<-1
DMWinLossLogData$RESULT[DMWinLossLogData$RESULT=="Loss"]<-0

DMWinLossLogData$RESULT<-as.factor(DMWinLossLogData$RESULT)

DMWinLossLogData$`PLAYERS POSITION`<-NULL

DMWinLossLogReg<-train(RESULT ~ ., data = DMWinLossLogData, method = "glm")
DMWinLossLogReg$results

summary(DMWinLossLogReg)





#Now do wide midfielders
WingRandForData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="AML" | ProjectData$`PLAYERS POSITION`=="AMR" | ProjectData$`PLAYERS POSITION`=="MR" | ProjectData$`PLAYERS POSITION`=="ML") , ]

WingRandForData$RESULT <- factor(WingRandForData$RESULT, levels = c("Loss", "Tie", "Win"))

WingRandForData$`PLAYERS POSITION`<-NULL

WingRandFor<-train(RESULT ~ ., method = "rf", data = WingRandForData, trControl = trainControl(method = "cv"), na.action = na.exclude)
WingRandFor$results
VI.WingRandFor<-varImp(WingRandFor)
VI.WingRandFor


#Now let's do logistic regression comparing two classes.

#Start with Win/Loss

#Have to subset data 

WingLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="AML" | ProjectData$`PLAYERS POSITION`=="AMR" | ProjectData$`PLAYERS POSITION`=="MR" | ProjectData$`PLAYERS POSITION`=="ML") , ]

WingWinLossLogData<-WingLogData[WingLogData$RESULT=="Win" | WingLogData$RESULT=="Loss", ]

WingWinLossLogData$RESULT[WingWinLossLogData$RESULT=="Win"]<-1
WingWinLossLogData$RESULT[WingWinLossLogData$RESULT=="Loss"]<-0

WingWinLossLogData$RESULT<-as.factor(WingWinLossLogData$RESULT)

WingWinLossLogData$`PLAYERS POSITION`<-NULL

WingWinLossLogReg<-train(RESULT ~ ., data = WingWinLossLogData, method = "glm")
WingWinLossLogReg$results

summary(WingWinLossLogReg)






#Last do it with strikers

StrRandForData<-ProjectData[ProjectData$`PLAYERS POSITION`== "CF", ]

StrRandForData$RESULT <- factor(StrRandForData$RESULT, levels = c("Loss", "Tie", "Win"))

StrRandForData$`PLAYERS POSITION`<-NULL

StrRandFor<-train(RESULT ~ ., method = "rf", data = StrRandForData, trControl = trainControl(method = "cv"), na.action = na.exclude)
StrRandFor$results
VI.StrRandFor<-varImp(StrRandFor)
VI.StrRandFor


#Now let's do logistic regression comparing two classes.

#Start with Win/Loss

#Have to subset data 

StrLogData<-ProjectData[ProjectData$`PLAYERS POSITION`== "CF", ]

StrWinLossLogData<-StrLogData[StrLogData$RESULT=="Win" | StrLogData$RESULT=="Loss", ]

StrWinLossLogData$RESULT[StrWinLossLogData$RESULT=="Win"]<-1
StrWinLossLogData$RESULT[StrWinLossLogData$RESULT=="Loss"]<-0

StrWinLossLogData$RESULT<-as.factor(StrWinLossLogData$RESULT)

StrWinLossLogData$`PLAYERS POSITION`<-NULL

StrWinLossLogReg<-train(RESULT ~ ., data = StrWinLossLogData, method = "glm")
StrWinLossLogReg$results

summary(StrWinLossLogReg)




#Two-Class Random Forests


#Whole Dataset

RandForData<-ProjectData

RandForDataTwoCl<-RandForData[RandForData$RESULT=="Win" | RandForData$RESULT=="Loss", ]


RandForDataTwoCl$RESULT <- factor(RandForDataTwoCl$RESULT, levels = c("Win", "Loss"))


RandForDataTwoCl$`PLAYERS POSITION`<-NULL


colnames(RandForDataTwoCl)<-make.names(colnames(RandForDataTwoCl))


RandForTwoCl<-train(RESULT ~ ., method = "rf", data = RandForDataTwoCl, ntree = 500, trControl = trainControl(method = "cv"), na.action = na.exclude)
RandForTwoCl$results


VI.RandForTwoCl<-varImp(RandForTwoCl)
VI.RandForTwoCl



#CB

CBRandForData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

CBRandForDataTwoCl<-CBRandForData[CBRandForData$RESULT=="Win" | CBRandForData$RESULT=="Loss", ]


CBRandForDataTwoCl$RESULT <- factor(CBRandForDataTwoCl$RESULT, levels = c("Win", "Loss"))


CBRandForDataTwoCl$`PLAYERS POSITION`<-NULL

colnames(CBRandForDataTwoCl)<-make.names(colnames(CBRandForDataTwoCl))


CBRandForTwoCl<-train(RESULT ~ ., method = "rf", data = CBRandForDataTwoCl, ntree = 500, trControl = trainControl(method = "cv"), na.action = na.exclude)
CBRandForTwoCl$results


VI.CBRandForTwoCl<-varImp(CBRandForTwoCl)
VI.CBRandForTwoCl


#DMs

DMRandForData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="DMC" | ProjectData$`PLAYERS POSITION`=="DML" | ProjectData$`PLAYERS POSITION`=="DMR") , ]


DMRandForDataTwoCl<-DMRandForData[DMRandForData$RESULT=="Win" | DMRandForData$RESULT=="Loss", ]


DMRandForDataTwoCl$RESULT <- factor(DMRandForDataTwoCl$RESULT, levels = c("Win", "Loss"))


DMRandForDataTwoCl$`PLAYERS POSITION`<-NULL

colnames(DMRandForDataTwoCl)<-make.names(colnames(DMRandForDataTwoCl))

DMRandForTwoCl<-train(RESULT ~ ., method = "rf", data = DMRandForDataTwoCl, ntree = 500, trControl = trainControl(method = "cv"), na.action = na.exclude)
DMRandForTwoCl$results

VI.DMRandForTwoCl<-varImp(DMRandForTwoCl)
VI.DMRandForTwoCl



#Wingers

WingRandForData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="AML" | ProjectData$`PLAYERS POSITION`=="AMR" | ProjectData$`PLAYERS POSITION`=="MR" | ProjectData$`PLAYERS POSITION`=="ML") , ]


WingRandForDataTwoCl<-WingRandForData[WingRandForData$RESULT=="Win" | WingRandForData$RESULT=="Loss", ]


WingRandForDataTwoCl$RESULT <- factor(WingRandForDataTwoCl$RESULT, levels = c("Win", "Loss"))


WingRandForDataTwoCl$`PLAYERS POSITION`<-NULL

colnames(WingRandForDataTwoCl)<-make.names(colnames(WingRandForDataTwoCl))

WingRandForTwoCl<-train(RESULT ~ ., method = "rf", data = WingRandForDataTwoCl, ntree = 500, trControl = trainControl(method = "cv"), na.action = na.exclude)
WingRandForTwoCl$results

VI.WingRandForTwoCl<-varImp(WingRandForTwoCl)
VI.WingRandForTwoCl


#Strikers

StrRandForData<-ProjectData[ProjectData$`PLAYERS POSITION`== "CF", ]

StrRandForDataTwoCl<-StrRandForData[StrRandForData$RESULT=="Win" | StrRandForData$RESULT=="Loss", ]


StrRandForDataTwoCl$RESULT <- factor(StrRandForDataTwoCl$RESULT, levels = c("Win", "Loss"))


StrRandForDataTwoCl$`PLAYERS POSITION`<-NULL

colnames(StrRandForDataTwoCl)<-make.names(colnames(StrRandForDataTwoCl))

StrRandForTwoCl<-train(RESULT ~ ., method = "rf", data = StrRandForDataTwoCl, ntree = 500, trControl = trainControl(method = "cv"), na.action = na.exclude)
StrRandForTwoCl$results

VI.StrRandForTwoCl<-varImp(StrRandForTwoCl)
VI.StrRandForTwoCl





#Let's take a look at what's most significant on both sides, take first 3 and then run partial dependence plots on them.
library(vip)
library(pdp)



#Whole Dataset

VI.RandForTwoCl
SigPredWinLossLogReg<-data.frame(summary(WinLossLogReg)$coef[summary(WinLossLogReg)$coef[,4] <= .05, 4])
SigPredWinLossLogReg

#Playing in Scoring Attacks
#Interceptions
#Picking Up Free Balls in Opp Half
PlayInScoreAtt<-partial(RandForTwoCl, "PLAYING.IN.SCORING.ATTACKS")
plotPartial(PlayInScoreAtt, engine = "ggplot2")

Intercept<-partial(RandForTwoCl, "INTERCEPTIONS")
plotPartial(Intercept, engine = "ggplot2")

PickUpFreeBalls<-partial(RandForTwoCl, "PICKING.UP.FREE.BALLS.IN.OPP.HALF")
plotPartial(PickUpFreeBalls, engine = "ggplot2")



#CBs

VI.CBRandForTwoCl
CBSigPredWinLossLogReg<-data.frame(summary(CBWinLossLogReg)$coef[summary(CBWinLossLogReg)$coef[,4] <= .05, 4])
CBSigPredWinLossLogReg

#Grave Mistakes
#Foul
#Pct of Acccurate Passes


CBGraveMistakes<-partial(CBRandForTwoCl, "GRAVE.MISTAKES")
plotPartial(CBGraveMistakes, engine = "ggplot2")

CBFoul<-partial(CBRandForTwoCl, "FOUL")
plotPartial(CBFoul, engine = "ggplot2")

CBPctAccPass<-partial(CBRandForTwoCl, "Pct.OF.ACCURATE.PASSES")
plotPartial(CBPctAccPass, engine = "ggplot2")

CBPctAccPassHist<-hist(CBRandForDataTwoCl$Pct.OF.ACCURATE.PASSES)

CBTackles<-partial(CBRandForTwoCl, "TACKLES")
plotPartial(CBTackles, engine = "ggplot2")



#DMs
DMSigPredWinLossLogReg<-data.frame(summary(DMWinLossLogReg)$coef[summary(DMWinLossLogReg)$coef[,4] <= .05, 4])
VI.DMRandForTwoCl
DMSigPredWinLossLogReg

#Interceptions
#Tackles
#Passes Accurate
#had only 2 common among logistic regression and random forest


DMIntercept<-partial(DMRandForTwoCl, "INTERCEPTIONS")
plotPartial(DMIntercept, engine = "ggplot2")

DMTackles<-partial(DMRandForTwoCl, "TACKLES")
plotPartial(DMTackles, engine = "ggplot2")

DMPassAccurate<-partial(DMRandForTwoCl, "PASSES.ACCURATE")
plotPartial(DMPassAccurate, engine = "ggplot2")

DMPassForw<-partial(DMRandForTwoCl, "PASSES.FORWARD.CAPTURE.ANGLE.180.DEGREES")
plotPartial(DMPassForw, engine = "ggplot2")


#Wingers
WingSigPredWinLossLogReg<-data.frame(summary(WingWinLossLogReg)$coef[summary(WingWinLossLogReg)$coef[,4] <= .05, 4])
VI.WingRandForTwoCl
WingSigPredWinLossLogReg

#From both: 

#Playing in Scoring Attacks
#Percent of Accurate Passes
#From variable importance:
#PASSES.BACK.ACCURATE.CAPTURE.ANGLE.180.DEGREES

WingPlayinScoreAtt<-partial(WingRandForTwoCl, "PLAYING.IN.SCORING.ATTACKS")
plotPartial(WingPlayinScoreAtt, engine = "ggplot2")

WingPctAccPass<-partial(WingRandForTwoCl, "Pct.OF.ACCURATE.PASSES")
plotPartial(WingPassForward)

WingPassBackAcc<-partial(WingRandForTwoCl, "PASSES.BACK.ACCURATE.CAPTURE.ANGLE.180.DEGREES")
plotPartial(WingPassBackAcc)

WingPassAcc<-partial(WingRandForTwoCl, "PASSES.ACCURATE")
plotPartial(WingPassAcc)

WingPassForward<-partial(WingRandForTwoCl, "PASSES.FORWARD.CAPTURE.ANGLE.180.DEGREES")
plotPartial(WingPassForward, engine = "ggplot2")




#Strikers

StrSigPredWinLossLogReg<-data.frame(summary(StrWinLossLogReg)$coef[summary(StrWinLossLogReg)$coef[,4] <= .05, 4])
VI.StrRandForTwoCl
StrSigPredWinLossLogReg


#Playing in Scoring Attacks
#Lost Balls
#Passes to the Left Accurate

StrPlayInScoreAtt<-partial(StrRandForTwoCl, "PLAYING.IN.SCORING.ATTACKS")
plotPartial(StrPlayInScoreAtt, engine = "ggplot2")

StrLostBalls<-partial(StrRandForTwoCl, "LOST.BALLS")
plotPartial(StrLostBalls, engine = "ggplot2")

StrPassAccLeft<-partial(StrRandForTwoCl, "PASSES.TO.THE.LEFT.ACCURATE.CAPTURE.ANGLE.180.DEGREES")
plotPartial(StrPassAccLeft, engine = "ggplot2")

StrPassForw<-partial(StrRandForTwoCl, "PASSES.FORWARD.CAPTURE.ANGLE.180.DEGREES")
plotPartial(StrPassForw, engine = "ggplot2")










TrialLogReg<-train(RESULT ~ ., data = StrWinLossLogData, method = "glm")
summary(TrialLogReg)

TrainStrSigPredWinLossLogReg<-data.frame(summary(TrialLogReg)$coef[summary(TrialLogReg)$coef[,4] <= .05, 4])
TrainStrSigPredWinLossLogReg





#See how a logistic regression does, let's use CB Win Loss again

set.seed(101)
sample<-sample.int(n=nrow(CBWinLossLogData), size = floor(.8*nrow(CBWinLossLogData)), replace = FALSE)
train<-CBWinLossLogData[sample, ]
test<-CBWinLossLogData[-sample, ]

TrialTrainLogReg<-glm(RESULT ~ ., data = train)
predictions <- TrialTrainLogReg %>% predict(test, type = "response")
predicted.classes <- ifelse(predictions > 0.5, 1, 0)

mean(predicted.classes == test$RESULT)










#Got it all done, let's try RF with only two categories and see if predictive power improves

CBRandForData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

trialData<-CBRandForData[CBRandForData$RESULT=="Win" | CBRandForData$RESULT=="Loss", ]


trialData$RESULT <- factor(trialData$RESULT, levels = c("Loss", "Win"))


trialData$`PLAYERS POSITION`<-NULL


trialRF<-train(RESULT ~ ., method = "rf", data = trialData, trControl = trainControl(method = "cv"), na.action = na.exclude)
trialRF$results

#Improves mightily when comparing two classes, interesting

VI.trialRF<-varImp(trialRF)
VI.trialRF


library(vip)
library(pdp)
attach(trialData)
p1 = partial(trialRF, pred.var = "GRAVE.MISTAKES")
plotPartial(p1, engine = "ggplot2")



#Extracting Significant Predictors for Presentation and maybe Paper

SigPredWinLossLogReg<-data.frame(summary(WinLossLogReg)$coef[summary(WinLossLogReg)$coef[,4] <= .05, 4])
CBSigPredWinLossLogReg<-data.frame(summary(CBWinLossLogReg)$coef[summary(CBWinLossLogReg)$coef[,4] <= .05, 4])
StrSigPredWinLossLogReg<-data.frame(summary(StrWinLossLogReg)$coef[summary(StrWinLossLogReg)$coef[,4] <= .05, 4])


colnames(trialData)<-make.names(colnames(trialData))



install.packages("pROC")
library("pROC")

predictions<-predict(trialRF, trialData$RESULT)



#Next do Win/Tie

WinTieLogData<-ProjectData[RESULT=="Win" | RESULT=="Tie", ]

WinTieLogData$RESULT[WinTieLogData$RESULT=="Win"]<-1
WinTieLogData$RESULT[WinTieLogData$RESULT=="Tie"]<-0

WinTieLogData$RESULT<-as.numeric(WinTieLogData$RESULT)


WinTieLogReg<-glm(RESULT ~ ., data = WinTieLogData)

summary(WinTieLogReg)

#Last do Tie/Loss

TieLossLogData<-ProjectData[RESULT=="Tie" | RESULT=="Loss", ]

TieLossLogData$RESULT[TieLossLogData$RESULT=="Tie"]<-1
TieLossLogData$RESULT[TieLossLogData$RESULT=="Loss"]<-0

TieLossLogData$RESULT<-as.numeric(TieLossLogData$RESULT)


TieLossLogReg<-glm(RESULT ~ ., data = TieLossLogData)

summary(TieLossLogReg)







#Next do Win/Tie

CBLogData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

CBWinTieLogData<-CBLogData[CBLogData$RESULT=="Win" | CBLogData$RESULT=="Tie", ]

CBWinTieLogData$RESULT[CBWinTieLogData$RESULT=="Win"]<-1
CBWinTieLogData$RESULT[CBWinTieLogData$RESULT=="Tie"]<-0

CBWinTieLogData$RESULT<-as.numeric(CBWinTieLogData$RESULT)

CBWinTieLogData$`PLAYERS POSITION`<-NULL

CBWinTieLogReg<-glm(RESULT ~ ., data = CBWinTieLogData)

summary(CBWinTieLogReg)

#Last do Tie/Loss

CBLogData<-ProjectData[ProjectData$`PLAYERS POSITION`=="CD", ]

CBTieLossLogData<-CBLogData[CBLogData$RESULT=="Tie" | CBLogData$RESULT=="Loss", ]

CBTieLossLogData$RESULT[CBTieLossLogData$RESULT=="Tie"]<-1
CBTieLossLogData$RESULT[CBTieLossLogData$RESULT=="Loss"]<-0

CBTieLossLogData$RESULT<-as.numeric(CBTieLossLogData$RESULT)

CBTieLossLogData$`PLAYERS POSITION`<-NULL

CBTieLossLogReg<-glm(RESULT ~ ., data = CBTieLossLogData)

summary(CBTieLossLogReg)








#Next do Win/Tie

DMLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="DMC" | ProjectData$`PLAYERS POSITION`=="DML" | ProjectData$`PLAYERS POSITION`=="DMR") , ]

DMWinTieLogData<-DMLogData[DMLogData$RESULT=="Win" | DMLogData$RESULT=="Tie", ]

DMWinTieLogData$RESULT[DMWinTieLogData$RESULT=="Win"]<-1
DMWinTieLogData$RESULT[DMWinTieLogData$RESULT=="Tie"]<-0

DMWinTieLogData$RESULT<-as.numeric(DMWinTieLogData$RESULT)

DMWinTieLogData$`PLAYERS POSITION`<-NULL

DMWinTieLogReg<-glm(RESULT ~ ., data = DMWinTieLogData)

summary(DMWinTieLogReg)

#Last do Tie/Loss

DMLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="DMC" | ProjectData$`PLAYERS POSITION`=="DML" | ProjectData$`PLAYERS POSITION`=="DMR") , ]

DMTieLossLogData<-DMLogData[DMLogData$RESULT=="Tie" | DMLogData$RESULT=="Loss", ]

DMTieLossLogData$RESULT[DMTieLossLogData$RESULT=="Tie"]<-1
DMTieLossLogData$RESULT[DMTieLossLogData$RESULT=="Loss"]<-0

DMTieLossLogData$RESULT<-as.numeric(DMTieLossLogData$RESULT)

DMTieLossLogData$`PLAYERS POSITION`<-NULL

DMTieLossLogReg<-glm(RESULT ~ ., data = DMTieLossLogData)

summary(DMTieLossLogReg)








#Next do Win/Tie

WingLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="AML" | ProjectData$`PLAYERS POSITION`=="AMR" | ProjectData$`PLAYERS POSITION`=="MR" | ProjectData$`PLAYERS POSITION`=="ML") , ]

WingWinTieLogData<-WingLogData[WingLogData$RESULT=="Win" | WingLogData$RESULT=="Tie", ]

WingWinTieLogData$RESULT[WingWinTieLogData$RESULT=="Win"]<-1
WingWinTieLogData$RESULT[WingWinTieLogData$RESULT=="Tie"]<-0

WingWinTieLogData$RESULT<-as.numeric(WingWinTieLogData$RESULT)

WingWinTieLogData$`PLAYERS POSITION`<-NULL

WingWinTieLogReg<-glm(RESULT ~ ., data = WingWinTieLogData)

summary(WingWinTieLogReg)

#Last do Tie/Loss

WingLogData<-ProjectData[(ProjectData$`PLAYERS POSITION`=="AML" | ProjectData$`PLAYERS POSITION`=="AMR" | ProjectData$`PLAYERS POSITION`=="MR" | ProjectData$`PLAYERS POSITION`=="ML") , ]

WingTieLossLogData<-WingLogData[WingLogData$RESULT=="Tie" | WingLogData$RESULT=="Loss", ]

WingTieLossLogData$RESULT[WingTieLossLogData$RESULT=="Tie"]<-1
WingTieLossLogData$RESULT[WingTieLossLogData$RESULT=="Loss"]<-0

WingTieLossLogData$RESULT<-as.numeric(WingTieLossLogData$RESULT)

WingTieLossLogData$`PLAYERS POSITION`<-NULL

WingTieLossLogReg<-glm(RESULT ~ ., data = WingTieLossLogData)

summary(WingTieLossLogReg)








#Next do Win/Tie

StrLogData<-ProjectData[ProjectData$`PLAYERS POSITION`== "CF", ]

StrWinTieLogData<-StrLogData[StrLogData$RESULT=="Win" | StrLogData$RESULT=="Tie", ]

StrWinTieLogData$RESULT[StrWinTieLogData$RESULT=="Win"]<-1
StrWinTieLogData$RESULT[StrWinTieLogData$RESULT=="Tie"]<-0

StrWinTieLogData$RESULT<-as.numeric(StrWinTieLogData$RESULT)

StrWinTieLogData$`PLAYERS POSITION`<-NULL

StrWinTieLogReg<-glm(RESULT ~ ., data = StrWinTieLogData)

summary(StrWinTieLogReg)

#Last do Tie/Loss

StrLogData<-ProjectData[ProjectData$`PLAYERS POSITION`== "CF", ]

StrTieLossLogData<-StrLogData[StrLogData$RESULT=="Tie" | StrLogData$RESULT=="Loss", ]

StrTieLossLogData$RESULT[StrTieLossLogData$RESULT=="Tie"]<-1
StrTieLossLogData$RESULT[StrTieLossLogData$RESULT=="Loss"]<-0

StrTieLossLogData$RESULT<-as.numeric(StrTieLossLogData$RESULT)

StrTieLossLogData$`PLAYERS POSITION`<-NULL

StrTieLossLogReg<-glm(RESULT ~ ., data = StrTieLossLogData)

summary(StrTieLossLogReg)


