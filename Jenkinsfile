pipeline{
    agent{
        node{
            label "Jenkins_agent"
        }
    }
    environment{
        pacakageVersion = ''
        nexusUrl = '172.31.94.156:8081'
    }
    options{
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    stages{
        stage('getting Version of the application'){
            steps{
                script {

                    def packageJson = readJSON file: 'package.json'
                    pacakageVersion = packageJson.version
                    echo "the version of the application: $pacakageVersion"
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
                    ls -la
                """
            }
        }
        stage('nexus artificat uploader'){
            steps{
                nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: "${nexusUrl}",
                    groupId: 'com.roboshop',
                    version: "${pacakageVersion}",
                    repository: "catalogue",
                    credentialsId: 'nexus-auth',
                    artifacts: [
                        [artifactId: 'catalogue',
                        classifier: '',
                        file: 'catalogue.zip',
                        type: 'zip']
                    ]
                 )
            }
        }
    }
    post{
        always{
            echo "Pipeline is running"
            deleteDir()
        }
        failure{
            echo "pipeline is failed"
        }
        success{
            echo "pipeline is successfull"
        }
    }
}