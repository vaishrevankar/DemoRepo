pipeline {
    agent any
    stages {

      stage('cleaning and building')
            {
                steps
                 { 
                    sh 'mvn clean package'
                 }
            }
        stage('OverOps') {
  steps {
    OverOpsQuery(
      // build configuration
      applicationName: '${JOB_NAME}',
      deploymentName: '${JOB_NAME}-${BUILD_NUMBER}',
      serviceId: 'Sxxxxx',

      // filter out event types
      regexFilter: '"type":\\"*(Timer|Logged Warning)',

      // mark build unstable
      markUnstable: true,

      // show top X issues
      printTopIssues: 5,

      // new error gate
      newEvents: true,

      // resurfaced error gate
      resurfacedErrors: true,

      // total error volume gate
      maxErrorVolume: 0,

      // unique error volume gate
      maxUniqueErrors: 0,

      // critical exception type gate
      criticalExceptionTypes: 'NullPointerException,IndexOutOfBoundsException,InvalidCastException,AssertionError',

      // increasing errors gate
      activeTimespan: '12h',
      baselineTimespan: '7d',
      minVolumeThreshold: 20,
      minErrorRateThreshold: 0.1,
      regressionDelta: 0.5,
      criticalRegressionDelta: 1.0,
      applySeasonality: true,

      // debug mode
      debug: false
    )
    echo "OverOps Reliability Report: ${BUILD_URL}OverOpsReport/"
  }
}
           //stage("SonarQube analysis") {
            //steps {
              //withSonarQubeEnv('sonarqube') {
                //sh 'mvn sonar:sonar'
              //}
            //} 
            //} 
        
        //stage("Quality Gate") {
          //  steps {
            //  timeout(time: 6, unit: 'MINUTES') { // Just in case something goes wrong, pipeline will be killed after a timeout
              //  waitForQualityGate abortPipeline: true //waiting for a task to be completed
              //}
            //}
        
       //}
  //stage("nexus") {
    //        steps {
      //    withCredentials([usernamePassword(credentialsId: 'nexus-credentials', passwordVariable: 'password', usernameVariable:'username')]) {
        //      sh 'curl -u ${username}:${password} --upload-file target/WebApplication-1.war http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/phoenixTeam/WebApplication-${BUILD_NUMBER}.war'
          //    sh 'curl -u ${username}:${password} --upload-file target/WebApplication-1.war http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/phoenixTeam/WebApplication-1.war'
        //sh 'curl -v -F r=devopstraining -F hasPom=true -F e=war -F file=@pom.xml -F file=@target/WebApplication-0.0.1-SNAPSHOT.war -u ${username}:${password} http://ec2-18-224-155-110.us-east-2.compute.amazonaws.com:8081/nexus/content/repositories/devopstraining/phoenixTeam/WebApplication-0.0.1-SNAPSHOT.war'
         //}
        //}
        //}
        
        //stage(" copying war to ansible"){
            //steps{
               // withCredentials([string(credentialsId: 'ansible_credentials', variable: 'password')]){
                   // sh 'sshpass -p ${password} scp -v -o StrictHostKeyChecking=no target/WebApplication-1.war ansadmin@172.31.10.200:/opt/playbooks/target/'
                //}
               //sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
        //}
   // }
        //stage("Deploy to Tomcat"){
          //  steps{
            //    withCredentials([string(credentialsId: 'ansible_credentials', variable: 'password')]){
              //      sh 'sshpass -p ${password} ssh -o StrictHostKeyChecking=no ansadmin@172.31.10.200 -C \"ansible-playbook /opt/playbooks/download.yml\"'
                //}
            //sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /opt/playbooks/copyfile.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
            
            //}
        //}
        
        //stage("slack"){
          //  steps{
            //    slackSend baseUrl: 'https://hooks.slack.com/services/', channel: '#phoenix_final', color: 'good', message: 'welcome', tokenCredentialId: 'slack-cred', username: 'phoenix'
        //}
        //}
}
}
