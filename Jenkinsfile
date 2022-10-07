pipeline {
    environment {
    registry = "srisankar/dockerswarm"
    registryCredential = "HUB"
    dockerImage = ''
    PATH = "$PATH:/usr/local/bin"
}

    agent any
    stages {
           
            // stage('Building Docker Image') {
            //     steps {
            //         script {
            //             dockerImage = docker.build registry + ":$BUILD_NUMBER"
            //         }
            //     }
            // }

            // stage('Deploying Docker Image to Dockerhub') {
            //     steps {
            //         script {
            //             docker.withRegistry('', registryCredential) {
            //             dockerImage.push()
            //             }
            //         }
            //     }
            // }

            stage('Run Angular') {
                steps{
                  sh "docker service create --name myclusterdemo --publish 4200:4200 --replicas 2 $registry:$BUILD_NUMBER"
                }
            }
        }
    }