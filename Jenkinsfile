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
                sh 'mvn sonar:sonar -Pprofile'
              }
            } 
            } 
        
        stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') { // Just in case something goes wrong, pipeline will be killed after a timeout
                waitForQualityGate abortPipeline: true //waiting for a task to be completed
              }
            }
        
        }
  stage("nexus") {
            steps {
          withCredentials([usernamePassword(credentialsId: 'nexus-credentials', passwordVariable: 'password', usernameVariable:'username')]) {
              sh 'curl -u ${username}:${password} --upload-file target/WebApplication-${BUILD_NUMBER}.war http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/phoenixTeam/WebApplication-${BUILD_NUMBER}.war'
        //sh 'curl -v -F r=devopstraining -F hasPom=true -F e=war -F file=@pom.xml -F file=@target/WebApplication-0.0.1-SNAPSHOT.war -u ${username}:${password} http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/phoenixTeam/WebApplication-0.0.1-SNAPSHOT.war'
         }
        }
        }
        
        stage("ansible"){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
    }
}
}
