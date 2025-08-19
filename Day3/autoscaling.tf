#LoadBalancer with Autoscaling
#Create Launch Template for Home, Cloth and laptop

provider "aws" {
  region = "us-west-1"      
}

resource "aws_launch_template" "launch_template_home" {
    name = "launch-template-home"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = filebase64("home.sh")
    key_name = var.key_pair
    tags = {
      env = var.env
    }
  
}

resource "aws_launch_template" "launch_template_cloth" {
    name = "launch-template-cloth"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = filebase64("cloth.sh")
    key_name = var.key_pair
    tags = {
      env = var.env
    }
  
}


resource "aws_launch_template" "launch_template_laptop" {
    name = "launch-template-laptop"
    image_id = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
    user_data = filebase64("laptop.sh")
    key_name = var.key_pair
    tags = {
      env = var.env
    }
  
}



#create autoscaling group and auto scaling policy


resource "aws_autoscaling_group" "asg_home" {
    name = "asg-home"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_size
    launch_template {
    id = aws_launch_template.launch_template_home.id
    }
    availability_zones = var.availability_zone
    tag {
      key = "env"
      value = var.env
      propagate_at_launch = true
    }
    target_group_arns = [ aws_lb_target_group.tg_home.arn ]
}

resource "aws_autoscaling_policy" "asp_home" {
    name = "asp-home"
    autoscaling_group_name = aws_autoscaling_group.asg_home.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_specification {
          predefined_metric_type = "ASGAverageCPUUtilization"
        
        }
    target_value = 50
    }
}



resource "aws_autoscaling_group" "asg_cloth" {
    name = "asg-cloth"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_size
    launch_template {
    id = aws_launch_template.launch_template_cloth.id
    }
    availability_zones = var.availability_zone
    tag {
      key = "env"
      value = var.env
      propagate_at_launch = true
    }
    target_group_arns = [ aws_lb_target_group.tg_cloth.arn ]
}

resource "aws_autoscaling_policy" "asp_cloth" {
    name = "asp-cloth"
    autoscaling_group_name = aws_autoscaling_group.asg_cloth.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_specification {
          predefined_metric_type = "ASGAverageCPUUtilization"
        
        }
    target_value = 50
    }
}


resource "aws_autoscaling_group" "asg_laptop" {
    name = "asg-laptop"
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_size
    launch_template {
    id = aws_launch_template.launch_template_laptop.id
    }
    availability_zones = var.availability_zone
    tag {
      key = "env"
      value = var.env
      propagate_at_launch = true
    }
    target_group_arns = [ aws_lb_target_group.tg_laptop.arn ]
}

resource "aws_autoscaling_policy" "asp_laptop" {
    name = "asp-laptop"
    autoscaling_group_name = aws_autoscaling_group.asg_laptop.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        predefined_metric_specification {
          predefined_metric_type = "ASGAverageCPUUtilization"
        
        }
    target_value = 50
    }
}