resource "aws_sqs_queue" "selectgearmotors-documents_queue" {
  name                       = "selectgearmotors-documents-queue"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  sqs_managed_sse_enabled = true
}

resource "aws_sqs_queue" "selectgearmotors-notifications_queue" {
  name                       = "selectgearmotors-notifications-queue"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  sqs_managed_sse_enabled = true
}

resource "aws_sqs_queue_policy" "selectgearmotors-documents_queue_policy" {
  queue_url = aws_sqs_queue.selectgearmotors-documents_queue.id
  policy    = data.aws_iam_policy_document.selectgearmotors-documents_queue_policy.json

}

resource "aws_sqs_queue_policy" "selectgearmotors-notifications_queue_policy" {
  queue_url = aws_sqs_queue.selectgearmotors-notifications_queue.id
  policy    = data.aws_iam_policy_document.selectgearmotors-notifications_queue_policy.json
}