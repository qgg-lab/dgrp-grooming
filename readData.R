# ==================
# = read xlsx data =
# ==================

args <- commandArgs(TRUE)
library("gdata")

# list directory files
# ============================================================

# file.list <- list.files("OECD sponta data", full.name = TRUE)

# 227f's header has problem, rows switched for the 2nd and 3rd rows
# these are fixed.

# 336m has two copies, delete one (named sheet 2)

# make corrections based on the following table

# 233female16plate 1_16july178831    28female4plate 3_10july16864
#                               1                               2
#     321male6plate 6_15july17686     32male20plate 2_16july17906
#                               1                               2
#   336male10plate 4_12july172823   336male11plate 4_12july172825
#                              11                              25
#   336male13plate 4_12july172827   336male14plate 4_12july172829
#                              36                              35
#   336male15plate 4_12july172831   336male16plate 4_12july172832
#                              40                              44
#   336male17plate 4_12july172833   336male18plate 4_12july172834
#                              17                               5
#   336male19plate 4_12july172835    336male1plate 4_12july172813
#                              57                              39
#   336male20plate 4_12july172828    336male2plate 4_12july172814
#                              46                              38
#    336male3plate 4_12july172815    336male4plate 4_12july172816
#                              34                               5
#    336male5plate 4_12july172817    336male6plate 4_12july172819
#                              44                              28
#    336male7plate 4_12july172820    336male8plate 4_12july172821
#                              16                              39
#    336male9plate 4_12july172822     336maleplate 4_12july172826
#                              25                              16
#  45female14plate 3_16july179252   45female7plate 3_16july179244
#                               1                               2
#   57female6plate 3_10july168649 703female17plate 3_23july189342
#                               1                               1
# 707female15plate 2_22july187153  738female4plate 3_23july189340
#                               2                               1
#  738female5plate 3_23july189341  738female6plate 3_23july189343
#                               6                               4
#   83female1plate 5_16july179631   83female2plate 5_16july179632
#                               1                               1
#   83female3plate 5_16july179633   83female4plate 5_16july179634
#                               1                               1
#   83female5plate 5_16july179635
#                               1


file <- args[1]

this.sheet.count <- sheetCount(file)
this.book.clean.data <- NULL
  
for (i in 1:this.sheet.count) {
  
  this.sheet.data <- read.xls(file, sheet = i, blank.lines.skip = TRUE, as.is = TRUE, header = FALSE, na.strings = "")
  this.sheet.clean.data <- NULL
  cat(file, "sheet", i, "\n")

  for (j in seq(1, ncol(this.sheet.data), 4)) {
    if (!is.na(this.sheet.data[2, j])) {
      this.rep <- as.numeric(this.sheet.data[1, j])
      this.line.id <- this.sheet.data[2, j]
      this.plate.id <- this.sheet.data[2, j+1]
      this.rep.num <- this.sheet.data[2, j+2]
      this.rep.data <- na.omit(this.sheet.data[4:nrow(this.sheet.data), j:(j+3)])
      
      # find sex
      if (grepl("f", this.line.id)) {
        this.sex <- "female"; this.line.id <- gsub("f", "", this.line.id)
      } else {
        this.sex <- "male"; this.line.id <- gsub("m", "", this.line.id)
      }
      
      n.lap <- nrow(this.rep.data)
      
      this.clean.data <- cbind(rep(this.line.id, n.lap),
                               rep(this.sex, n.lap),
                               rep(this.rep, n.lap),
                               rep(this.plate.id, n.lap),
                               rep(this.rep.num, n.lap), # unknow number
                               gsub("Lap ", "", this.rep.data[, 1]),
                               this.rep.data[, 2],
                               sapply(strsplit(this.rep.data[, 3], split = ":"),
                                      function(x) { paste(x[(length(x)-1):length(x)], collapse = ":") }),
                               sapply(strsplit(this.rep.data[, 4], split = ":"),
                                      function(x) { paste(x[(length(x)-1):length(x)], collapse = ":") })
                              )
      this.sheet.clean.data <- rbind(this.sheet.clean.data, this.clean.data)
                              
    } 
  }
    
  this.book.clean.data <- rbind(this.book.clean.data, this.sheet.clean.data)
      
}
  
write.table(this.book.clean.data, file = args[2], sep = ",", col.names = FALSE, row.names = FALSE, quote = FALSE)
