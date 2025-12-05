pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Webhook Test') {
            steps {
                echo "SUCCESS: GitHub Webhook triggered this Jenkins build!"
            }
        }
    }
}