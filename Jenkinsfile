pipeline {
    agent any
   
    stages {
	 /* stage('Remove Docker Containers/Images') {
		
            steps {
			sh 'docker stop 1e5d1f51021d'
			sh 'docker rm 1e5d1f51021d'
			sh 'docker rmi e559a4bf5954'			
		}
	}
    */
	stage('Build Docker Image') {
            steps {
                script {
                    def dockerfile = 'Dockerfile'
                    docker.build('angular-image:latest', "-f ${dockerfile} .")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('angular-image:latest').run('-p 4200:80')
                }
            }
        }
    }
}
