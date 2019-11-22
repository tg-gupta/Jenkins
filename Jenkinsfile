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
        
        // stage('Node-connect'){
        //     steps {
                
        //         sh 'create-node.sh'
        //         sh 'connect-node.sh'
                
        //       }    


         }
    
}