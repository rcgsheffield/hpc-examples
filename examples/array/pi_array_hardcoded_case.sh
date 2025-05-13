#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --mem=500M
#SBATCH --job-name=pi-array-hardcoded
#SBATCH --output=pi-array-hardcoded_%a.out
#SBATCH --array=0-4

module load hpc-examples
echo "[DEBUG] Module path: $MODULEPATH"
module list || echo "[DEBUG] Failed to load hpc-examples"
echo "[DEBUG] HPC_EXAMPLES = $HPC_EXAMPLES"
ls -l ${HPC_EXAMPLES}/slurm/pi.py

case $SLURM_ARRAY_TASK_ID in
   0)  SEED=234 ;;
   1)  SEED=18  ;;
   2)  SEED=23  ;;
   3)  SEED=50  ;;
   4)  SEED=432 ;;
esac

python3 ${HPC_EXAMPLES}/slurm/pi.py 2500000 --seed=$SEED > pi_$SEED.json
