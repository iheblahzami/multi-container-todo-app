variable "resource_group_name" {
  default = "kml_rg_main-7aeeb7f3d4c84226"
}

variable "location" {
  default = "France Central"
}

variable "vm_name" {
  default = "todo-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}
