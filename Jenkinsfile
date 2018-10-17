pipeline {
  options {
    disableConcurrentBuilds()
    timeout(time: 1, unit: 'HOURS')
    timestamps()
  }
  agent {
    kubernetes {
      label 'docker'
      defaultContainer 'jnlp'
      yamlFile 'build-pod.yaml'
    }
  }
  stages {
    stage('Build') {
      steps {
        container('docker') {
          script {
            docker.build('jenkins-with-oc:v3.10.0')
          }
        }
      }
    }
    
    stage('Production Build and Push') {
      when {
        branch 'master'
      }
      
      steps {
        container('docker') {
          script {
            docker.build('docker-releases.danelaw.co.uk/jenkins-with-oc:v3.10.0').push()
          }
        }
      }
    }
  }
  post {
    always {
      container('docker') {
        sh 'docker rmi docker-releases.danelaw.co.uk/jenkins-with-oc:v3.10.0 || true'
        sh 'docker rmi jenkins-with-oc:v3.10.0 || true'
      }
    }
  }
}
