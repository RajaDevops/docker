pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/RajaDevops/docker'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "my-docker-image:${env.BRANCH_NAME}"
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        
        stage('Test Docker Image') {
            steps {
                script {
                    def imageName = "my-docker-image:${env.BRANCH_NAME}"
                    sh "docker run --rm ${imageName} /bin/bash -c '/app/test.sh'"
                }
            }
        }
    }
    
    post {
        always {
            cleanWs() // Clean workspace after build
        }
    }
}
