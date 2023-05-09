output "topic_names" {
  value = [for topic in google_pubsub_topic.topic : topic.name]
}