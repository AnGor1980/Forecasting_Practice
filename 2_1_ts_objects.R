library(survMisc)
y <- ts(c(123,39,78,52,110), start=2012)

autoplot(melsyd[,"Economy.Class"]) +
  ggtitle("Economy class passengers: Melbourne-Sydney") +
  xlab("Year") +
  ylab("Thousands")
