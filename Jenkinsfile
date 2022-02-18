pipeline {
    agent any
    environment {
        HOME = '.'
    }

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node'
                }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'node'
                }
            }
            steps {
                sh 'npm run test'
            }
        }
        stage('Publish') {
            steps {
                script {
                    checkout scm
                    def appimage = docker.build("snl-vue:${env.BUILD_ID}")
                        customImage.push()
                    customImage.push('latest')
                }
            }
        }
    }
}
