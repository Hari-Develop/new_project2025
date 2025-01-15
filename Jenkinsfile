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
        stage('Build'){
            steps{
                sh """"
                    npm install
                    ls -la
                    zip -q -r catalogue.zip -x *zip -x .git 
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