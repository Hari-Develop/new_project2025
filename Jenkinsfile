pipeline{
    agent {
        node {
            label 'Jenkins_agent'
        }
    }
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
            }
        }
    }
}