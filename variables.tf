variable "VULTR_API_KEY" {
    type = string
    description = "Vultr API KEY"    
    sensitive   = false
}

variable "ssh_user" {
    type = string
    default = "ubuntu"    
}

variable "private_key" {
    type = string
    default = "id_rsa"
}

variable "public_key" {
    type = string
    default = "id_rsa.pub"
}

variable "ssh_key_path" {
    type = string
    default = "~/.ssh/"
}

variable "ansible_username" {
    type = string
    default = "ansible"
}

variable "frontend_repo" {
    type = string
    default = ""
}

variable "repo_access_token" {
    type = string    
    sensitive   = false
}

variable "CLOUDFLARE_API_TOKEN" { sensitive = false }
variable "CLOUDFLARE_ACCOUNT_ID" { sensitive = false }
variable "CLOUDFLARE_GLOBAL_API_KEY" { sensitive = false }

variable "domain" { type = string} 
variable "mail" { type = string }