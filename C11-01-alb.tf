resource "aws_lb" "web_servers" {
 name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  #vpc_id = module.vpc.vpc_id 
  security_groups    = [module.loadbalancer_sg.this_security_group_id]
  subnets            = [
      module.vpc.public_subnets[0],
      module.vpc.public_subnets[1]
  ]

  enable_deletion_protection = true
}