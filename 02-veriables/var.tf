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