#i need to create an elasitcs ip for my bastion host. 
resource "aws_eip" "bastion_ep" {
  depends_on = [
    module.ec2_public, module.vpc
  ]
  instance = module.ec2_public.id[0]
  vpc      = true
  tags     = local.common_tags
  #once i delete my instance it should also delete the elasitc ip. but i want to keep a log of termination of elasitc ip

  provisioner "local-exec" {
    command  = "echo Destroy time prov 'date' >> destroy-time-prov.txt"
    working_dir = "local-exec-output-file/"
    when     = destroy
  }
  #or remote_exec
  #local-exec whatever you put it inside it is going to run against your infra but store it in your localsystem

}