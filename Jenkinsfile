pipeline {
    environment {
    registry = "srisankar/dockerswarm"
    registryCredential = "dockerhub"
    dockerImage = ''
    PATH = "$PATH:/usr/local/bin"
}

    agent {
        'docker'}
    stages {
            stage('Cloning our Git') {
                steps {
                git 'https://github.com/SrisankarS/DockerswarmJenkins.git'
                }
            }

            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                    }
                }
            }

            stage('Cleaning Up') {
                steps{
                  sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }

            stage('Run Angular') {
                steps{
                  sh "docker service create --name myclusterdemo --publish 4200:4200 --replicas 2 $registry:$BUILD_NUMBER"
                }
            }
        }
    }