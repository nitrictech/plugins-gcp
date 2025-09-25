# GCP Service Account Plugin

Creates and manages Google Cloud IAM service accounts with customizable permissions for secure resource access.

## Overview

This plugin provisions IAM service accounts with:

- Fine-grained permission management via trusted actions
- Automatic key generation and rotation support
- Integration with other GCP services
- Principle of least privilege enforcement
- Support for custom IAM roles and predefined roles

## Required Inputs

| Parameter    | Type   | Description             |
| ------------ | ------ | ----------------------- |
| `project_id` | string | Google Cloud Project ID |

## Optional Inputs

| Parameter         | Type         | Description                                                                                                                                 | Default                                                            |
| ----------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `trusted_actions` | list(string) | IAM actions/roles this service account can perform (e.g. `["storage.objects.get", "storage.objects.create", "cloudsql.instances.connect"]`) | `["monitoring.timeSeries.create", "resourcemanager.projects.get"]` |

## Prerequisites

- Sufficient IAM permissions to create service accounts and assign roles
- Enabled APIs for the services the account will access

## Usage Examples

**Note:** This example shows platform file syntax. You can configure this plugin directly in the Suga Platform Builder UI without writing YAML.

### Basic Storage Access

```yaml
services:
  storage-worker:
    plugin: "gcp-cloudrun"
    identities:
      - plugin: "gcp-service-account"
        properties:
          project_id: "my-project-123"
          trusted_actions:
            - "storage.objects.get"
            - "storage.objects.create"
            - "storage.objects.delete"
```

### Full Storage and Cloud SQL Access

```yaml
services:
  backend:
    plugin: "gcp-cloudrun"
    identities:
      - plugin: "gcp-service-account"
        properties:
          project_id: "my-project-123"
          trusted_actions:
            - "roles/storage.admin"
            - "roles/cloudsql.client"
            - "secretmanager.versions.access"
```

### Read-Only Monitoring Access

```yaml
services:
  monitoring:
    plugin: "gcp-cloudrun"
    identities:
      - plugin: "gcp-service-account"
        properties:
          project_id: "my-project-123"
          trusted_actions:
            - "roles/monitoring.viewer"
            - "roles/logging.viewer"
```

## Common IAM Actions

| Action/Role                     | Description                     |
| ------------------------------- | ------------------------------- |
| `storage.objects.get`           | Read objects from Cloud Storage |
| `storage.objects.create`        | Create objects in Cloud Storage |
| `roles/storage.admin`           | Full Storage access             |
| `roles/cloudsql.client`         | Connect to Cloud SQL instances  |
| `secretmanager.versions.access` | Access Secret Manager secrets   |
| `roles/monitoring.viewer`       | View monitoring data            |

## Security Best Practices

- Use the minimum required permissions
- Regularly audit and rotate service account keys
- Use workload identity when possible for GKE workloads
- Avoid downloading service account keys when not necessary

## References

- [IAM Service Accounts Documentation](https://cloud.google.com/iam/docs/service-accounts)
- [Understanding Service Accounts](https://cloud.google.com/iam/docs/understanding-service-accounts)
- [IAM Permissions Reference](https://cloud.google.com/iam/docs/permissions-reference)
- [Service Account Best Practices](https://cloud.google.com/iam/docs/best-practices-service-accounts)
