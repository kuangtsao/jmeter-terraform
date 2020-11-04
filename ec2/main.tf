resource "aws_instance" "jmeter_master" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    availability_zone = var.master_availability_zone
    security_groups = ["jmeter_master"]
    user_data = file("${path.module}/master-ec2-init.sh")
    tags = {
        Name = "jmeter_master"
    } 
    key_name = "awsjptest" #自己先做一把 key 出來
}

resource "aws_instance" "jmeter_slave" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    availability_zone = var.slave_availability_zone
    security_groups = ["jmeter_slave"]
    user_data = file("${path.module}/slave-ec2-init.sh")
    tags = {
        Name = "jmeter_slave"
    }
    key_name = "awsjptest" 
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
