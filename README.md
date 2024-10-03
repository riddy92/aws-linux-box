### AWS Linux Box

Deploy a linux box in the cloud where I can utilize tools such as WireShark and Splunk.

A simplified version and inspiration from:

https://github.com/adanalvarez/AWS-malware-lab/blob/main/README.md<br>
https://github.com/collinsmc23/cloud-cybersecurity-homelab

## Topology

## Download

  `git clone https://github.com/riddy92/aws-linux-box.git`<br>
  `cd aws-linux-box`

## Deploy

Download Terraform: https://developer.hashicorp.com/terraform/downloads

We have to create a configuration file, with the name terraform.tfvars.json like this:

  { 
      "security_tools_key": "ssh-rsa adjljnldjndj… public key”,<br>
      "security_tools_ami": "ami-xxxxxxxxxxxxxxxxx" ,<br>
      "region": "us-east-1" ,<br>
      "profile": “profile name”
  }

`terraform init`: Initialize Terraform.

`terraform plan`: Plan Terraform configuration.

`terraform apply`

`terraform destory`: Destroy AWS infrastructure.
