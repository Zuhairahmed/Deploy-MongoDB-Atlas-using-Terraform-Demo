# Create a Project
resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username = "galaxy-read"
  password = random_password.db-user-password.result
  project_id = mongodbatlas_project.atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "read"
    database_name = "${var.atlas_project_name}-db"
  }
}

# Create a Database Password
resource "random_password" "db-user-password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "mongodbatlas_cluster" "atlas-cluster" {
  project_id = mongodbatlas_project.atlas-project.id
  name = "${var.atlas_project_name}-${var.environment}-cluster"
  num_shards = 1
  replication_factor = 3
  cloud_backup = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version = "6.0"
  
  provider_name = "AWS"
  disk_size_gb = 40
  provider_instance_size_name = var.cluster_instance_size_name
  provider_region_name = var.atlas_region
}

