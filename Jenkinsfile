pipeline {
    agent any
    stages {
         stage('init') {
            steps {
                sh 'terraform init -no-color'
            }
        }
       
        stage('plan') {
            steps {
                sh 'terraform plan -no-color -out tf.plan'
            }
        }
        stage('apply') {
            steps {
                sh 'terraform apply -auto-approve tf.plan'
            }
        }
         stage('destroy') {
            steps {
                input("Ready to proceed?")
                sh 'terraform destroy -auto-approve'
            }
        }
        
        //  stage('Node-connect'){
        //  steps {
                
        //          sh 'create-node.sh http://13.126.199.155:8080 test admin:e1cb1ad4942f452e8a0c875fc0ba9106 && connect-node.sh https://15.206.88.207:8080 test admin:e1cb1ad4942f452e8a0c875fc0ba9106
                  
        //        }    


        //  }
    
}