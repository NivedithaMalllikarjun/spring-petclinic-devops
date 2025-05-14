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
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $petclinic-app .'
            }
        }

        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: 'https://hub.docker.com/repositories/niveditha223']) {
                    sh 'docker push $petclinic-app'
                }
            }
        }
    }
}

