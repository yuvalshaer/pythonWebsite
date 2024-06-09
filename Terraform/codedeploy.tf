resource "aws_codedeploy_app" "app" { 
  name = "MyCodeDeployApplication" 
  compute_platform = "Server" 
} 
 
resource "aws_codedeploy_deployment_group" "deployment_group" { 
  app_name               = aws_codedeploy_app.app.name 
  deployment_group_name  = "MyDeploymentGroup" 
  service_role_arn       = var.role_arn 
  deployment_config_name = "CodeDeployDefault.OneAtATime" 
  ec2_tag_set { 
    ec2_tag_filter { 
      key   = "Name" 
      value = "MyEC2Instance" 
      type  = "KEY_AND_VALUE" 
    } 
  } 
} 
 
output "application_name" { 
  value = aws_codedeploy_app.app.name 
} 
 
output "deployment_group_name" { 
  value = aws_codedeploy_deployment_group.deployment_group.deployment_group_name 
} 
