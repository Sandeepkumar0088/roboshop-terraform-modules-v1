resource "aws_security_group" "main" {
    name          =  "roboshop-allow-all"
    description   =  "all traffic"

    tags =  {
        Name      =  "roboshop-allow-all"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.main.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.main.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1"
}