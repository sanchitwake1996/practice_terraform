# Modules

terraform {
    backend "s3" {
        bucket = "sanchit-tfstate-bucket"
        region = "us-west-1"
        key = "terraform.tfstate"
    }
}

provider "aws" {
    region = "us-west-1"
}

module "new_vpc" {
    source = "./modules/vpc"
    vpc_cidr = "172.16.0.0/16"
    pri_sub_cidr = "172.16.0.0/20"
    pub_sub_cidr = "172.16.16.0/20"
    project = var.project
    env = var.env
}

module "instance" {
    source = "./modules/ec2"
    image_id = "ami-014e30c8a36252ae5"
    instance_type = var.instance_type
    subnet_id = module.new_vpc.pub_sub_id
    vpc_id = module.new_vpc.vpc_id
    key_pair = "tf-key"
    project = "cbz"
}