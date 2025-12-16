resource "null_resource" "ansible" {
    provisioner "remote-exec" {
        connection {
            type      = "ssh"
            user      = "ec2-user"
            password  = "DevOps321"
            host      = var.pri_ip
        }

        inline = [
            "sudo dnf install python3.13-pip -y",
            "sudo pip3.13 install ansible",
            "ansible-pull -i localhost, -U https://github.com/Sandeepkumar0088/roboshop-ansible-roles-v2.git main.yml -e component=${var.component} -e env=dev"
        ]

    }
}

