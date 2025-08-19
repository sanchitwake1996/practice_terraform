variable "image_id" {
    default = "ami-014e30c8a36252ae5"
}

variable "instance_type" {  
    default = "t2.micro"
}

variable "security_group_ids" {
    default = ["sg-084d034f9cc84fef5"]
}

variable "key_pair" {
  default = "tf-key"
}

variable "env" {
    default = "dev"
}

variable "min_size" {
    default = "2"
}

variable "max_size" {
    default = "5"
}

variable "desired_size" {
    default = "2"  
}

variable "availability_zone" {
    default = ["us-west-1a", "us-west-1b"]
}

variable "vpc_id" {
    default = "vpc-0059d884d2b79cc1b"
}

variable "subnets" {
    default = ["subnet-0a8b6285d42788721", "subnet-00ef42666cc0db93a"]
}