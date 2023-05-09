# Define the provider
provider "google" {
  project = "<project-id>"
  region  = "<region>"
}

# Define the number of topics to create
locals {
  topic_count = 10000
}

# Create multiple Pub/Sub topics using a loop
resource "google_pubsub_topic" "topic" {
  count = local.topic_count

  name = "topic-${count.index}"
}