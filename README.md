# DGRP spontaneous grooming behavior

Data and codes to accompany the DGRP spontaneous grooming paper.

#### 1. Read data from xlsx files

The grooming data are stored in xlsx files. These data were read by the `readData.R` script as run by the commands in `readData.bash`. This step produced the `all.csv` file. This file contains all types of behaviors recorded as in the original data.

#### 2. Process data for ANOVA and GWAS

The grooming dta in `all.csv` was then processed to have total grooming time using the script `prepData.R`. This script produced the `total.groom.time.csv` file readable by SAS.

#### 3. ANOVA

ANOVA, including mixed model for variance components and GLM to test for significance of variance components, were performed using the SAS program `anova.sas`.


