output "s3_bucket_name" { 
  value = module.s3.bucket 
} 
 
output "ec2_instance_id" { 
  value = module.ec2.instance_id 
}