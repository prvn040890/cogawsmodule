#we will create a null resource and provisioners
resource "null_resource" "name" {
    depends_on = [module.ec2_public]
    #we need to create the connection block
    connection {
        type = "ssh"
        host = aws_eip.bastion_ep.public_ip
        user = "ec2-user"
        password = ""
        private_key = file("private-key/terraform-key.pem")
    }

    #once connected
    provisioner "file" {
      source = "private-key/terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    }
    #we will run remote exec
    provisioner "remote-exec" {
      inline = [
          "sudo chmod 400 /tmp/terraform-key.pem"
      ]
    }
    provisioner "local-exec" {
      command = "echo vpc create on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-vpc-id.txt"
      working_dir = "local-exec-output-file"
    }
}