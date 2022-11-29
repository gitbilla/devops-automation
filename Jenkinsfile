pipeline {
    agent any
    tools {
      maven 'maven-3.8.6'
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git_user', url: 'https://github.com/gitbilla/devops-automation']]])
                sh "mvn clean install"
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                    sh "docker build -t abramdocker/devops-integration ."
                }
            }
        }
        stage("Push Docker Image"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DOCKER_HUB_CREDS', variable: 'DOCKER_HUB_CREDS')]) {
                    sh "docker login -u abramdocker -p${DOCKER_HUB_CREDS}"
                    }
                    sh "docker push abramdocker/devops-integration"
                }
            }
        }
    }
}
