pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        script {
          docker.build('mern-eshop')
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          sh 'docker-compose up -d'
        }
      }
    }
  }
}

