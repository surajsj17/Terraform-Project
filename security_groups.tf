

resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.network.id
    description = "AWS Security Group"

        
        ingress{ 
            from_port   = 80
            to_port     = 80
            protocol   = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "HTTP access"
        }    
        ingress{ 
            from_port   = 443
            to_port     = 443
            protocol   = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        egress{
            from_port   = 0
            to_port     = 0
            protocol   = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            description = "All traffic"
        } 

    tags = {
        Name = "my-security-group"
    }
}