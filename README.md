### aws-linux-box

Deploy a linux box in the cloud where I can utilize tools such as WireShark and Splunk.

A simplified version and inspiration from:

https://github.com/adanalvarez/AWS-malware-lab/blob/main/README.md<br>
https://github.com/collinsmc23/cloud-cybersecurity-homelab

## Topology

## Download

  git clone https://github.com/riddy92/aws-linux-box.git
  cd aws-linux-box

## Deploy

Download Terraform: https://developer.hashicorp.com/terraform/downloads

terraform init: Initialize Terraform.

terraform plan: Plan Terraform configuration.

terraform apply -var="aws-key": Specify the public key name created in AWS in EC2 -> Network & Security.

    Add Public Key Name in between double quotes.

terraform destory: Destroy AWS infrastructure.
