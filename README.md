[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Work In Progress](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)](https://unitvectory-labs.github.io/uvy-labs-guide/bestpractices/status/#work-in-progress)

# serviceauthcentral-firestore-bootstrap-gcp-tofu

OpenTofu module for deploying ServiceAuthCentral Firestore Bootstrap Records

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
<!-- END_TF_DOCS -->