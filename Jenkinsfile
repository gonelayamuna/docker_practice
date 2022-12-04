pipeline{

    environment {
            AWS_ACCOUNT_ID="196368117498"
            AWS_DEFAULT_REGION="ap-south-1" 
            IMAGE_REPO_NAME="custom-tools"
            IMAGE_TAG="image1.0"
            # REPOSITORY_URI = “${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}”
    }
    agent{
        docker { 
            image "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
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
