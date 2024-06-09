resource "aws_iam_role" "codebuild_role" { 
  name = "codebuild-role" 
  assume_role_policy = jsonencode({ 
    Version = "2012-10-17" 
    Statement = [ 
      { 
        Effect = "Allow" 
        Principal = { 
          Service = "codebuild.amazonaws.com" 
        } 
        Action = "sts:AssumeRole" 
      } 
    ] 
  }) 
} 
 
resource "aws_iam_role_policy" "codebuild_policy" { 
  name = "codebuild-policy" 
  role = aws_iam_role.codebuild_role.name 
 
  policy = jsonencode({ 
    Version = "2012-10-17" 
    Statement = [ 
      { 
        Effect = "Allow" 
        Action = [ 
          "s3:*", 
          "logs:*", 
          "codebuild:*" 
        ] 
        Resource = "*" 
      } 
    ] 
  }) 
} 
 
resource "aws_iam_role" "codepipeline_role" { 
  name = "codepipeline-role" 
 
  assume_role_policy = jsonencode({ 
    Version = "2012-10-17" 
    Statement = [ 
      { 
        Effect = "Allow" 
        Principal = { 
          Service = "codepipeline.amazonaws.com" 
        } 
        Action = "sts:AssumeRole" 
      } 
    ] 
  }) 
} 
 
resource "aws_iam_role_policy" "codepipeline_policy" { 
  name = "codepipeline-policy" 
  role = aws_iam_role.codepipeline_role.name 
 
  policy = jsonencode({ 
    Version = "2012-10-17" 
    Statement = [ 
      { 
        Effect = "Allow" 
        Action = [ 
          "s3:*", 
          "codebuild:*", 
          "codedeploy:*", 
          "cloudwatch:*", 
          "iam:PassRole" 
        ] 
        Resource = "*" 
      } 
    ] 
  }) 
} 
 
output "codebuild_role_arn" { 
  value = aws_iam_role.codebuild_role.arn 
} 
 
output "codepipeline_role_arn" { 
  value = aws_iam_role.codepipeline_role.arn 
} 
 