
pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/khushiZalmi/2346_ISA2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("2346_image")
                }
            }
        }

        stage('Delete Existing Container') {
            steps {
                script {
                    def containerName = "2346_container"
                    sh "docker rm -f ${containerName} || true"
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    def containerName = "2346_container"
                    docker.image("2346_image").run("-d --name ${containerName} -p 5000:5000")
                }
            }
        }
    }
}
