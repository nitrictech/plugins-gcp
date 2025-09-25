# GCP Storage Plugin

Provisions Google Cloud Storage buckets with configurable storage classes, access controls, and automatic file upload capabilities.

## Overview

This plugin creates Cloud Storage buckets with:

- Multiple storage class options for cost optimization
- Configurable access controls and permissions
- Automatic file upload from local directories
- Integration with other GCP services
- Lifecycle management support
- Regional or multi-regional deployment options

## Required Inputs

| Parameter    | Type   | Description                                                 |
| ------------ | ------ | ----------------------------------------------------------- |
| `project_id` | string | Google Cloud Project ID (e.g. `my-project-123`)             |
| `region`     | string | Google Cloud region for storage bucket (e.g. `us-central1`) |

## Optional Inputs

| Parameter       | Type   | Description                                        | Default    |
| --------------- | ------ | -------------------------------------------------- | ---------- |
| `storage_class` | string | Performance and durability tier for bucket objects | `STANDARD` |

## Storage Classes

| Class      | Use Case                   | Access Frequency | Min Storage Duration |
| ---------- | -------------------------- | ---------------- | -------------------- |
| `STANDARD` | Frequently accessed data   | Daily/weekly     | None                 |
| `NEARLINE` | Infrequently accessed data | Monthly          | 30 days              |
| `COLDLINE` | Rarely accessed data       | Quarterly        | 90 days              |
| `ARCHIVE`  | Long-term archival         | Yearly           | 365 days             |

## Prerequisites

- Enabled Cloud Storage API
- Sufficient IAM permissions to create buckets

## Usage Examples

**Note:** This example shows platform file syntax. You can configure this plugin directly in the Suga Platform Builder UI without writing YAML.

### Standard Storage for Frequent Access

```yaml
buckets:
  uploads:
    plugin: "gcp-storage-bucket"
    properties:
      project_id: "my-project-123"
      region: "us-central1"
      storage_class: "STANDARD"
```

### Archive Storage for Long-term Backup

```yaml
buckets:
  backups:
    plugin: "gcp-storage-bucket"
    properties:
      project_id: "my-project-123"
      region: "us-central1"
      storage_class: "ARCHIVE"
```

### Nearline Storage for Monthly Reports

```yaml
buckets:
  reports:
    plugin: "gcp-storage-bucket"
    properties:
      project_id: "my-project-123"
      region: "us-central1"
      storage_class: "NEARLINE"
```

## Features

- **Cost Optimization**: Choose the right storage class for your access patterns
- **Global Accessibility**: Access data from anywhere with internet connectivity
- **Automatic Upload**: Seamlessly upload files during deployment
- **Security**: Integration with GCP IAM for access control
- **Scalability**: Virtually unlimited storage capacity
- **Durability**: 99.999999999% (11 9's) annual durability

## Storage Class Selection Guide

- **STANDARD**: Web content, streaming videos, mobile apps
- **NEARLINE**: Monthly backups, data analytics workloads
- **COLDLINE**: Quarterly backups, disaster recovery
- **ARCHIVE**: Regulatory compliance, long-term preservation

## References

- [Cloud Storage Documentation](https://cloud.google.com/storage/docs)
- [Storage Classes and Pricing](https://cloud.google.com/storage/docs/storage-classes)
- [Bucket Locations](https://cloud.google.com/storage/docs/locations)
- [Cloud Storage Pricing](https://cloud.google.com/storage/pricing)
