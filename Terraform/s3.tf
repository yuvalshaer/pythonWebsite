resource "aws_s3_bucket" "codepipeline_bucket" { 
  bucket = "codepipeline-artifacts-store" 
  acl    = "private" 
} 
 
output "bucket" { 
  value = aws_s3_bucket.codepipeline_bucket.id 
} 
 