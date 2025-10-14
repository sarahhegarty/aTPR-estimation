# aTPR-estimation
R code for simulations evaluating the novel fairness metric, adjusted true positive rate proposed by Hegarty et al.

## aTPR illustration 
Figure 1 illustrates the risk distribution issue. Code to reproduce this figure is provided in R1-atpr-figure-1.Rmd


## Simulation Studies
### Primary Simulations
The numerical studies in the paper can be reproduced by the Run-sims.Rmd file. This file calls on the sim01-aTPR-alpha24.Rmd files, simfuncs/dataGen.R, simfuncs/getTheoretical.R, and the R package "fairRisk" (available through github.com/sarahhegarty/fairRisk). Large sample benchmark values using GAMs for interim estimation tasks are calculated in sim02-aTPR-alpha24-new-benchmarks-GAM-1M.Rmd and RUN-alt-benchmarks.Rmd.

Code for reproducing the simulation figures are available:
  - Figure 2: R1-atpr-figure-2-with-fairRisk-withGAM-1Mmean.Rmd
  - Supplemental Figures S1-S11: R1-Supplemental-Sim-DeltaPlots.Rmd + R1-Supplemental-Sim_DeltaPlots-Template.Rmd
  - Supplemental Figures S12-S23: Supplemental-Sim-QQPlots-Template.Rmd

### Bootstrapping Coverage Simulation
A smaller simulation study was conducted to explore the coverage of the confidence intervals used in the real world data application. Code for reproducing the simulation is available in R1-addtl-bootstrap-var-comp.Rmd. Code for evaluating coverage performance availalbe in Coverage-GAM-1Mmean.Rmd and run-coverage-GAM1Mmean.Rmd

## Real World Example
The Palliative Connect dataset is derived from electronic health records data and cannot be publicly shared. However, the code use for analysis and figure generation is provided.
  - Analysis files: rwd00 palliative connect - select data.Rmd + rwd03 palliative connect - adjusted - replicate orig-R1.Rmd 
  - Figure 3 code: R1-atpr-figure-3.Rmd
  - Table 1 code: R1-atpr-table-1.Rmd.
  - Supplemental Figures 24-26: R1-Supplemental-RWD-DeltaPlots-by-tau.Rmd

## Pseudodata
A synthetic data set was generated to mimic the Palliative Connect dataset along with corresponding analytic files.
  - Data Generation and Analysis code: Pseudodata-Generation-and-Analysis.Rmd
  - Synthetic data: pseudodata-pallconnect.csv
 

