#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --mem=1G
#SBATCH --output=pi.out
#SBATCH --cpus-per-task=2

module load hpc-examples

python ${HPC_EXAMPLES}/slurm/pi.py --nprocs=$SLURM_CPUS_PER_TASK 1000000
