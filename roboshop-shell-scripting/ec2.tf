resource "aws_spot_instance_request" "cheap_worker" {
  count                     = local.LENGTH
  //count                     = length(var.COMPONENTS)
  ami                       = "ami-074df373d6bafa625"
  spot_price                = "0.0031"
  instance_type             = "t3.micro"
  vpc_security_group_ids    = ["sg-0017bec6ae883767e"]
  wait_for_fulfillment      = true
  //spot_type                 = "persistent"
  tags                      = {
    Name                    = element(var.COMPONENTS, count.index)
  }
}

resource "aws_ec2_tag" "name-tag" {
  count                     = local.LENGTH
  resource_id               = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                       = "Name"
  value                     = element(var.COMPONENTS, count.index)
}


resource "aws_route53_record" "records" {
  count                     = local.LENGTH
  name                      = element(var.COMPONENTS, count.index)
  type                      = "A"
  zone_id                   = "Z06528191AT2UREAD9AW7"
  ttl                       = 300
  records                   = [element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)]
}



# resource "null_resource" "run-shell-scripting" {
#   depends_on                = [aws_route53_record.records]
#   count                     = local.LENGTH
#   provisioner "remote-exec" {
#     connection {
#       host                  = element(aws_spot_instance_request.cheap_worker.*.public_ip, count.index)
#       user                  = "centos"
#       password              = "DevOps321"
#     }

#     inline = [
#     "cd /home/centos",
#     "git clone https://github.com/pankisingh/shell-scripting-2023.git",
#     "cd shell-scripting-2023/Roboshop",
#     "git pull",
#     "sudo make ${element(var.COMPONENTS, count.index)}"
#     ]
#   }
# }


locals {
  LENGTH    = length(var.COMPONENTS)
}