provider "aws" { 
    region = "us-west-1"
  
}

resource "aws_instance" "my_instance" {
    ami = "ami-06e11c4cc68c362dd"
    instance_type = "t2.micro"
    vpc_security_group_ids = []
    tags = {
      env = "dev"
    }
}

resource "aws_security_group" "my_sg" { 
    region = "us-west-1"
    description = "new_sg"
    name = "my-security-group"
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      env = "dev"
    }
    vpc_id = "vpc-0059d884d2b79cc1b"

}