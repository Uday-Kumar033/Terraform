variable "instance_type" {
  description = "Enter the value what type of instances do you want to create ?"
  type = string
  validation {
    condition = var.instance_type=="t2.micro" || var.instance_type=="t3.micro"
    error_message = "Only t2.micro or t3.micro allowed"
  }
}

# variable "root_volume_size" {
#   type = number
#   default =  20 
# }

# variable "root_volume_type" {
#   type = string
#   default = "gp2"
# }

variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })

  default = {
    v_size = 20
    v_type = "gp2"
  }
}