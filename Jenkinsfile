pipeline {
    agent any
    environment {
        registry = 'sevgulnl/snl-vue'
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
            environment {
                registryCredential = 'dockerhub'
            }
            steps {
                script {
                    sh 'docker stop $(docker ps -a -q | grep "sevgulnl/snl-vue")'
                    sh 'docker rm -v sevgulnl/snl-vue'
                    sh 'docker images -a |  grep "sevgulnl/snl-vue"'

                    def appimage = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry( '', registryCredential ) {
                        appimage.push()
                        appimage.push('latest')
                    }
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    sh 'docker run -d -p 8010:8010 --rm --name snl-vue sevgulnl/snl-vue'
                }
            }
        }
    }
}
