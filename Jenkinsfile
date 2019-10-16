pipeline {
    agent any
    stages {

      stage('clean and build')
            {
                steps
                 { 
                    sh 'mvn clean package'
                 }
            }
           stage("SonarQube analysis") {
            steps {
              withSonarQubeEnv('sonarqube') {
                sh 'mvn clean package sonar:sonar'
              }
            } 
            } 
  stage("nexus") {
            steps {
          withCredentials([usernamePassword(credentialsId: 'nexus-credentials', passwordVariable: 'password', usernameVariable:'username')]) {
         sh 'curl -u ${username}:${password} --upload-file target/WebApplication-0.0.1-SNAPSHOT.war http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/WebApplication-0.0.1-SNAPSHOT.war'
        //sh 'curl -v -F r=devopstraining -F hasPom=true -F e=war -F file=@pom.xml -F file=@target/auth-1.3.5.RELEASE.war -u ${username}:${password} http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus'
        }
         }
        }
        }
        }
