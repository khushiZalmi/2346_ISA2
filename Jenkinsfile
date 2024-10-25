pipeline {
    agent any
    
    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}" // Adjust this path if Docker is installed elsewhere
    }
    
    stages {
        stage('Clean and Clone Repository') {
            steps {
                cleanWs()
                bat 'git clone https://github.com/khushiZalmi/2346_ISA2.git'
            }
        }
        stage('List Files') {
            steps {
                // List files to verify Dockerfile location
                dir('2346_ISA2') {
                    bat 'dir'
                }
            }
        }
        stage('Build') {
            steps {
                dir('2346_ISA2') {
                    bat 'docker build -t khushizalmi2346/khushi -f Dockerfile .'
                }
            }
        }
        stage('Login') {
            steps {
                bat 'docker login -u "khushizalmi2346" -p "0920khushi" docker.io'
            }
        }
        stage('Push') {
            steps {
                bat 'docker push khushizalmi2346/khushi'
            }
        }
        stage('Run in Daemon Mode') {
            steps {
                bat 'docker rm -f my_container'
                // Running the Docker container in daemon mode
                bat 'docker run -d --name my_container khushizalmi2346/khushi'
            }
        }
    }
}
