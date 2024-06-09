provider "aws" { 
  region = "us-west-2" 
} 
 
module "iam" { 
  source = "./iam" 
} 
 
module "s3" { 
  source = "./s3" 
} 
 
module "codebuild" { 
  source          = "./codebuild" 
  artifact_bucket = module.s3.bucket 
  role_arn        = module.iam.codebuild_role_arn 
} 
 
module "codepipeline" { 
  source          = "./codepipeline" 
  artifact_bucket = module.s3.bucket 
  codebuild_project_name = module.codebuild.project_name 
  codebuild_role_arn = module.iam.codebuild_role_arn 
  codedeploy_application_name = module.codedeploy.application_name 
  codedeploy_deployment_group_name = module.codedeploy.deployment_group_name 
} 
 
module "codedeploy" { 
  source = "./codedeploy" 
} 
 
module "ec2" { 
  source = "./ec2" 
} 
 
module "cloudwatch" { 
  source = "./cloudwatch" 
  instance_id = module.ec2.instance_id 
} 
 
module "secretsmanager" { 
  source = "./secretsmanager" 
} 
