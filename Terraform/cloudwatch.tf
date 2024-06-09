resource "aws_cloudwatch_metric_alarm" "cpu_alarm" { 
  alarm_name          = "cpu_alarm" 
  comparison_operator = "GreaterThanThreshold" 
  evaluation_periods  = "1" 
  metric_name         = "CPUUtilization" 
  namespace           = "AWS/EC2" 
  period              = "300" 
  statistic           = "Average" 
  threshold           = "70" 
  alarm_description   = "Alarm if CPU exceeds 70%" 
  dimensions = { 
    InstanceId = var.instance_id 
  } 
  alarm_actions = ["arn:aws:sns:us-west-2:123456789012:MySNSTopic"] 
} 
