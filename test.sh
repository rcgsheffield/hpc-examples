#!/bin/bash
#SBATCH --job-name=mpi-lmp-indent
#SBATCH --mail-user=a.person@sheffield.ac.uk
#SBATCH --mail-type=FAIL
#SBATCH --time=00:01:00
#SBATCH --mem=1G
#SBATCH --ntasks-per-node=4
#SBATCH --output=mpi-output-%j.log
#SBATCH --error=mpi-error-%j.log

module load LAMMPS/3Mar2020-intel-2020a-Python-3.8.2-kokkos
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
srun --export=ALL lmp -in in.indent
