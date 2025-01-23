provider "aws" {
  region = var.region
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_name              = "wordpress-vpc"
  cidr_block            = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
}
module "eks" {
  source           = "./modules/eks"
  cluster_name     = "my-eks-cluster"
  vpc_id           = module.vpc.vpc_id                # VPC ID from VPC module
  subnet_ids       = module.vpc.public_subnets        # Public Subnets from VPC module
  node_desired_size = 3
  node_max_size     = 6
  node_min_size     = 1
  instance_types    = ["t3.medium"]
  tags              = {
    Environment = "dev"
    Project     = "eks"
  }
}
module "rds" {
  source                 = "./modules/rds"
  db_instance_identifier = "wordpress-db"
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.private_subnets
  allowed_cidr_blocks    =["0.0.0.0/0"]

  db_name                = "wordpress"
  db_username            = "admin"
  db_password            = "admin@1234"

  engine                 = "mysql"
  engine_version         = "8.0.28"
  allocated_storage      = 20
  max_allocated_storage  = 100
  instance_class         = "db.t3.micro"

  backup_retention_period = 7
  backup_window           = "01:00-02:00"
  maintenance_window      = "sun:05:00-sun:06:00"

  multi_az               = true
  deletion_protection    = true

  tags = {
    Environment = "Production"
    Application = "WordPress"
  }
}
 
module "s3" {
  source             = "./modules/s3"
  region             = "us-east-1"
  bucket_name        = "wordpress-media-bucket"
  acl                = "private"
  force_destroy      = true
  versioning_enabled = true
  environment        = "dev"
}

module "elasticache" {
  source            = "./modules/elasticache"
  region            = "us-east-1"
  cluster_name      = "wordpress-memcached-cluster"
  node_type         = "cache.t3.micro"
  num_cache_nodes   = 1
  parameter_group_name = "default.memcached1.6"
  port              = 11211
  subnet_ids        = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id
  allowed_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"] # Replace with your app subnet CIDRs
  environment       = "dev"
}
module "letsencrypt" {
  source                   = "./modules/letsencrypt"
  domain_name              = "amitchavan.live"
  subject_alternative_names = ["ns-1881.awsdns-43.co.uk", "ns-178.awsdns-22.com"]
  route53_zone_id          = "Z123456789ABCDEF"
  environment              = "dev"
}
