pipeline{
     environment {
        registry = "jecer1997/myrepo"
        registryCredential = 'docker_id'
        dockerImage = ''
    }
    agent any
    stages{

        stage('Clone Git Repo'){
            steps{
                echo 'pulling from git ... ';
                git branch:'master',
                url:'https://github.com/JecerBenH/cf-file-server.git';
            }
        }


        stage('Maven compile'){
            steps{
                echo 'Maven compile';
                sh "mvn compiler:compile";
           }
        }

        stage('Maven Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Build Docker Image'){
            steps {
                script{
                    sh 'docker image build  -t jecer1997/cf-server:latest .  '
                }
            }
        }

        stage('Run Docker Image'){
            steps {
                script{
                    sh 'docker run -d --rm --name CfServerContainer -p 5683:5683/udp jecer1997/cf-server:latest  '
                }
            }
        }



         stage('Docker cleanup'){
                            steps {
                                script{
                                    sh ' docker image prune -f '
                                }
                            }
                }



    }
    }
