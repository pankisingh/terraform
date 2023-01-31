variable "sample" {
  default = "Hello world"
}

output "sample" {
  value = var.sample
}

variable "sample2" {
}

output "sample" {
  value = var.sample2
}