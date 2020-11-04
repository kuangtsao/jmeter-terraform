resource "aws_security_group" "jmeter_master" {
  name        = "jmeter_master"
  description = "allow ports what jmeter master needs"
  vpc_id      = "vpc-3abca95d" #直接先抓帳號的 default vpc 來用

  ingress {
    description = "allow ssh login"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "expose jmeter master port"
    from_port   = 60000
    to_port     = 60000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jmeter_master"
  }
}

resource "aws_security_group" "jmeter_slave" {
  name        = "jmeter_slave"
  description = "allow ports what jmeter slave needs"
  vpc_id      = "vpc-3abca95d" #直接先抓帳號的 default vpc 來用

  ingress {
    description = "allow ssh login"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "expose jmeter slave 1099 port"
    from_port   = 1099
    to_port     = 1099
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "expose jmeter slave port"
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jmeter_slave"
  }
}