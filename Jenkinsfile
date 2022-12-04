import jenkins.model.*
jenkins = Jenkins.instance
pipeline{

    environment {
            AWS_ACCOUNT_ID="196368117498"
            AWS_DEFAULT_REGION="ap-south-1" 
            IMAGE_REPO_NAME="custom-tools"
            IMAGE_TAG="image1.0"
           
    }

    agent{
        docker { 
            image "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
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
