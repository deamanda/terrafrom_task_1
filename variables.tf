variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "vpc_cidr"
}


variable "availability_zone1" {
  type        = string
  default     = "eu-west-1a"
  description = "availability_zone1"
}
variable "subnet1_cidr" {
  type        = string
  default     = "10.10.1.0/24"
  description = "subnet1_cidr"
}


variable "availability_zone2" {
  type        = string
  default     = "eu-west-1b"
  description = "availability_zone2"
}
variable "subnet2_cidr" {
  type        = string
  default     = "10.10.3.0/24"
  description = "subnet2_cidr"
}


variable "availability_zone3" {
  type        = string
  default     = "eu-west-1c"
  description = "availability_zone3"
}
variable "subnet3_cidr" {
  type        = string
  default     = "10.10.5.0/24"
  description = "subnet3_cidr"
}