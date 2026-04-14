pipeline{
  agent{
    label 'spc'
  }
  triggers{
    pollSCM('* * * * *')
  }
  environment {
    IMAGE_NAME = 'java'
    TAG_NAME = '1.3'
  }
  stages{
    stage('Git checkout'){
        steps{
            git url:'https://github.com/Divyasri30/CI-CD-Pipeline-Java-spec.git',
                branch: 'main'
        }
    }
    stage('build'){
        steps{
            sh 'mvn clean package'
        }
    }
    // stage('Analyse code by using sonarqube cloud'){
    //     steps{
    //         withCredentials([string(credentialsId: 'SONAR-TOKEN', variable: 'SONAR_TOKEN')]){
    //             withSonarQubeEnv('SONAR'){
    //               sh """
    //                 mvn sonar:sonar \
    //                 -Dsonar.projectKey=Divyasri30_spring-petclinic \
    //                 -Dsonar.organization=divyasri30 \
    //                 -Dsonar.host.url=https://sonarcloud.io \
    //                 -Dsonar.login=$SONAR_TOKEN
    //                 """
    //             }
    //         }
    //     }
    // }
        stage('Docker Build') {
      steps {
        sh "docker build -t ${IMAGE_NAME}:${TAG_NAME} ."
      }
    }
    stage('trivy scan'){
      steps{
        sh "trivy image ${IMAGE_NAME}:${TAG_NAME} "
      }
    }
  }
  //  post {
  //   always {
  //       archiveArtifacts artifacts:'**/*.jar'
  //       junit '**/surefire-reports/*.xml'
  //   }
  //  }
  
  
}