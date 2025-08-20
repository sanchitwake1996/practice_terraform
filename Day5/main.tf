provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-014e30c8a36252ae5"
    instance_type = "t2.micro"
}

