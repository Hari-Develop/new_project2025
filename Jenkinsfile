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
        timeout(time:10, unit: 'SECONDS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    //Build stage
    stages{
        stage('Getting the version'){
            steps{
                script{
                    def pacakageJson = readJSON file: 'pacakage.json'
                    pacakageVersion = pacakageJson.version
                    echo "pacakage version: $pacakageVersion"
                }
            }
        }
        stage('Build'){
            steps{
                echo 'code Build Stage'
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