pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'devops-project-token', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"'
                    sh 'docker tag devops-build_web:latest frankgin/dev:latest'
                    sh 'docker push frankgin/dev:latest'
                }
            }
        }
        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'devops-project-token', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"'
                    sh 'docker tag devops-build_web:latest frankgin/prod:latest'
                    sh 'docker push frankgin/prod:latest'
                }
            }
        }
        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh './deploy.sh'
            }
        }
    }
}
