terraform {
    required_providers {
        vultr = {
            source = "vultr/vultr"
            version = "2.15.1"
        }
        cloudflare = {
            source = "registry.terraform.io/cloudflare/cloudflare"
        }
    }

}

provider "vultr" {
    api_key = var.VULTR_API_KEY
}

provider "cloudflare" {
    api_token = var.CLOUDFLARE_API_TOKEN
}
