pipeline{
    agent any
   
    stages{
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Mangesh235/game.git'
            }
        }
        sonarQubeScanner {
          toolVersion = "Version 9.6.1"
          properties {
            property "sonar.projectKey", "my-project"
            property "sonar.sources", "src/main/java"
  }
}	    
        stage( 'SonarAnalysis'){
	          steps{
                  sh """
            ${scannerHome}/bin/sonar-scanner \\
            -Dsonar.projectKey=php \\
            -Dsonar.sources=code_to_scan \\
            -Dsonar.host.url=http://localhost:9000 \\
            -Dsonar.login=squ_b88a7db3e0b5ae2cb28a31d85b81204fa62f9611
            -Dsonar.analysis.mode=issues \\
            -Dsonar.externalIssuesReportPaths=report.json
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

                
    
            
        
