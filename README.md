# aTPR-estimation
R code for simulations evaluating the novel fairness metric, adjusted true positive rate proposed by Hegarty et al.

## aTPR illustration 
Figure 1 illustrates the risk distribution issue. Code to reproduce this figure is provided in atpr-figure-1.Rmd


## Simulation Studies
The numerical studies in the paper can be reproduced by the Run-sims.Rmd file. This file calls on the sim01-aTPR-alpha24.Rmd files, simfuncs/dataGen.R, simfuncs/getTheoretical.R, and the R package "fairRisk" (available through github.com/sarahhegarty/fairRisk). 

Code for reproducing the simulation figures are available:
  - Figure 2: atpr-figure-2-with-fairRisk.Rmd
  - Supplemental Figures S1-S11: Supplemental-Sim-DeltaPlots.Rmd + Supplemental-Sim_DeltaPlots-Template.Rmd
  - Supplemental Figures S12-S23: Supplemental-Sim-QQPlots-Template.Rmd

## Real World Example
The Palliative Connect dataset is derived from electronic health records data and cannot be publicly shared. However, the code use for analysis and figure generation is provided.
  - Analysis files: rwd00 palliative connect - select data.Rmd + rwd03 palliative connect - adjusted - replicate orig.Rmd 
  - Figure 3 code: atpr-figure-3.Rmd
  - Table 1 code: atpr-table-1.Rmd.
