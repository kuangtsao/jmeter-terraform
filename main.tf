provider "aws" {
    region = "ap-northeast-1"
}

module "security_group" {
    source = "./security_group/"
}

#EC2 Module Block
module "ec2" {
    source = "./ec2/"
    depends_on = [module.security_group]
}

