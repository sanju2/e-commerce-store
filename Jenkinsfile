node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       app = docker.build("932747549174.dkr.ecr.us-east-2.amazonaws.com/capstone", "./DjangoEcommerce")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {

        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS_ID']]) {
        sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 932747549174.dkr.ecr.us-east-2.amazonaws.com"
        sh "docker push 932747549174.dkr.ecr.us-east-2.amazonaws.com/capstone:${env.BUILD_NUMBER}"
        }
        
    }
    
    stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
}
