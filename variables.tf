# Atlas Organization ID 
variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
}
# Atlas Project Name
variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
}

# Cluster instance size name 
variable "cluster_instance_size_name" {
  type        = string
  description = "Cluster instance size name"
  default     = "M10"
}
# Atlas region
variable "atlas_region" {
  type        = string
  description = "AWS region where resources will be created"
  default     = "US_WEST_2"
}

# Atlas Project environment
variable "environment" {
  type        = string
  description = "The environment to be built"
}

