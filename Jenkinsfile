pipeline{
    agent any
   
    stages{
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Mangesh235/game.git'
            }
        }
        stage('Sonar'){
            steps{
                sh '/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=game   -Dsonar.sources=.   -Dsonar.host.url=http://localhost:9000   -Dsonar.login=squ_b88a7db3e0b5ae2cb28a31d85b81204fa62f9611'
            }
        }
        stage('docker image build'){
            steps{
                sh '/usr/bin/docker image build -t mangu235/game .'
            }
        }
        stage('docker auth'){
            steps{
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
                sh '/usr/bin/docker service rm clumsy'
            }
        }
        stage('docker create service'){
            steps{
                sh '/usr/bin/docker service create --name clumsy -p 80:80 mangu235/game'
                    
            
                    }
                }
          
        
    }
            
        }

                
    
            
        
