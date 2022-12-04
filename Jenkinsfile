import jenkins.model.*
jenkins = Jenkins.instance
pipeline{
    agent{
        docker { 
            image "196368117498.dkr.ecr.ap-south-1.amazonaws.com/custom-tools:image1.0"
            args '--entrypoint= '
            registryCredentialsId "ecr:eu-west-1:aws-instance-role"
            registryUrl "https://<other-account-id>.dkr.ecr.eu-west-1.amazonaws.com"
        }
    }
    stages{
        stage('Test'){
            steps{
                sh 'java -version'
                sh '''
                    echo "This is testing using from the container"
                '''
            }
        }
    }
}
