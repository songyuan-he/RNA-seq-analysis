# RNA-seq Analysis Workflow

Course projects for *Genomics & Bioinformatics* — differential expression analysis and functional enrichment from RNA-seq count data.

## Contents

### 1. DESeq2 Differential Expression (`DESeq2_workflow.R`)
- Reads count matrix and sample metadata
- Validates sample-to-column alignment
- Prepares data for DESeq2-based differential expression analysis

### 2. GO Enrichment Analysis (`GO_enrichment.R`)
- Performs Gene Ontology enrichment for yeast (*Saccharomyces cerevisiae*) differentially expressed genes
- Covers all three GO categories: Biological Process (BP), Cellular Component (CC), Molecular Function (MF)
- Extracts top 10 most significant terms per category
- Exports formatted CSV ready for downstream visualization

**Key packages:** `clusterProfiler` · `org.Sc.sgd.db` · `dplyr`

### 3. Expression Visualization (see `DESeq2_workflow.R`)
- Wide-to-long format transformation of count matrices (tidyr pivot_longer)
- Faceted scatter plots of gene expression across samples
- Custom ggplot2 themes with full label formatting

## Files

```
.
├── DESeq2_workflow.R           # DESeq2 setup + expression visualization
├── GO_enrichment.R             # clusterProfiler GO enrichment
├── data/
│   ├── countData.csv           # Raw count matrix (genes × samples)
│   └── colData.csv             # Sample metadata (condition labels)
└── README.md
```

## Usage

```r
# DESeq2 workflow
source("DESeq2_workflow.R")

# GO enrichment
source("GO_enrichment.R")
```

## Notes

- Requires Bioconductor packages: `DESeq2`, `clusterProfiler`, `org.Sc.sgd.db`
- Count data and metadata must be in the `data/` directory
- These scripts were developed for coursework and demonstrate core RNA-seq analysis skills
