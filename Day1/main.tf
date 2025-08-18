provider "aws" {
    region = "us-west-1"
}       

resource "aws_instance" "my_instance" { 
    ami = "ami-06e11c4cc68c362dd"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-084d034f9cc84fef5"]
  
}