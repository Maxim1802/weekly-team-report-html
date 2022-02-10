pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: node
            image: node:16.13.1-alpine
            command:
            - cat
            tty: true
          - name: terraform
            image: hashicorp/terraform:latest
            command:
            - cat
            tty: true
          - name: cli
            image: amazon/aws-cli
            command:
            - cat
            tty: true
          - name: docker
            image: docker:19.03.1-dind
            securityContext:
                privileged: true

            env:
              - name: DOCKER_TLS_CERTDIR
                value: ""
        '''
    }
  }
  stages {
    stage('node') {
      steps {
        container('node') {
          sh 'npm install'
          sh 'npm run build'
        }
      }
    }

    stage('docker build') {
      steps{
        container('docker') {
          sh 'docker version'
          sh 'docker build -t weekly-team-report-html .'
        }
      }
    }
    
  }
}