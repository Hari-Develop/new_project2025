pipeline{
    agent {
        node {
            label 'Jenkins_agent'
        }
    }
    environment {
        VERSION = 'Jenkins 7.2 is running'
    }
    options{
        timeout(time:5, unit: 'SECONDS')
        disableConcurrentBuilds()
    }
    Parameters {
        string(name: 'Project', defaultValue: '', description: '')
        text(name: 'Description', defaultValue: '', description: '')
        booleanParam(name: 'Toggle', defaultValue: '', description: '')
        choice(name:'Env', choices: [], description: '')
        password(name: 'Password', defaultValue: '', description: '')
    }
    //Build stage
    stages{
        stage('Checkout'){
            steps{
                echo 'Code Checkout Stage'
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
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
                    echo "$env.VERSION"
                    sleep 10
                """
            }
        }
        stage('paramers check stage'){
            steps{
                echo "${params.Project}"
                echo "${params.Description}"
                echo "${params.Toggle}"
                echo "${params.Env}"
                echo "${params.Password}"
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