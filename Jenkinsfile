pipeline {
  agent {
    docker {
      image 'hashicorp/terraform'
      args '--entrypoint='
    }

  }
  stages {
    stage('Terraform init') {
      steps {
        sh 'terraform init -backend-config=backend.tfvars'
      }
    }

    stage('Terraform plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform apply') {
      steps {
        sh 'terraform apply -auto-approve'
      }
    }

    stage('Terraform output') {
      steps {
        sh 'terraform output'
      }
    }

  }
  environment {
    AWS_REGION = 'eu-west-3'
  }
  options {
    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
  }
}
