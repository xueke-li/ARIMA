# Set Working Directory
setwd("/.../data")

# Install and load the forecast package if not already installed
install.packages("forecast", dependencies = TRUE)
install.packages("tseries")
install.packages("TSPred")

library(forecast)
library(tseries)
library(TSPred)

# ---- Data ----
# Assumes a single numeric column in GSFC.csv with monthly values
data <- read.csv("GSFC.csv",header = FALSE)
ts.data = ts(data, frequency = 12, start = c(2003,1))

# Train/test split
data.train = window(ts.data, start = c(2003,1), end = c(2015,12))
data.test = window(ts.data, start = c(2016,1))

# ---- Model (BIC; KPSS) ----
fit <- auto.arima(
  data.train,
  trace = TRUE,
  test  = "kpss",
  ic    = "bic"
)
summary(fit)
confint(fit)

# ---- Residual diagnostics ----
plot.ts(fit$residuals)
# Ljung-Box and normality tests
Box.test(fit$residuals, lag = 10, type = 'Ljung-Box')
# Jarque-Bera normality test
jarque.bera.test(fit$residuals)
# ACF of residuals
acf(fit$residuals, lag.max = 24, main = "Residual ACF")

# ---- Forecast h months ahead ----
h <- 12
fc <- forecast(fit, h = h)
fc

# ---- Forecast accuracy ----
accuracy(fc, data.test[1:h])
         
# Plot time series of forecasts against observed values
plot(fc, xlab = 'GSFC', ylab = 'AOD', xlim = c(2003, 2017))  # Forecasts
lines(ts.data, lty = 2, lw =2, col = "#e15759")              # Observed (2003 - 2016)
#lines(x = ts(data = 1:12, start = 2016, frequency = 12), y = data.test, type = 'l', lty = 2, lw =2, col = "#e15759") # Observed (2016)
abline(v = 2016, lty = 2, lw = 0.4, col = "grey40")

# A zoom-in quick view
plotarimapred(data.test, fit, xlim = c(2012, 2017), range.percent = 0.05, xlab ='GSFC', ylab = 'AOD') # Observed series color differs slightly (set by internal defaults)
