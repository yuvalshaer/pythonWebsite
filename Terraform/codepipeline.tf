resource "aws_codepipeline" "codepipeline" { 
  name     = "MyCodePipeline" 
  role_arn = var.role_arn 
  artifact_store { 
    type     = "S3" 
    location = var.artifact_bucket 
  } 
  stage { 
    name = "Source" 
    action { 
      name             = "SourceAction" 
      category         = "Source" 
      owner            = "ThirdParty" 
      provider         = "GitHub" 
      version          = "1" 
      output_artifacts = ["source_output"] 
      configuration = { 
        Owner       = var.github_owner 
        Repo        = var.github_repo 
        Branch      = "main" 
        OAuthToken  = var.github_token 
      } 
    } 
  } 
  stage { 
    name = "Build" 
    action { 
      name             = "BuildAction" 
      category         = "Build" 
      owner            = "AWS" 
      provider         = "CodeBuild" 
      version          = "1" 
      input_artifacts  = ["source_output"] 
      output_artifacts = ["build_output"] 
      configuration = { 
        ProjectName = var.codebuild_project_name 
      } 
    } 
  } 
  stage { 
    name = "Deploy" 
    action { 
      name             = "DeployAction" 
      category         = "Deploy" 
      owner            = "AWS" 
      provider         = "CodeDeploy" 
      version          = "1" 
      input_artifacts  = ["build_output"] 
      configuration = { 
        ApplicationName = var.codedeploy_application_name 
        DeploymentGroupName = var.codedeploy_deployment_group_name 
      } 
    } 
  } 
} 
 