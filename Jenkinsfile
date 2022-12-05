pipeline{
    agent{
        docker { 
            image "196368117498.dkr.ecr.ap-south-1.amazonaws.com/custom-tools:image1.0"
            args '--entrypoint= '
            
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
