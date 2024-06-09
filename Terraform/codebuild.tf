resource "aws_codebuild_project" "build_project" { 
  name           = "MyCodeBuildProject" 
  service_role   = var.role_arn 
  artifacts { 
    type  = "S3" 
    location = var.artifact_bucket 
  } 
  environment { 
    compute_type = "BUILD_GENERAL1_SMALL" 
    image        = "aws/codebuild/standard:4.0" 
    type         = "LINUX_CONTAINER" 
  } 
  source { 
    type      = "GITHUB" 
    location  = "https://github.com/${var.github_owner}/${var.github_repo}.git" 
  } 
} 
 
output "project_name" { 
  value = aws_codebuild_project.build_project.name 
}