library("DESeq2")
countData <- as.matrix(read.csv("countData.csv", sep=",", row.names="gene_id"))
head(countData)
colData <- read.csv("colData.csv",sep=",",row.names=1)
head (colData)
all(rownames(colData) %in% colnames(countData))
countData <- countData[, rownames(colData)]
