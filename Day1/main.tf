provider "aws" {
  region = "us-west-1"
}       

resource "aws_instance" "my_instance" { 
    ami = "ami-04241a9931ffe28a0"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-084d034f9cc84fef5"]
  
}