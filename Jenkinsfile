pipeline{
    agent {
        node {
            label 'Jenkins_agent'
        }
    }
    environment {
        VERSION = 'Jenkins 7.2 is running'
    }
    //Build stage
    stages{
        stage('Checkout'){
            steps{
                echo 'Code Checkout Stage'
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
                    echo "$env.VERSION"
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