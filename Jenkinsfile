pipeline {
    agent any
       tools {
  jdk 'JAVA_HOME'
  dockerTool 'Docker'
  git 'Default'
  maven 'Maven'
}
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/Manikanta07022002/test.git'
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Docker build and push') {
            steps {
                sh 'docker login -u username -p password'
                sh 'docker build -t oveeramanikanta/todo-app .'
                sh 'docker push oveeramanikanta/todo-app'
            }
        }
        
    }
}
