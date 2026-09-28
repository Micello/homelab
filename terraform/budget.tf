resource "aws_budgets_budget" "bucket_cost" {
  name         = "Bucket Cost"
  budget_type  = "COST"
  limit_amount = "1.0"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  billing_view_arn = "arn:aws:billing::467866782703:billingview/primary"

  metrics = [
    "UnblendedCost"
  ]

  filter_expression {
    not {
      dimensions {
        key = "RECORD_TYPE"
        values = [
          "Credit",
          "Refund"
        ]
      }
    }
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = ["sim1.micello@gmail.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = 85
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = ["sim1.micello@gmail.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "FORECASTED"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = ["sim1.micello@gmail.com"]
  }
}
