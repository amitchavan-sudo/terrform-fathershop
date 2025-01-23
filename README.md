i use the aws ec2 machine for this task ,

step1 : install terraform 

step2 : install awscli

step3:  configure the aws and terraform 

step4: make structure
├── main.tf
├── modules
│   ├── eks
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── elasticache
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── letsencrypt
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── rds
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── s3
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
└── variables.tf

step4:write atll the scripts for terraform to make in infa. on aws 

step5:init terraform
#terraform init

step6:plan for testing the peoject
#terraform plan

step6: terraform apply for creat the infrastucture
#terraform apply

use #terraform destroy ,for destroy the terraform
#terraform destroy

we can also use the secrate manager for secure our db password 
