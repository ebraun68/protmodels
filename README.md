# protmodels
General repository for models of protein evolution developed by the Braun research group

------------------------------------------------------------
# Programs used to compare matrices:

  1) normalize_vectors.pl
  2) calcEucl.pl

To conduct a comparison of R matrices the matrices are written as a tab delimited file with vectors of 190 values, each preceded by the model name. Then normalize_vectors.pl is used to normalize these vectors to sum to one and calcEucl.pl is used to calculate distances among those vectors.

------------------------------------------------------------
# GKB mt transmembrane

Models from:
Gordon, E.L.; Kimball, R.T.; Braun, E.L. Protein Structure, Models of Sequence Evolution, and Data Type Effects in Phylogenetic Analyses of Mitochondrial Data: A Case Study in Birds. Diversity 2021, 13, 555. https://doi.org/10.3390/d13110555

Five files, plus a more detailed README:
  1) JTTtm.paml.txt
  2) bird_mtExM.paml.txt
  3) bird_mtTM.paml.txt
  4) bird_mtMIX_JTTtm.nex
  5) matrix_comparisons_bird_JTTtm.xlsx

Three paml format rate matrices, a nexus format mixture model (two components, one for transmembrane sites, and extramembrane sites), and an Excel spreadsheet with calculations for the JTTtm model (derived from Jones et al. 1994 using the Kosiol and Goldman 2005 DCMut method)

Additional references:

Jones, D.T.; Taylor, W.R.; Thornton, J.M. A mutation data matrix for transmembrane proteins. FEBS Lett. 1994, 339, 269–275, doi:10.1016/0014-5793(94)80429-x.

Kosiol, C.; Goldman, N. Different versions of the Dayhoff rate matrix. Mol. Biol. Evol. 2005, 22, 193–199, doi:10.1093/molbev/msi005.

------------------------------------------------------------

