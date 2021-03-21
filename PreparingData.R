#Creating results column

library(readxl)
Victordata_field <- read_excel("instat_field.xlsx")
View(Victordata_field)
Victordata_field$`HOME TEAM AND SCORE`<-NULL
Victordata_field$`AWAY TEAM AND SCORE`<-NULL
Victordata_field$RESULT<-NA
Victordata_field$`HOME TEAM`<-trimws(Victordata_field$`HOME TEAM`, "b")
Victordata_field$`HOME TEAM SCORE`<-trimws(Victordata_field$`HOME TEAM SCORE`, "b")
Victordata_field$`AWAY TEAM`<-trimws(Victordata_field$`AWAY TEAM`, "b")
Victordata_field$`AWAY TEAM SCORE`<-trimws(Victordata_field$`AWAY TEAM SCORE`, "b")
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`HOME TEAM`) & (Victordata_field$`HOME TEAM SCORE` > Victordata_field$`AWAY TEAM SCORE`)]<-"Win"
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`HOME TEAM`) & (Victordata_field$`HOME TEAM SCORE` < Victordata_field$`AWAY TEAM SCORE`)]<-"Loss"
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`HOME TEAM`) & (Victordata_field$`HOME TEAM SCORE` == Victordata_field$`AWAY TEAM SCORE`)]<-"Tie"
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`AWAY TEAM`) & (Victordata_field$`HOME TEAM SCORE` > Victordata_field$`AWAY TEAM SCORE`)]<-"Loss"
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`AWAY TEAM`) & (Victordata_field$`HOME TEAM SCORE` < Victordata_field$`AWAY TEAM SCORE`)]<-"Win"
Victordata_field$RESULT[(Victordata_field$TEAM==Victordata_field$`AWAY TEAM`) & (Victordata_field$`HOME TEAM SCORE` == Victordata_field$`AWAY TEAM SCORE`)]<-"Tie"
#install.packages("nnet")
#install.packages("VGAM")
#library(nnet)
#testmodel<-multinom(Victordata_gk$RESULT~Victordata_gk$`GOALKEEPERS GOALS CONCEDED`)
#summary(testmodel)
#got expected results
#don't forget to attach(dataset)

#to write to Excel
install.packages("writexl")
library(writexl)
write_xlsx(x=Victordata_field, path="Victordata_fieldresults.xlsx", col_names = TRUE)



#Putting it in per-90 minute terms
library(readxl)
Victordata_fieldresults <- read_excel("Victordata_fieldresults.xlsx")
View(Victordata_fieldresults)
fielddata<-Victordata_fieldresults
attach(fielddata)
length(which(fielddata$`MINUTES PLAYED` >= 20))
#6118
length(fielddata)
#68
length(which(fielddata$`MINUTES PLAYED` >= 30))
#5602
over30<-fielddata[fielddata$`MINUTES PLAYED` >= 30, ]
relevantcolumns<-c(GOALS, ASSISTS, `PLAYING IN SCORING ATTACKS`, `GRAVE MISTAKES`, `YELLOW CARDS`, `RED CARDS`, FOUL, `FOUL SUFFERED`, SHOTS, `SHOTS ON TARGET`, PASSES, `PASSES ACCURATE`, `EXTRA ATTACKING AND KEY PASSES`, `EXTRA ATTACKING AND KEY PASSES - ACCURATE`, CROSSES, `CROSSES - ACCURATE`, CHALLENGES, `CHALLENGES WON`, `DEFENSIVE CHALLENGES`, `DEFENSIVE CHALLENGES SUCCESSFUL`, `ATTACKING CHALLENGES`, `ATTACKING CHALLENGES SUCCESSFUL`, `AIR CHALLENGES`, `AIR CHALLENGES WON`, DRIBBLES, `DRIBBLES SUCCESSFUL`, TACKLES, `TACKLES SUCCESSFUL`, INTERCEPTIONS, `INTERCEPTIONS IN OPP HALF`, `PICKING UP FREE BALLS`, `PICKING UP FREE BALLS IN OPP HALF`, `LOST BALLS`, `LOST BALLS IN OWN HALF`, `BALL RECOVERIES`, `BALL RECOVERY IN OPP HALF`, `PASSES FORWARD CAPTURE ANGLE 180 DEGREES`, `PASSES BACK CAPTURE ANGLE 180 DEGREES`, `PASSES TO THE LEFT CAPTURE ANGLE 180 DEGREES`, `PASSES TO THE RIGHT CAPTURE ANGLE 180 DEGREES`, `PASSES FORWARD ACCURATE CAPTURE ANGLE 180 DEGREES`, `PASSES BACK ACCURATE CAPTURE ANGLE 180 DEGREES`, `PASSES TO THE LEFT ACCURATE CAPTURE ANGLE 180 DEGREES`, `PASSES TO THE RIGHT ACCURATE CAPTURE ANGLE 180 DEGREES`) 
#for (i in 1:nrow(over30))
#{
#  for (j in 1:length(relevantcolumns))
#  {
#    over30[i, <-(over30[i, relevantcolumns[j]]*90/over30[i, "MINUTES PLAYED"])
#  }
#}

