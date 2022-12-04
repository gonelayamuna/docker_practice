pipeline{
    agent{
        docker { 
            image "196368117498.dkr.ecr.ap-south-1.amazonaws.com/custom-tools:image1.0"
            args '--entrypoint= '
            registryCredentialsId "ecr:ap-south-1:aws-instance"
            registryUrl "https://196368117498.dkr.ecr.ap-south-1.amazonaws.com"
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
