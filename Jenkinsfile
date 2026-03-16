pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'cd app && go test ./...'
            }
        }

        stage('Build') {
            steps {
                sh 'cd app && go build -o app'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook ansible/playbook.yml -e "workspace=${WORKSPACE}"'
            }
        }

        stage('Archive binary') {
            steps {
                archiveArtifacts artifacts: 'app/app', fingerprint: true
            }
        }
    }
}