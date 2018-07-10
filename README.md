# sibship_SNPpanel

Sibship reconstruction from SNP panel genotyping using Sequoia R package

## Warning

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

## Make vcf

```
qsub 00_scripts/01_makevcf_freebayes.sh
```

## Recode vcf

```
qsub 00_scripts/02_vcf2plink.sh

qsub 00_scripts/03_plinkrecode.sh
```

## Reconstruct sibship

```
Rscript --vanilla 00_scripts/04_sibship_reconstruction.R
```

## Dependencies

[Freebayes](https://github.com/ekg/freebayes)

[Plink](http://zzz.bwh.harvard.edu/plink/)

[Sequoia R package](https://cran.r-project.org/web/packages/sequoia/index.html)

[VCFtools](http://vcftools.sourceforge.net/)

