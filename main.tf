module "network" {
    source                  = "./network"
}

module "ec2" {
    for_each                = var.component
    source                  = "./ec2"
    ami                     = var.ami
    instance_type           = var.instance_type
    vpc_security_group_ids  = module.network.sg
    component               = each.key
}

module "dns" {
    for_each                = var.component
    source                  = "./dns"
    pri_ip                  = module.ec2[each.key].instance.private_ip
    zone_id                 = var.zone_id
    component               = each.key
}

module "ansibble" {
    depends_on              = [ module.dns ]
    for_each                = var.component
    source = "./ansible"
    pri_ip                  = module.ec2[each.key].instance.private_ip
    component               = each.key
}