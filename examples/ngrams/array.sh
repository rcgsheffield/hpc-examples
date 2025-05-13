#!/bin/bash
#SBATCH --mem=50G
#SBATCH --array=1-20
#SBATCH --time=00:15:00
#SBATCH --job-name=words-array

module load hpc-examples

mkdir -p ${TMPDIR}/ngrams-output/

python3 ${HPC_EXAMPLES}/ngrams/count.py ${HPC_EX_DATA}/Gutenberg-Fiction.zip \
  -n 3 --words \
  --start=$SLURM_ARRAY_TASK_ID --step=20 \
  -o ${TMPDIR}/ngrams-output/ngrams3-words-all-array_$SLURM_ARRAY_TASK_ID.out

# Next we merge the 20 individual output files into a single dataset and output 
# into the current working directory (since once the job completes $TMPDIR will be deleted).

python3 ${HPC_EXAMPLES}/ngrams/combine-counts.py ${TMPDIR}/ngrams-output/ngrams3-words-all-array_* -o ngrams3-words-all.out
