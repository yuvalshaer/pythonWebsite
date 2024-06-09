resource "aws_instance" "web" { 
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro" 
  key_name      = var.key_name 
 
  tags = { 
    Name = "MyEC2Instance" 
  } 
} 
 
output "instance_id" { 
  value = aws_instance.web.id 
} 
