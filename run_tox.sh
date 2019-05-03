#!#!/bin/bash 
if [ -z $1 ]; then
  CONDA_PATH=/root/anaconda3/ 
else
  CONDA_PATH=$1 
fi
if [ -z $2 ]; then 
  POWERUP_PATH=/home/powerup/app/power-up
else
  POWERUP_PATH=$2
fi

if [ -z $2 ]; then 
  PUP_CONDA=powerup
else
  PUP_CONDA=$3
fi
CONDA_SH_PATH=$CONDA_PATH"/etc/"profile.d/conda.sh 
CONDA_BIN_PATH=$CONDA_PATH"/"bin 
CONDA_BIN_ACTIVATE=$CONDA_BIN_PATH"/"activate 
CONDA_ENV=$CONDA_PATH/envs/
PUP_ENV=$CONDA_ENV/$PUP_CONDA
PUP_CONDA_BIN=$PUP_ENV/bin
CONDA_PUP_PIP=$PUP_CONDA_BIN/pip 
ACTIVATE_SH=/etc/conda/activate.d
DEACTIVATE_SH=/etc/conda/deactivate.d
PUP_SCRIPT=/scripts/python/gen.py
#
echo "Activating power-up environment"
echo "$CONDA_BIN_ACTIVATE $PUP_CONDA"

$PUP_CONDA_BIN/tox
