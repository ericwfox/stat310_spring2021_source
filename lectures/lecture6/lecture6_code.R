library(resampledata)
data("GSS2002")

postlife <- GSS2002$Postlife[!is.na(GSS2002$Postlife)]
summary(postlife)

table(postlife) / length(postlife)
