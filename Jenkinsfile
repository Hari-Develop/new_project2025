#!groovy
@Library('my-shared-library') _

def configMap = [
    application: "nodejsVM",
    component: "catalogue"
]
if( ! env.BRANCH_NAME.equalsIgnoreCase('main')){
    pipelineDecission.decidepipeline(configMap)
}
else {
    echo "main has to deal with production"
}
