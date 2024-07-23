
provider "aws" {
  region  = var.region
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
                sudo yum install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                sudo echo 'Hello, World!' > /var/www/html/index.html
                sudo systemctl restart nginx
        EOF
  tags = {
    Name = "My_web_page"
  }
}



