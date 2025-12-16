module "network" {
    source                  = "./network"
}

module "ec2" {
    source                  = "./ec2"
    ami                     = var.ami
    instance_type           = var.instance_type
    vpc_security_group_ids  = module.network.sg
    component               = var.component
}

module "dns" {
    source                  = "./dns"
    pri_ip                  = module.ec2.instance.private_ip
    zone_id                 = var.zone_id
    component               = var.component
}