
data "confluent_flink_region" "cc_flink_region" {
  cloud = var.cc_cloud_provider
  region = var.cc_cloud_region
}

resource "confluent_flink_compute_pool" "cc_handson_pool" {
  display_name     = "standard_compute_pool"
  cloud            = data.confluent_flink_region.cc_flink_region.cloud
  region           = data.confluent_flink_region.cc_flink_region.region
  max_cfu          = 5
  environment {
    id = confluent_environment.cc_handson_env.id
  }
}
