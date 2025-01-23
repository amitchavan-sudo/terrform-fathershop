resource "aws_security_group" "elasticache_sg" {
  name        = "${var.cluster_name}-sg"
  description = "Security group for Elasticache Memcached"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.cluster_name}-sg"
    Environment = var.environment
  }
}


resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "${var.cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.cluster_name}-subnet-group"
  }
}


resource "aws_elasticache_cluster" "elasticache_cluster" {
  cluster_id           = var.cluster_name
  engine               = "memcached"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = [aws_security_group.elasticache_sg.id]

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}

