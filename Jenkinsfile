pipeline {
    agent {
        docker {
            image 'maven:3.8.5-openjdk-17'  // Specify the Maven and JDK Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Mount Docker socket to allow Docker commands inside the container
        }
    }

    environment {
        IMAGE_NAME = 'niveditha223/petclinic-app'  // Define your Docker image name
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/NivedithaMalllikarjun/spring-petclinic-devops.git'  // Clone the repo
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'  // Run Maven build, skipping tests for now
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'  // Build the Docker image with the specified tag
            }
        }

        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: 'https://hub.docker.com/repositories/niveditha223']) {
                    sh 'docker push $IMAGE_NAME'  // Push the built image to Docker Hub
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean up workspace after each run
        }
        success {
            echo "Build and push to Docker Hub successful!"
        }
        failure {
            echo "There was a failure in the pipeline."
        }
    }
}

