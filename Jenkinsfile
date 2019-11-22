pipeline {
    agent any
    stages {
        stage('destroy') {
            steps {
                sh 'terraform destroy -no-color'
            }
        }
        
}