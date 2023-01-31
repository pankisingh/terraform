variable "sample" {
  default = "Hello world"
}

output "sample" {
  value = var.sample
}

variable "sample2" {
}

output "sample2" {
  value = var.sample2
}

variable "string" {
  default = "Hello"
}

variable "number" {
  default = 10
}

variable "boolean" {
  default = false
}


output "data-types" {
  value = "string = ${var.string}, boolean =  ${var.boolean}, number = ${var.number}"
}


variable "Tranning" {
    default = ["devosp", "aws", "azure"]
}

variable "Tranning-details" {
    default = {devosp = "6 AM", aws = "7 AM", azure = "8 AM"}
}

output "var-types1" {
  value = var.Tranning[0]
}


variable "Fruits" {  
}

output "Fruits1" {
  value = var.Fruits
}


variable "COUNTRY" {  
}

output "COUNTRY" {
  value = var.COUNTRY
}





output "var-types" {
  value = "Traning = ${var.Tranning-details["devosp"]}"
}






