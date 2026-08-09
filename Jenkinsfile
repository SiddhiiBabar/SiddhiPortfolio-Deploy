pipeline {
    agent any
    environment {
        IMAGE_NAME = "siddhi-devops-portfolio"
        CONTAINER_NAME = "siddhi-devops-portfolio"
        S3_BUCKET = "YOUR-S3-BUCKET-NAME"
    }
    stages {
        stage('Checkout') { steps { checkout scm } }
        stage('Validate') {
            steps { sh 'test -f index.html && test -f style.css && test -f Dockerfile && test -f Jenkinsfile' }
        }
        stage('Docker Build') { steps { sh 'docker build -t $IMAGE_NAME .' } }
        stage('Deploy to EC2') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d --restart unless-stopped --name $CONTAINER_NAME -p 8081:80 $IMAGE_NAME
                docker ps --filter name=$CONTAINER_NAME
                '''
            }
        }
        stage('S3 Backup') {
            steps {
                sh '''
                zip -r portfolio-backup-${BUILD_NUMBER}.zip . -x ".git/*"
                aws s3 cp portfolio-backup-${BUILD_NUMBER}.zip s3://$S3_BUCKET/backups/
                '''
            }
        }
    }
    post {
        success { echo 'Portfolio deployed successfully to EC2.' }
        failure { echo 'Portfolio deployment failed.' }
    }
}