# =========================
# = explore and plot data =
# =========================

library("lubridate")

# 1. read data
# ============================================================

raw.data <- read.csv("all.csv", header = FALSE, as.is = TRUE)
raw.data[is.na(raw.data)] <- ""
raw.data <- within(raw.data, { V10 <- minute(ms(V8))*60 + second(ms(V8)); V11 <- minute(ms(V9))*60 + second(ms(V9)); V12 <- paste(V1, V2, V3, V4, V5, sep = "") })


# count incidents in each replicate
# kk <- with(raw.data, sapply(split(V6, V11), length))

# extract phenotype from each replicate
# 1. total time spent on grooming

unique.rep <- unique(raw.data$V12)
total.groom.time <- NULL

for (rep in unique.rep) {
  
  this.rep.data <- subset(raw.data, V12 == rep)
  # order by total time
  this.rep.data <- this.rep.data[order(this.rep.data$V11), ]
  
  # remove some bad data, 340m rep 19 and 20
  # ============================================================
  this.rep.data <- rbind(c(rep(0, 7), 1000, rep(0, 4)), this.rep.data)
  
  if (sum(is.na(this.rep.data$V10)) == 0) {
    i <- nrow(this.rep.data)
    while (i > 0 & cumsum(this.rep.data$V10)[i] > 180) {
      this.rep.data$V10[i] <- max(c(0, this.rep.data$V10[i] - (cumsum(this.rep.data$V10)[i] - 180)))
      i <- i - 1
    }
    
    # sum total grooming time
    # ============================================================
  
    this.rep.total.time <- with(subset(this.rep.data, V7 == "f" | V7 == "b" | V7 == "h"), sum(V10))
    total.groom.time <- rbind(total.groom.time, c(this.rep.data[2, c(1, 2)], this.rep.total.time))
    cat(this.rep.data[2, 1], "\n")
    
  }

}

write.table(total.groom.time[total.groom.time[, 1] > 0, ], file = "total.groom.time.csv", sep = ",", col.names = c("line", "sex", "time"), row.names = F, quote = F)
