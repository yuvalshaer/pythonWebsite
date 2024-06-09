variable "region" { 
  default = "us-west-2" 
} 
 
variable "github_owner" { 
  description = "GitHub owner" 
  type        = string 
} 
 
variable "github_repo" { 
  description = "GitHub repository" 
  type        = string 
} 
 
variable "github_token" { 
  description = "GitHub OAuth token" 
  type        = string 
  sensitive   = true 
} 
 
variable "key_name" { 
  description = "Key pair name for EC2" 
  type        = string 
} 
