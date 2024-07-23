
provider "aws" {
  region  =  "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true
  
   user_data =  <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                sudo echo 'Hello, World!' > /var/www/html/index.html
                sudo systemctl restart httpd
        EOF
  tags = {
    Name = "My_web_page"
  }
}



