# Modules

provider "aws" {
    region = "us-west-1"
}

module "new_vpc" {
    source = "./modules/vpc"
    vpc_cidr = "172.16.0.0/16"
    pri_sub_cidr = "172.16.0.0/20"
    pub_sub_cidr = "172.16.16.0/20"
}

module "instance" {
    source = "./modules/ec2"
    image_id = "ami-014e30c8a36252ae5"
    subnet_id = module.new_vpc.pub_sub_id
    vpc_id = module.new_vpc.vpc_id
    key_pair = "tf-key"
    project = "cbz"
}