#relevantcolumns2<-c(10, 11, 12)

#for (j in 1:length(relevantcolumns)){
#  relevantcolumns[, j]<-over30[, relevantcolumns[j]]*90/over30[, 62]
#}
#for(i in 1:nrow(over30)){
#  for (j in 1:length(relevantcolumns2)){
#    over30[i, relevantcolumns2[j]]<-per90function(i, relevantcolumns2[j])
#  }
#}

#per90function2<-function(rownum, colnum){
#  over30[i, colnum]<-over30[i, colnum]*90/over30[i, 62]
#}
#per90function<-function(column)

for (i in 1:nrow(over30)){
  over30$GOALS[i]<-(over30$GOALS[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$ASSISTS[i]<-(over30$ASSISTS[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PLAYING IN SCORING ATTACKS`[i]<-(over30$`PLAYING IN SCORING ATTACKS`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`GRAVE MISTAKES`[i]<-(over30$`GRAVE MISTAKES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}


for (i in 1:nrow(over30)){
  over30$`YELLOW CARDS`[i]<-(over30$`YELLOW CARDS`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`RED CARDS`[i]<-(over30$`RED CARDS`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$FOUL[i]<-(over30$FOUL[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`FOUL SUFFERED`[i]<-(over30$`FOUL SUFFERED`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$SHOTS[i]<-(over30$SHOTS[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`SHOTS ON TARGET`[i]<-(over30$`SHOTS ON TARGET`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$PASSES[i]<-(over30$PASSES[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES ACCURATE`[i]<-(over30$`PASSES ACCURATE`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`EXTRA ATTACKING AND KEY PASSES`[i]<-(over30$`EXTRA ATTACKING AND KEY PASSES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`EXTRA ATTACKING AND KEY PASSES - ACCURATE`[i]<-(over30$`EXTRA ATTACKING AND KEY PASSES - ACCURATE`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$CROSSES[i]<-(over30$CROSSES[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`CROSSES - ACCURATE`[i]<-(over30$`CROSSES - ACCURATE`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$CHALLENGES[i]<-(over30$CHALLENGES[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`CHALLENGES WON`[i]<-(over30$`CHALLENGES WON`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`DEFENSIVE CHALLENGES`[i]<-(over30$`DEFENSIVE CHALLENGES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`DEFENSIVE CHALLENGES SUCCESSFUL`[i]<-(over30$`DEFENSIVE CHALLENGES SUCCESSFUL`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`ATTACKING CHALLENGES`[i]<-(over30$`ATTACKING CHALLENGES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`ATTACKING CHALLENGES SUCCESSFUL`[i]<-(over30$`ATTACKING CHALLENGES SUCCESSFUL`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`AIR CHALLENGES`[i]<-(over30$`AIR CHALLENGES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`AIR CHALLENGES WON`[i]<-(over30$`AIR CHALLENGES WON`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$DRIBBLES[i]<-(over30$DRIBBLES[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`DRIBBLES SUCCESSFUL`[i]<-(over30$`DRIBBLES SUCCESSFUL`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$TACKLES[i]<-(over30$TACKLES[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`TACKLES SUCCESSFUL`[i]<-(over30$`TACKLES SUCCESSFUL`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$INTERCEPTIONS[i]<-(over30$INTERCEPTIONS[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`INTERCEPTIONS IN OPP HALF`[i]<-(over30$`INTERCEPTIONS IN OPP HALF`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PICKING UP FREE BALLS`[i]<-(over30$`PICKING UP FREE BALLS`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PICKING UP FREE BALLS IN OPP HALF`[i]<-(over30$`PICKING UP FREE BALLS IN OPP HALF`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`LOST BALLS`[i]<-(over30$`LOST BALLS`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`LOST BALLS IN OWN HALF`[i]<-(over30$`LOST BALLS IN OWN HALF`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`BALL RECOVERIES`[i]<-(over30$`BALL RECOVERIES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`BALL RECOVERY IN OPP HALF`[i]<-(over30$`BALL RECOVERY IN OPP HALF`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES FORWARD CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES FORWARD CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES BACK CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES BACK CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES TO THE LEFT CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES TO THE LEFT CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES TO THE RIGHT CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES TO THE RIGHT CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES FORWARD ACCURATE CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES FORWARD ACCURATE CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES BACK ACCURATE CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES BACK ACCURATE CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES TO THE LEFT ACCURATE CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES TO THE LEFT ACCURATE CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}

for (i in 1:nrow(over30)){
  over30$`PASSES TO THE RIGHT ACCURATE CAPTURE ANGLE 180 DEGREES`[i]<-(over30$`PASSES TO THE RIGHT ACCURATE CAPTURE ANGLE 180 DEGREES`[i]*90)/(over30$`MINUTES PLAYED`[i])
}


install.packages("xlsx")
library(writexl)
write_xlsx(over30, "fielddata.xlsx")









#Import dataset
library(readxl)
instat_field <- read_excel("fielddata.xlsx")

accdata<-instat_field

accdata[accdata$`HOME TEAM`!=("Notre Dame Fighting Irish" | "Louisville Cardinals" | "Pittsburgh Panthers" | "Virginia Cavaliers" | "Duke Blue Devils" | "NC State Wolfpack" | "North Carolina Tar Heels" | "Boston College Eagles" | "Syracuse Orange" | "Wake Forest Demon Deacons" | "Virginia Tech Hokies" | "Clemson Tigers" )] <- NULL

accdata<-subset(accdata, accdata$`HOME TEAM` %in% c("Notre Dame Fighting Irish", "Louisville Cardinals", "Pittsburgh Panthers", "Virginia Cavaliers", "Duke Blue Devils", "NC State Wolfpack", "North Carolina Tar Heels", "Boston College Eagles", "Syracuse Orange", "Wake Forest Demon Deacons", "Virginia Tech Hokies", "Clemson Tigers" ))
accdata<-subset(accdata, accdata$`AWAY TEAM` %in% c("Notre Dame Fighting Irish", "Louisville Cardinals", "Pittsburgh Panthers", "Virginia Cavaliers", "Duke Blue Devils", "NC State Wolfpack", "North Carolina Tar Heels", "Boston College Eagles", "Syracuse Orange", "Wake Forest Demon Deacons", "Virginia Tech Hokies", "Clemson Tigers" ))

accdata$`HOME TEAM`<-NULL
accdata$`HOME TEAM SCORE`<-NULL
accdata$`AWAY TEAM`<-NULL
accdata$`AWAY TEAM SCORE`<-NULL

accdata$ID<-NULL
accdata$`KIT NUMBER`<-NULL
accdata$SURNAME<-NULL
accdata$TEAM<-NULL
accdata$MATCH<-NULL
accdata$...1<-NULL

write.csv(accdata, file = "ProjectData.csv")