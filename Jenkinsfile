pipeline{
    agent{
        node{
            label "Jenkins_agent"
        }
    }
    options{
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    environment{
        pacakageVersion = ''
    }
    stages{
        stage('getting Version of the application'){
            steps{
                script{
                    def packageJson = readJSON file: 'package.json'
                    pacakageVersion = pacakageJson.version
                    echo "the version of the application $pacakageVersion"
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
                    zip -q -r catalogue-${pacakageVersion}.zip ./* -x ".git" -x "*zip"
                """
            }
        }
    }
    post{
        always{
            echo "Pipeline is running"
        }
        failure{
            echo "pipeline is failed"
        }
        success{
            echo "pipeline is successfull"
        }
    }
}