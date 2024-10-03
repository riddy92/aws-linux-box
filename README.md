### AWS Linux Box

Deploy a linux box in the cloud where I can utilize tools such as WireShark and Splunk.

This is a simplified version and slight modification of the below repositories (Used Local Modules in my terraform configuration):

https://github.com/adanalvarez/AWS-malware-lab/blob/main/README.md<br>
https://github.com/collinsmc23/cloud-cybersecurity-homelab

## Topology

![aws linux box](https://github.com/user-attachments/assets/c40253a6-1241-40cb-828e-00afd14aa89b)


## Download

  `git clone https://github.com/riddy92/aws-linux-box.git`<br>
  `cd aws-linux-box`

## Deploy

Download Terraform: https://developer.hashicorp.com/terraform/downloads

We have to create a configuration file, with the name terraform.tfvars.json like this:

```
{ 
    "security_tools_key": "ssh-rsa adjljnldjndj… public key”,
    "security_tools_ami": "ami-xxxxxxxxxxxxxxxxx" ,
    "region": "us-east-1" ,
    "profile": “profile name”  
}
```

`terraform init`: Initialize Terraform.

`terraform plan`: Plan Terraform configuration.

`terraform apply`: Create resources/infrastructure.

`terraform destory`: Destroy AWS infrastructure.
