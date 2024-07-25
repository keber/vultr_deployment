# Automated Website deployment

This project Deploys a website in Vultr using Terraform and Ansible.

1. Creates an Ubuntu 22.04 Server in Vultr using Vultr API Key
2. Configures the system using ansible, including
    * apt update and upgrade
    * configure passwordless suo ansible user for remote access with ssh key
    * installs easy engine
    * creates a site with ssl wildcard
    * validates the ssl using cloudflare DNS
    * downloads frontend from private bitbucket repository using Access Token
    * writes proper DNS register on cloudflare to point to your site


## Pre-requirements

* in Vultr, create an API key. You have the option to attach it to a specific IP address or network (your computer IP address/network).
* in your Bitbucket repository, create an Access Token.
* in your Cloudflare account, create an API Token (prefer "All Zones")
* Ubuntu Linux system is assumed as command node (WSL works)

Install terraform, ansible and git:

```bash
sudo apt install terraform ansible git
```

Clone this repository or download a zip file

## Usage

Create a terraform.tfvars file following terraform.tfvars.example:

```terraform:
VULTR_API_KEY = "..."
frontend_repo = "keberlabs/keber_cl"
repo_access_token = "..."
CLOUDFLARE_API_TOKEN = "..."
CLOUDFLARE_ACCOUNT_ID = "..."
domain = "yourdomain.com"
mail = "you@mailprovider.com"
```

Then init, plan and apply:
```bash
terraform init
terraform plan
terraform apply
```


## License

[MIT](https://choosealicense.com/licenses/mit/)
