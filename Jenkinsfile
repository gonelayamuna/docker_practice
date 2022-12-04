pipeline{
    withAWS(credentials: 'my_credentials'){
    sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 196368117498.dkr.ecr.ap-south-1.amazonaws.com"
    
    }
    agent{
        docker { 
            image '196368117498.dkr.ecr.ap-south-1.amazonaws.com/custom-tools:image1.0'
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
