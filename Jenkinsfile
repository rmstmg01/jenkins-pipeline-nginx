pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t nginxtest:latest .' 
                sh 'docker tag nginxtest rameshtmg/nginxtest:latest'
                sh 'docker tag nginxtest rameshtmg/nginxtest:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push rameshtmg/nginxtest:latest'
          sh  'docker push rameshtmg/nginxtest:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                sh "docker run -d -p 4030:80 rameshtmg/nginxtest"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@jenkins.ramesht.com.np run -d -p 4001:80 rameshtmg/nginxtest"
 
            }
        }
    }
}
