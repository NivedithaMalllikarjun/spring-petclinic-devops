pipeline {
    agent any

    environment {
        IMAGE_NAME = 'niveditha223/petclinic-app'
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
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo "Build and push to Docker Hub successful!"
        }
        failure {
            echo "There was a failure in the pipeline."
        }
    }
}
