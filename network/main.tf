resource "aws_security_group" "main" {
    name          =  "roboshop-allow-all"
    description   =  "all traffic"

    tags =  {
        Name      =  "roboshop-allow-all"
    }
}