locals {
  required_services = [
    // Enable IAM API
    "iam.googleapis.com",
  ]
}

# Enable the required services
resource "google_project_service" "required_services" {
  for_each = toset(local.required_services)

  service = each.key
  project = var.project_id
  # Leave API enabled on destroy
  disable_on_destroy         = false
  disable_dependent_services = false
}

locals {
  service_account_name = "${substr("suga-${provider::corefunc::str_kebab(var.suga.name)}", 0, 20)}-${var.suga.stack_id}"
}

# Create a service account for the google cloud run instance
resource "google_service_account" "service_account" {
  account_id   = local.service_account_name
  project      = var.project_id
  display_name = "${var.suga.name} service account"
  description  = "Service account which runs the ${var.suga.name}"

  depends_on = [google_project_service.required_services]
}

# Create custom role for trusted actions
resource "google_project_iam_custom_role" "trusted_actions_role" {
  count = length(var.trusted_actions) > 0 ? 1 : 0

  role_id     = "${replace(local.service_account_name, "-", "_")}_trusted_actions"
  title       = "${var.suga.name} Trusted Actions Role"
  description = "Custom role for trusted actions for ${var.suga.name}"
  permissions = var.trusted_actions
  project     = var.project_id
}

# Bind the custom role to the service account
resource "google_project_iam_member" "trusted_actions_binding" {
  count = length(var.trusted_actions) > 0 ? 1 : 0

  project = var.project_id
  role    = google_project_iam_custom_role.trusted_actions_role[0].name
  member  = "serviceAccount:${google_service_account.service_account.email}"
}