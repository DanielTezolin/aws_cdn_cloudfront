variable "reagions" {
  type = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
  description = "O nome do bucket S3. Deve ser globalmente único."
  validation {
    condition = length(var.bucket_name) > 3
    error_message = "O nome do bucket deve ter pelo menos 3 caracteres."
  }
  validation {
    condition = length(var.bucket_name) < 63
    error_message = "O nome do bucket deve ter menos de 63 caracteres."
  }
  validation {
    condition = regexall("^\\S+$", var.bucket_name)
    error_message = "O nome do bucket não deve conter espaços."
  }
}

variable "bucket_acl" {
  type = string
  description = "O ACL predefinido a ser aplicado. Padrão é privado. Deve ser um dos seguintes: private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write"
  validation {
    condition = can(regexall("^(private|public-read|public-read-write|authenticated-read|aws-exec-read|bucket-owner-read|bucket-owner-full-control|log-delivery-write)$", var.bucket_acl))
    error_message = "O ACL do bucket deve ser um dos seguintes: private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write"
  }
}

variable "cdn_aliases" {
  type = list(string)
  description = "Uma lista de nomes de domínio para o CDN responder. O primeiro nome de domínio da lista será o nome de domínio principal para a distribuição."
}
