pipeline{
  agent{
    label 'spc'
  }
  triggers{
    pollSCM('* * * * *')
  }
  stages{
    stage('Git checkout'){
        steps{
            git url:'https://github.com/Divyasri30/CI-CD-Pipeline-Java-spec.git',
                branch: 'main'
        }
    }
  }
}