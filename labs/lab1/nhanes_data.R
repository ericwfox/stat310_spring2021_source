library(NHANES)
help(NHANES)
# call data survey 1 (use in intro and lab 1)

nhanes1 <- NHANES %>% 
  select(Gender, Age, Race = Race1, Education, MaritalStatus, 
         HHIncome = HHIncomeMid, Weight, Height, 
         BPSysAve, BPDiaAve, Diabetes, HealthGen, 
         Depressed, SleepHrsNight, PhysActive, Alcohol12PlusYr, Smoke100) %>%
  mutate(HHIncome  = HHIncome / 1000)
nhanes1 <- as.data.frame(nhanes1)
nhanes1 <- na.omit(nhanes1)

set.seed(999)
nhanes2 <- sample_n(nhanes1, 1500)

# take smaller subset of columns
nhanes3 <- nhanes2 %>% select(Gender, Age, Education, HHIncome, Weight, Height, 
                              BPSysAve, BPDiaAve, HealthGen, PhysActive, Smoke100)

saveRDS(nhanes3, file = "nhanes.rds")

ggplot(nhanes2, aes(Weight, Height)) + geom_point()


# plot(nhanes2$Height, nhanes2$Weight, 
#      cex = 0.25, xlab = "Weight", ylab = "Height")
plot(Weight ~ Height, data = nhanes3)
boxplot(HHIncome ~ Education, data = nhanes2)
barplot(table(nhanes2$Education))
barplot(table(nhanes2$PhysActive))
barplot(table(nhanes2$Depressed))
hist(nhanes2$Height)
hist(nhanes2$Weight)

ggplot(nhanes2, aes(Education, HHIncome)) + geom_boxplot()
ggplot(nhanes2, aes(Height, Weight, color = Gender)) + geom_point(size = 0.5)

lm1 <- lm(Weight ~ Height, data = nhanes2)


# for slides
nhanes3 <- select(nhanes2, Gender, Age, Education, HHIncome)
head(nhanes3, n = 10)
tail(nhanes3, n = 5)

library(xtable)
xtable(head(nhanes3, n = 10))
xtable(tail(nhanes3, n = 5))
