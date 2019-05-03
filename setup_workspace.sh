#!/bin/bash

CONDA_ROOT=$WORKSPACE/anaconda3/
CONDA_SCRIPT=$WORKSPACE/anaconda.sh
TEST_REPO=$WORKSPACE/.
MAIN_REPO=$TEST_REPO
CONDA_ENV=powerup

[ ! -f $CONDA_SCRIPT ] && wget -O $CONDA_SCRIPT https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-ppc64le.sh
[ ! -f $CONDA_ROOT/etc/profile.d/conda.sh ] && rm -rf $CONDA_ROOT && mkdir $CONDA_ROOT && /bin/bash $CONDA_SCRIPT -b -p $CONDA_ROOT -f


# git clone "https://github.com/jjalvare/power-up.git -b jenkins" $TEST_REPO
# git rebase master
rm -rf $CONDA_ROOT/envs/$CONDA_ENV 
bash $MAIN_REPO/install_by_conda.sh $CONDA_ROOT $TEST_REPO $CONDA_ENV 

