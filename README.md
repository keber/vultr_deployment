# Automated Website deployment

This project Deploys a website in Vultr using Terraform and Ansible.

1. Creates an Ubuntu 22.04 Server in Vultr using Vultr API Key
2. Configures the system using ansible, including
    * apt update and upgrade
    * configure passwordless sudo ansible user for remote access with ssh key
    * installs easy engine
    * creates a site with ssl wildcard
    * validates the ssl using cloudflare DNS
    * downloads frontend from private bitbucket repository using Access Token
    * writes proper DNS register on cloudflare to point to your site


## Pre-requirements

* Buy/Own a domain. You can buy it in any registrar like namecheap.com or anyother else.
* in Vultr, [create an API key](). You have the option to attach it to a specific IP address or network (your computer IP address/network).
    - You will need this in order to create your VPS in vultr.
* in your Bitbucket repository, [create an Access Token](https://support.atlassian.com/bitbucket-cloud/docs/create-a-repository-access-token/)
    - You will need this to retrieve the website to show on your domain.
* in your Cloudflare account, [create an API Token](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) (prefer "All Zones") and a [Global API Key](https://developers.cloudflare.com/fundamentals/api/get-started/keys/).
    - You will need the API Token to modify your zone in order to add DNS registers to point your domain to your VPS.
    - You will need the Global API Key for Easy-Engine to automatically validate a Let's encrypt SSL Cert. While Global API Key is a legacy mechanism and can be deprecated in the future, is the current way Easy-Engine can directly handle SSL validation through DNS mechanism, which is a must if you select a wildcard certificate.
* Ubuntu Linux system is assumed as command node (WSL works)
* An id_rsa / id_rsa.pub key pair in your ~/.ssh/ directory.

Install terraform, ansible and git:

```bash
sudo apt install terraform ansible git
```

Clone this repository or download a zip file

## Usage

Create a terraform.tfvars file following terraform.tfvars.example:

```terraform
VULTR_API_KEY = "..."
frontend_repo = "keberlabs/keber_cl"	#as in https://bitbucket.org/keberlabs/keber_cl .
repo_access_token = "..."
CLOUDFLARE_API_TOKEN = "..."
CLOUDFLARE_ACCOUNT_ID = "..."
domain = "yourdomain.com"
mail = "you@mailprovider.com"
CLOUDFLARE_GLOBAL_API_KEY = "..."
```

Then init, plan and apply:
```bash
terraform init
terraform plan
terraform apply
```


## License

[MIT](https://choosealicense.com/licenses/mit/)
