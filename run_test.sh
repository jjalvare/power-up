#! /bin/bash
CONDA_ROOT=$WORKSPACE/anaconda3/
CONDA_SCRIPT=$WORKSPACE/anaconda.sh
TEST_REPO=$WORKSPACE/
CONDA_ENV=powerup

bash $TEST_REPO/run_tox.sh $CONDA_ROOT $TEST_REPO $CONDA_ENV 
