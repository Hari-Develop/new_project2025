pipeline{
    agent {
        node {
            label 'Jenkins_agent'
        }
    }
    environment {
        pacakageVersion = ''
    }
    options{
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    //Build stage
    stages{
        stage('Getting the version'){
            steps{
                script{
                    def pacakageJson = readJSON file: 'package.json'
                    pacakageVersion = pacakageJson.version
                    echo "pacakage version: $pacakageVersion"
                }
            }
        }
        stage('installing dependences'){
            steps{
                sh """
                    npm install
                """
            }
        }
        stage('Build'){
            steps{
                sh """
                    ls -la
                    zip -q -r catalogue.zip ./* -x ".git" -x "*zip"
                """
            }
        }
        stage('Static Code analysis'){
            steps{
                echo 'code testing stage'
                sh """
                    echo "$pacakageVersion"
                """
            }
        }
    }
    //post build stage
    post {
        always {
            echo "Pipline is completed "
        }
        failure {
            echo "pipeline is failed"
        }
        success {
            echo "Pipeline is success"
        }
    }
}