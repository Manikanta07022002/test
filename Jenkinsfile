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
                sh '''aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 339712873615.dkr.ecr.ap-south-1.amazonaws.com
                docker build -t mani/todo-app .
docker tag mani/todo-app:latest 339712873615.dkr.ecr.ap-south-1.amazonaws.com/mani/todo-app:latest
docker push 339712873615.dkr.ecr.ap-south-1.amazonaws.com/mani/todo-app:latest'''
            }
        }
        stage('kubernetes upload') {
            steps {
                sh '''
                CREDENTIALS=$(aws sts assume-role --role-arn arn:aws:iam::339712873615:role/Kubectlroleveera --role-session-name codebuild-kubectl --duration-seconds 900)
        export AWS_ACCESS_KEY_ID="$(echo ${CREDENTIALS} | jq -r '.Credentials.AccessKeyId')"
        export AWS_SECRET_ACCESS_KEY="$(echo ${CREDENTIALS} | jq -r '.Credentials.SecretAccessKey')"
        export AWS_SESSION_TOKEN="$(echo ${CREDENTIALS} | jq -r '.Credentials.SessionToken')"
        export AWS_EXPIRATION=$(echo ${CREDENTIALS} | jq -r '.Credentials.Expiration')
        aws eks update-kubeconfig --name test --region ap-south-1
        kubectl apply -f manifests/.
        kubectl get svc
        '''
            }
        }
    }
}
