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
                sh 'docker tag devops-build_web:latest frankgin/dev:latest'
                sh 'docker login -u "frankgin" -p "yurb rrtn shya ccyc"'
                sh 'docker push frankgin/dev:latest'
            }
        }
        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker tag devops-build_web:latest frankgin/prod:latest'
                sh 'docker login -u "frankgin" -p "yurb rrtn shya ccyc"'
                sh 'docker push frankgin/prod:latest'
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
