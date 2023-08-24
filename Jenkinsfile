pipeline{
    agent any

    stages{
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Mangesh235/game.git'
            }
        }
        stage( 'SonarAnalysis'){
        steps {
        sh '''/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=php -Dsonar.sources-code_to_scan  sonar-scanner -Dsonar.login=admin 
        -Dsonar.password=pass -Dsonar.host.url=http://localhost:9000 -Dsonar.login-squ_b88a7db3e0b5ae2cb28a31d85b81204fa62f9612 -Dsonar.java.binaries-code_to_scan '''
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

                            
