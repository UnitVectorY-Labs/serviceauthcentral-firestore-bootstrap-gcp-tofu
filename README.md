[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Work In Progress](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)](https://unitvectory-labs.github.io/uvy-labs-guide/bestpractices/status/#work-in-progress)

# serviceauthcentral-firestore-bootstrap-gcp-tofu

OpenTofu module for deploying ServiceAuthCentral Firestore Bootstrap Records

## Firestore Records

This module sets up the essential Firestore records needed to enable login functionality for ServiceAuthCentral. Specifically, it creates a client record for the issuer, which represents the system itself, with the clientId being the same as the issuer.

In addition, a record is created to authorize the initial user, granting them access to log into the administrative web portal.

Optionally, you can also create a record for a GCP Workload Identity Pool, enabling it to authenticate with ServiceAuthCentral.

## Usage

```hcl
module "serviceauthcentral_firestore_bootstrap_gcp" {
    source = "git::https://github.com/UnitVectorY-Labs/serviceauthcentral-firestore-bootstrap-gcp-tofu.git?ref=main"
    database_name = "serviceauthcentral"
    project_id = var.project_id
    sac_issuer = "https://issuer.example.com"
    authorized_user_clientid = "user:example:clientid"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_firestore_document.authorization_document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document) | resource |
| [google_firestore_document.issuer_document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document) | resource |
| [random_string.issuer_salt](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_static.created_timestamp](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_user_clientid"></a> [authorized\_user\_clientid](#input\_authorized\_user\_clientid) | The authorized user client | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the database | `string` | `"default"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project id | `string` | n/a | yes |
| <a name="input_sac_issuer"></a> [sac\_issuer](#input\_sac\_issuer) | The issuer for ServiceAuthCentral | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
