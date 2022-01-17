module "ec2_private_app2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name    = "${var.environment}-vm"
  #instance_type = 4
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring = tru
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  instance_count         = var.private_instance_count
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  user_data              = file("${path.module}/app2-install.sh")
  tags                   = local.common_tags

}