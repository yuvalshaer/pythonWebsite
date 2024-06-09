resource "aws_secretsmanager_secret" "my_secret" { 
  name        = "MySecretName" 
  description = "My secret for the application" 
  secret_string = jsonencode({ 
    username = "myuser" 
    password = "mypassword" 
  }) 
} 
