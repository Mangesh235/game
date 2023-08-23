pipeline{
    agent any
   
    stages{
	 stage('SonarQube Scan') {	    
              steps{
          toolVersion = "Version 9.6.1"
          properties {
            property "sonar.squ_b88a7db3e0b5ae2cb28a31d85b81204fa62f9611", "my-project"
            property "sonar.sources", "src/main/java"
  }
}	    
}     
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Mangesh235/game.git'
            }
        }
      
	stage( 'SonarAnalysis'){
	   steps{
                  sh """
            sonar-scanner \
  -Dsonar.projectKey=pass \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://192.168.0.123:9000
            """
		  }
}
       
        
        stage('docker image build'){
            steps{
                sh '/usr/bin/docker image build -t mangu235/game .'
            }
        }
        
        stage ('docker login') {
            steps {
                sh 'echo dckr_pat_Gm6M_buPE8Hs6icymwGyyfigaTs | /usr/bin/docker login -u mangu235 --password-stdin'
            }
        }
        stage('docker image push'){
            steps{
                sh '/usr/bin/docker image push mangu235/game'
            }
        }
        stage('delivery confirmation'){
            steps{
                input 'Do you want to deploy  application'
            }
        }
        stage('docker remove service'){
            steps{
                sh '/usr/bin/docker service rm game_service'
            }
        }
        stage('docker create service'){
            steps{
                sh '/usr/bin/docker service create --name game_service -p 80:80 mangu235/game'
                    
            
                    }
                }
          
        
    }
            
        }

                
    
            
        
