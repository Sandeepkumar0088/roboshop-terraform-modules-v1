module "network" {
    source = "./network"
}

module "ec2" {
    source                  = "./ec2"
    ami                     = var.ami
    instance_type           = var.instance_type
    vpc_security_group_ids  = module.network.sg
}