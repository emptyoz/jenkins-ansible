pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                dir('app') {
                    sh 'go test ./...'
                }
            }
        }

        stage('Build') {
            steps {
                dir('app') {
                    sh 'go build -o app'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook ansible/playbook.yml'
            }
        }

        stage('Verify') {
            steps {
                sh 'sleep 3'
                sh 'curl http://localhost:8080/?text=Go || echo "Service not ready yet"'
            }
        }
    }
}