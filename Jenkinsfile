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
        stage('Installing Dependencies...'){
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                    pip install pytest
                '''
            }
        }
        stage('Running Tests...'){
            steps {

                sh '''
                    . venv/bin/activate
                    pytest -q
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker Image...."
                    sh "docker build -t flaskapp:latest ."
                }
            }
        }
        stage('Trivy Scanning...'){
            steps {
                sh '''
                    echo "Running Trivy Scan..."
                    trivy image --exit-code 0 --severity HIGH, CRITICAL flaskapp:latest
                '''
            }
        }
        stage('Running Container from Docker Image') {
            steps {
                script {
                    echo "Stopping running container if any..."
                    sh """
                        docker stop flaskapp || true
                        docker rm flaskapp || true
                    """

                    echo "Running New Container..."
                    sh 'docker run -d -p 5000:5000 --name flaskapp flaskapp:latest'
                }
            }
        }
    }
}