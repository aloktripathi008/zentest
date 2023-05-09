terraform {
  backend "gcs" {
    bucket = "your_bucket_name"
    prefix = "pubsub/"
  }
}