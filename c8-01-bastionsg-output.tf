output "public_bastion_sg_group_id" {
  value = module.public_bastion_sg.this_security_group_id
}
output "public_bastion_sg_group_vpc_id" {
  value = module.public_bastion_sg.this_security_group_vpc_id
}
output "public_bastion_sg_group_name" {
  value = module.public_bastion_sg.this_security_group_name
}
output "public_sg_id" {
  value = module.public_bastion_sg.this_security_group_id
}

output "private_sg_group_vpc_id" {
  value = module.private_sg.this_security_group_vpc_id
}

output "private_sg_group_name" {
  value = module.private_sg.this_security_group_name
}