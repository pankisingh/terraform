resource "aws_instance" "sample" {
  //count                 = 0
  ami                   = "ami-0bb6af715826253bf"
  instance_type         = var.TYPE == null ? "t3.micro" : var.TYPE
  //vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags                  = {
    Name                = "Sample"
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "TYPE" {
  default = null
}
