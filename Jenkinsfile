pipeline {
    agent any

    environment {
        IMAGE_NAME = 'niveditha223/petclinic-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/NivedithaMalllikarjun/spring-petclinic-devops.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Docker push completed successfully!'
        }
        failure {
            echo '❌ Build failed. Check logs for details.'
        }
    }
}

