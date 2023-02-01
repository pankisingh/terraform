resource "aws_instance" "sample" {
  ami                    = "ami-0bb6af715826253bf"
  instance_type          = "t3.micro"
  vpc_security_group_ids =  [var.SG_ID]

  tags = {
    Name = "sample"
  }
}


variable "SG_ID" {
  
}


output "PRIVATE_IP" {
  value = aws_instance.sample.*.private_ip
}