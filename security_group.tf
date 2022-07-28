resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  description = "Allow SSH"
  vpc_id      = data.aws_vpc.lab_vpc.id 


  ingress {
    description      = "Allow port 3306"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.db-sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysql-server-sg"
  }
}

