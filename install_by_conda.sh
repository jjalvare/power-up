#!#!/bin/bash 
# get variables from user input
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

# build path variables 
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
echo ". $CONDA_SH_PATH" >> ~/.bashrc &&  echo "conda activate base" >> ~/.bashrc
# RUN sudo ln -s /root/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
# Create Powerup environment 
/bin/bash -c "source ~/.bashrc  && $CONDA_BIN_PATH/conda create -n $PUP_CONDA python=3.6 -y"
# RUN echo "conda activate powerup" >> ~/.bashrc
# && echo "alias pup=/home/powerup/app/power-up/scripts/python/gen.py" >> ~/.bashrc
echo "tox" >> $POWERUP_PATH"/"requirements.txt
echo "pexpect" >> $POWERUP_PATH"/"requirements.txt
$CONDA_BIN_ACTIVATE $PUP_CONDA && $CONDA_PUP_PIP install -r $POWERUP_PATH/requirements.txt
mkdir -p $PUP_ENV$ACTIVATE_SH &&  mkdir -p $PUP_ENV$DEACTIVATE_SH 
# RUN touch  /root/anaconda3/envs/powerup/etc/conda/activate.d/env_vars.sh &&  mkdir -p /root/anaconda3/envs/powerup/etc/conda/deactivate.d/env_vars.sh
echo "alias pup=$POWERUP_PATH$PUP_SCRIPT" >> $PUP_ENV$ACTIVATE_SH/env_vars.sh
echo "[ ! -e $POWERUP_PATH/pup-venv/bin/ ] && mkdir -p $POWERUP_PATH/pup-venv/" >> $PUP_ENV$ACTIVATE_SH/env_vars.sh
echo "[ ! -e $POWERUP_PATH/logs ] && mkdir -p $POWERUP_PATH/logs" >> $PUP_ENV$ACTIVATE_SH/env_vars.sh
echo "[ ! -e $POWERUP_PATH/logs/gen ] && touch $POWERUP_PATH/logs/gen" >> $PUP_ENV$ACTIVATE_SH/env_vars.sh
# RUN mkdir -p /home/powerup/app/power-up/logs && touch /home/powerup/app/power-up/logs/gen
echo "ln -sf $PUP_CONDA_BIN $POWERUP_PATH/pup-venv/" >> $PUP_ENV$ACTIVATE_SH/env_vars.sh
echo "[ -e $POWERUP_PATH/pup-venv/bin ] && rm $POWERUP_PATH/pup-venv/bin" >> $PUP_ENV$DEACTIVATE_SH/env_vars.sh
# RUN touch  /root/anaconda3/envs/powerup/etc/conda/activate.d/env_vars.sh &&  mkdir -p /root/anaconda3/envs/powerup/etc/conda/deactivate.d/env_vars.sh
#  Link binaries  
# RUN mkdir -p /home/powerup/app/power-up/pup-venv/ && ln -sf /root/anaconda3/envs/powerup/bin/ /home/powerup/app/power-up/pup-venv/
# RUN echo "cd /home/powerup/app/power-up/" >> ~/.bashrc
