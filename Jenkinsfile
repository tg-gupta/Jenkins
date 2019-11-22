pipeline {
    agent any
    stages {
        
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