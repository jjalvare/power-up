pipeline {
    agent any
    environment {
       CONDA_ROOT="WORKSPACE/anaconda3/"
       CONDA_SCRIPT='$WORKSPACE/anaconda.sh'
       TEST_REPO='$WORKSPACE'
       CONDA_ENV='powerup'
    }
    stages {
        stage('Setup Environment') {
            steps {
                echo 'Running Conda..'
                sh "bash setup_workspace.sh"
            }
        }
        stage('Run Tox') {
            steps {
                echo 'Testing..'
                sh "cd $TEST_REPO && bash $TEST_REPO/run_test.sh"
            }
        }
        stage('Test') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
