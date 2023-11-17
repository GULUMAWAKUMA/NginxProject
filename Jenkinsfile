pipeline{
    agent any
    environment {
        dockerImage="mynginxpro"
    }
    stages{
        stage("checkout github connect or not"){
            steps{
                git credentialsId: 'd99d963c-14c8-424e-93d3-ecec924a0d9f', url: 'https://github.com/GULUMAWAKUMA/NginxProject.git'
            }
        }
         stage("build dockerImage"){
            steps{
                script{
                    bat "docker build -t ${dockerImage} ."
                }
            }
        }
          stage("push docker image to dockerhub registry"){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'USER_PASSWORD', usernameVariable: 'USER_NAME')]) {
                        bat "docker login -u %USER_NAME% -p %USER_PASSWORD%"
                        bat "docker tag $dockerImage guluma/$dockerImage"
                        bat "docker push guluma/$dockerImage"
                    }
                }
            }
        }
    }
}