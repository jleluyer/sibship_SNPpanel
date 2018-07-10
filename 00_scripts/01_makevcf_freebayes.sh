#!/usr/bin/env bash
#PBS -N trimmomatic__BASE__
#PBS -o freebayes.out
#PBS -q omp
#PBS -l walltime=36:00:00
#PBS -l ncpus=2
#PBS -l mem=20g


cd $PBS_O_WORKDIR

#Working directories, input and output files
data=list.bam.files
outdir=02_data
ref="reference.fa"
tag="output"


ls "$outdir"/*bam >01_info_files/"$data"

#Freebayes parameters 
minMapQ="30"
minCOV=10
Ploidy=2

# load Freebayes module

#Calling SNP with Freebayes on trimmed bam file
echo "Running Freebayes on ${data} samples..."

time freebayes -f $ref \
                --min-mapping-quality $minMapQ \
                --no-indels \
   		--no-complex \
		--min-coverage $minCOV \
                --genotype-qualities \
                --bam-list 01_info_files/${data} \
                --vcf ${outdir}/${tag}.vcf 
echo "Running Freebayes on ${data} samples done."

