output "aws_instance_public_ip"  {
    value = aws_instance.app_server.public_ip
}

output "aws_instance_type" {
    value = aws_instance.app_server.instance_type
}

output "aws_iam" {
    value = aws_instance.app_server.ami  
}

output "aws_security_group_ids" {
    value = aws_instance.app_server.vpc_security_group_ids

}

output "aws_instance_url" {

    value = "http://${aws_instance.app_server.public_ip}" 
  
}