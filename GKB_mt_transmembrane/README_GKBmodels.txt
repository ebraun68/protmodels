README -- PAML and nexus format rate matrix files for:

Gordon EL, Kimball RT & Braun EL. Protein structure, models of sequence evolution, and 
data type effects in phylogenetic analyses of mitochondrial data: A case study in birds.

This directory contains five data files

1) JTTtm.paml.txt
2) bird_mtExM.paml.txt
3) bird_mtTM.paml.txt
4) bird_mtMIX_JTTtm.nex
5) matrix_comparisons_bird_JTTtm.xlsx

########## ########## ########## ########## ########## ##########
PAML rate matrix files:
   JTTtm.paml.txt
   bird_mtExM.paml.txt
   bird_mtTM.paml.txt

R matrix and amino acid frequencies in the standard order:

Ala Arg Asn Asp Cys Gln Glu Gly His Ile Leu Lys Met Phe Pro Ser Thr Trp Tyr Val
A   R   N	D   C   Q   E   G   H   I   L   K   M   F   P   S   T   W   Y   V

########## ########## ########## ########## ########## ##########
Nexus format file:
    bird_mtMIX_JTTtm.nex

File with a nexus models block (readable by IQ-TREE) that contains all three models
provided as above in PAML format. The mixture model definition for bird mtMIX is also
provided, as is a mixture model substituting JTTtm for bird mtTM

########## ########## ########## ########## ########## ##########
Excel file:
    matrix_comparisons_bird_JTTtm.xlsx
    
Contains comparisons of all matrices used in Gordon et al. and the calculations to
generate the R matrix based on data from Jones et al. (1994) using the DCMut method
(Kosiol & Goldman 2005).

JTTtm calculations:
We present the Q matrix for the JTTtm (DCMut) matrix, calculated using equation 11 from 
Kosiol & Goldman (2005) and the R matrix, calculated using the Q matrix and the amino acid
frequencies from Jones et al. (1994). Note that converting the Q matrix to the R matrix 
yields to estimates for each R matrix element that may differ due to rounding; the final 
R matrix is based on the average of those two values.

R matrix comparisons:
We present the R matrices, R matrix values normalized to sum to 1, and differences between
each element of the normalized matrices.

Amino acid frequency comparisons:
In addition to the amino acid frequencies we present Grantham (1974) polarity values and
differences between amino acid frequencies

---------- ---------- ---------- ---------- ---------- ----------
Additional references:

Grantham R (1974). Amino acid difference formula to help explain protein evolution. 
Science, 185(4154), 862-864. https://doi.org/10.1126/science.185.4154.862

Jones DT, Taylor WR & Thornton JM (1994). A mutation data matrix for transmembrane 
proteins. FEBS Letters, 339(3), 269-275. https://doi.org/10.1016/0014-5793(94)80429-X

Kosiol C & Goldman N (2005). Different versions of the Dayhoff rate matrix. Molecular 
Biology and Evolution, 22(2), 193-199. https://doi.org/10.1093/molbev/msi005
