pipeline{
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'npm install'
                sh 'ng build --configuration=production --base-href=/webapp1/'
            }
            //post {
                //success {
               //     echo "Now Archiving the Artifacts..."
              //      archiveArtifacts artifacts: '**/dist/*.*'
             //   }
            //}
        }
        stage('Create Docker Image'){
            steps{
                sh "pwd"
                sh "ls -a"
                //sh "docker build . -t cazr32/microservices-example-1/service-001:${env.BUILD_ID}"
                sh "docker build -f Dockerfile . -t cazr32/microservices-example-1-webapp-001:${env.BUILD_ID}" 
            }          
        }
        stage('Publish Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub-credentials", url: "" ]) {
                    sh "docker push cazr32/microservices-example-1-webapp-001:${env.BUILD_ID}"
                }
            }
            post {
                success {
                    sh "BUILD_ID=${env.BUILD_ID} docker-compose up -d"
                }
            }
        }
        /*stage('Run database changes with liquibase'){
            steps{
                sh 'mvn -f pom.xml liquibase:update'
            }          
        }*/
    }
}