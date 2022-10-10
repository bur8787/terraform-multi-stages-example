module "sample_app_database" {
  source = "../../modules/database"
  enable_point_in_time_recovery_dynamodb = var.enable_point_in_time_recovery_dynamodb
}