pipeline {
    agent any
    environment {
        BRANCH_NAME = "${env.GIT_BRANCH}".replaceFirst("origin/", "")
    }
    stages {
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push to Dev') {
            when {
                expression { BRANCH_NAME == 'dev' }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"'
                    sh 'docker tag devops-build_web frankgin/dev:latest'
                    sh 'docker push frankgin/dev:latest'
                }
            }
        }
        stage('Push to Prod') {
            when {
                expression { BRANCH_NAME == 'master' }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"'
                    sh 'docker tag devops-build_web frankgin/prod:latest'
                    sh 'docker push frankgin/prod:latest'
                }
            }
        }
        stage('Deploy') {
            when {
                expression { BRANCH_NAME == 'master' }
            }
            steps {
                sh './deploy.sh'
            }
        }
    }
}
