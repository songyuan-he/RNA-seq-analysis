# 1. 加载所需的包
library(clusterProfiler)
library(org.Sc.sgd.db)  # 酵母(Saccharomyces cerevisiae)的官方注释数据库
library(dplyr)

# 2. 读取我们刚才整理好的酵母差异基因列表
genes_df <- read.table("sce_DEG_list_cleaned.txt", header = FALSE, stringsAsFactors = FALSE)
gene_list <- genes_df$V1

# 3. 分别进行 BP, CC, MF 的 GO 富集分析
# 计算 Biological Process
go_bp <- enrichGO(gene = gene_list, OrgDb = org.Sc.sgd.db, keyType = "ORF", 
                  ont = "BP", pAdjustMethod = "BH", pvalueCutoff = 0.05)
# 计算 Cellular Component
go_cc <- enrichGO(gene = gene_list, OrgDb = org.Sc.sgd.db, keyType = "ORF", 
                  ont = "CC", pAdjustMethod = "BH", pvalueCutoff = 0.05)
# 计算 Molecular Function
go_mf <- enrichGO(gene = gene_list, OrgDb = org.Sc.sgd.db, keyType = "ORF", 
                  ont = "MF", pAdjustMethod = "BH", pvalueCutoff = 0.05)

# 4. 提取结果，挑选最显著的 Top 10，并转换格式
process_go <- function(go_res, category_name) {
  df <- as.data.frame(go_res)
  if(nrow(df) > 0) {
    # 按 p.adjust 排序并取前 10 个
    df <- df %>% arrange(p.adjust) %>% head(10)
    # 提取需要的列：Description (Term), 添加分类列, 计算 -log10(pvalue) (必须是正值)
    res <- data.frame(
      Term = df$Description,
      Category = category_name,
      Value = -log10(df$pvalue) 
    )
    return(res)
  }
  return(NULL)
}

df_bp <- process_go(go_bp, "Biological process")
df_cc <- process_go(go_cc, "Cellular component")
df_mf <- process_go(go_mf, "Molecular function")

# 5. 合并三者的数据
final_go_data <- rbind(df_bp, df_cc, df_mf)

# 6. 导出为该网站严格要求的 3 列 CSV 文件 (无行名，带表头)
write.csv(final_go_data, "Formatted_GO_3in1.csv", row.names = FALSE, quote = FALSE)

cat("分析完成！已生成 Formatted_GO_3in1.csv 文件，请直接将其上传至网站。")