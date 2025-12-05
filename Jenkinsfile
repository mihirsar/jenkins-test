pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Webhook Test') {
            steps {
                echo "SUCCESS: GitHub Webhook triggered this Jenkins build!"
            }
        }
    }
}
