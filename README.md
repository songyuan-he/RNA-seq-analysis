# RNA-seq Differential Expression Analysis

Course project for **Genomics & Bioinformatics** (Southwest University) —
full RNA-seq differential expression and functional enrichment pipeline
using **DESeq2** and **clusterProfiler** on a *Saccharomyces cerevisiae*
(budding yeast) dataset.

## Project Goals

- Demonstrate proficiency in the core RNA-seq analysis workflow:
  count matrix processing → differential expression → functional enrichment
- Apply statistical best practices: normalisation (median-of-ratios),
  variance-stabilising transformation (VST), FDR correction (Benjamini–Hochberg)
- Produce publication-quality visualisations: volcano plot, MA plot,
  heatmap, PCA, GO dotplots
- Deliver reproducible analysis via R Markdown

## Repository Structure

```
.
├── RNAseq_analysis.Rmd       # Main analysis notebook (R Markdown)
├── data/
│   ├── countData.csv          # Raw count matrix (6,420 genes × 4 samples)
│   └── colData.csv            # Sample metadata (control/treat labels)
├── README.md
└── .gitignore
```

## Dependencies

| Package            | Repository   | Purpose                              |
|--------------------|-------------|--------------------------------------|
| DESeq2             | Bioconductor | Differential expression analysis     |
| clusterProfiler    | Bioconductor | GO enrichment analysis               |
| org.Sc.sgd.db      | Bioconductor | *S. cerevisiae* genome annotation    |
| ggplot2            | CRAN         | Data visualisation                   |
| pheatmap           | CRAN         | Heatmap plotting                     |
| dplyr, tidyr       | CRAN         | Data manipulation                    |
| RColorBrewer       | CRAN         | Colour palettes                      |
| patchwork          | CRAN         | Multi-panel figure assembly          |

### Install All Dependencies

```r
# CRAN
install.packages(c("ggplot2", "dplyr", "tidyr", "pheatmap", "RColorBrewer", "patchwork"))

# Bioconductor
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("DESeq2", "clusterProfiler", "org.Sc.sgd.db"))
```

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/songyuan-he/RNA-seq-analysis.git
   cd RNA-seq-analysis
   ```

2. **Open the notebook** in RStudio:
   ```
   File → Open File → RNAseq_analysis.Rmd
   ```

3. **Install dependencies** (see above), then click **Run** → **Run All**

4. **Expected output**: interactive HTML notebook with all figures inline plus
   `data/GO_enrichment_results.csv` exported to disk.

## Expected Output

The notebook generates:

| Section             | Output                                          |
|---------------------|-------------------------------------------------|
| Quality Control     | Density plot of log-count distribution          |
| Differential Expression | DESeq2 results table, summary of sig. DEGs  |
| Volcano Plot        | log2FC vs −log10(p), coloured by significance   |
| MA Plot             | DESeq2 MA plot with FDR threshold                |
| Heatmap             | Z-score-normalised VST expression (top 30 DEGs) |
| PCA                 | Sample clustering by principal component        |
| GO Enrichment       | Top 10 GO terms (BP / CC / MF) dotplots         |

All figures use **colourblind-friendly palettes** (RColorBrewer Set1 /
RdBu diverging).

## Notes

- This analysis was developed as coursework and demonstrates competency in
  the DESeq2 → clusterProfiler pipeline for RNA-seq data.
- The dataset is derived from publicly available *S. cerevisiae* RNA-seq
  data (SRA accessions SRR10720198–SRR10720205).
- Output is reproducible: run the notebook with the same package versions
  (see Session Info at the end of the notebook) to obtain identical results.

## License

This project is for educational and portfolio demonstration purposes.
