coin <- c("head", "tail")

sample(coin, 2, replace = T)

x = -1
repeat{
  t = sample(coin, 2, replace = T)
  x = x + 1
  if(all(t == c("head", "tail")) | all(t == c("tail", "head"))){ 
    # or for another toss: if(all(t == c("head", "head"))){
    break
  }
}

ht <- NULL
for (i in 1:10000) {
  x = -1
  repeat{
    t = sample(coin, 2, replace = T)
    x = x + 1
    if(all(t == c("head", "tail")) | all(t == c("tail", "head"))){ 
      # or for another toss: if(all(t == c("head", "head"))){
      break
    }
  }
  ht <- c(ht, x)
}

hh <- NULL
for (i in 1:10000) {
  x = -1
  repeat{
    t = sample(coin, 2, replace = T)
    x = x + 1
    if(all(t == c("head", "head"))){
      break
    }
  }
  hh <- c(hh, x)
}

png("hw3.fig1.png", width = 8, height = 4, units = "in", res = 300)
par(bg="transparent", mfrow=c(1,2))
hist(ht, xlab = "Times", 
     col.lab="gray90",
     col.axis = 'gray90',
     main = NULL,
     ylim = c(0,7000))
title("Head tail", col.main = "gray90")
# dev.off()
# 
# png("hw3.fig2.png", width = 8, height = 4, units = "in", res = 300)
# par(bg="transparent")
hist(hh, xlab = "Times", 
     col.lab="gray90",
     col.axis = 'gray90',
     main = NULL,
     ylim = c(0,7000))
title("Head head", col.main = "gray90")
dev.off()

# As the two histograms would overlap, here the color definition helps create two transparent colors
c1 <- rgb(0,0,255,max = 255, alpha = 70)
c2 <- rgb(255,0,0, max = 255, alpha = 70)

# To determine proper breaks of both histograms
bks <- pretty(min(c(ht,hh)):max(c(ht,hh)), 
              n = 31)

# To get the histgram frequencies
hg.ht <- hist(ht, breaks = bks, plot = F)
hg.hh <- hist(hh, breaks = bks, plot = F)

# Plotting

png("hw3.fig2.png", width = 8, height = 8, units = "in", res = 300)
par(bg="transparent")
plot(hg.ht, col = c1, xlab = "Times",col.lab="gray90",
     col.axis = 'gray90', main = NULL, ylim = c(0,7000))
title("Comparsion", col.main = "gray90")
plot(hg.hh, col = c2, add = T)
legend("topright", legend=c("head tail", "head head"),
       fill=c(c1, c2),cex=0.8,
       box.lty=0, text.col = "gray90")
dev.off()