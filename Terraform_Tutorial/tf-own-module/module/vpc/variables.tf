variable "vpc_config" {

  description = "To get the Cidr and Name of vpc:"
  type = object({
    name = string
    cidr_block = string
  })
  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format -${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  #subnet1 = {cidr = .. , azs = ..} , subnet 2 = { }, sunbnet3 = {}
  description = "Get the cidr "
  type = map(object({
    cidr_block = string
    az = string 
    public  = optional(bool, false)

  }))

  validation {
    condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR format"
  }
}