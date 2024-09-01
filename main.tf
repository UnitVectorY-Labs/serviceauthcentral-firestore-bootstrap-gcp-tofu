
# Generate a consistent timestamp for the created fields
resource "time_static" "created_timestamp" {}

# Create a random string for the issuer salt
resource "random_string" "issuer_salt" {
  length           = 32
  special          = false
}

locals {
  # ServiceAuthCentral client records have a document id of the SHA-256 hash of the clientId
  issuer_hash = sha256(var.sac_issuer)
  user_hash  = sha256(var.authorized_user_clientid)
  # ServiceAuthCentral authorization records have a document id of the SHA-256 hash of the subject and audience document ids concatenated
  authorization_hash = sha256(format("%s%s",local.user_hash, local.issuer_hash))

  # The issuer document for Firestore
  issuer_document_json = jsonencode({
    clientId      = { stringValue = var.sac_issuer }
    clientCreated = { stringValue = time_static.created_timestamp.rfc3339 }
    clientType    = { stringValue = "APPLICATION" }
    # clientSecret1 = { nullValue = null }
    # clientSecret2 = { nullValue = null }
    description   = { stringValue = "Issuer" }
    salt          = { stringValue = random_string.issuer_salt.result }
    # jwtBearer     = { arrayValue = { values = [] } }
  })

  # The authorization document for Firestore
  authorization_document_json = jsonencode({
    audience             = { stringValue = var.sac_issuer }
    subject              = { stringValue = var.authorized_user_clientid }
    authorizationCreated = { stringValue = time_static.created_timestamp.rfc3339 }
  })
}

resource "google_firestore_document" "issuer_document" {
  project     = var.project_id
  database    = var.database_name
  collection  = "clients"
  document_id = local.issuer_hash
  fields      = local.issuer_document_json
}

resource "google_firestore_document" "authorization_document" {
  project     = var.project_id
  database    = var.database_name
  collection  = "authorizations"
  document_id = local.authorization_hash
  fields      = local.authorization_document_json
}