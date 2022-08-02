nhanes <- readRDS(url("https://ericwfox.github.io/data/nhanes.rds"))

# exericse 1
height_in <- nhanes$Height * 0.393701
weight_lbs <- nhanes$Weight * 2.20462

pdf("figure/boxplot_height.pdf", width = 5, height = 3)
par(mar = c(4.5, 2, 2, 2))
boxplot(height_in, xlab = "Height (in)", horizontal = TRUE)
dev.off()


# exercise 2
pdf("figure/hist3.pdf", width = 7, height = 3)
par(mfrow=c(1,3))
hist(height_in, main = "", xlab =  "Height (in)")
hist(weight_lbs, main = "", xlab = "Weight (lbs)")
hist(nhanes$HHIncome, main = "", xlab = "Income (dollars)")
dev.off()

# exercise 3
set.seed(310)
x <- sort(sample(1:20, 5))
x

y <- x + 2
sort(y)

z <- x * 2
z
