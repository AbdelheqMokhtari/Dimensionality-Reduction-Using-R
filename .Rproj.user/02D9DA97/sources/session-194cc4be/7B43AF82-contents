library(FactoMineR)
library(Factoshiny)

data(decathlon)
names(decathlon)
head(decathlon)


decathlon_vars <- decathlon[, !(names(decathlon) %in% c("Rank", "Competition"))]
head(decathlon_vars)

str(decathlon_vars)
summary(decathlon_vars)
res <- Factoshiny(decathlon)
