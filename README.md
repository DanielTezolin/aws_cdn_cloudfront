# aws_cdn_cloudfront
Um projeto simples em Terraform para exemplificar a criação de uma CDN na AWS usando o CloudFront e um bucket S3.

## Recursos Criados

- `aws_s3_bucket`: Cria um bucket S3 para armazenar o conteúdo estático.
- `aws_s3_bucket_acl`: Define o ACL (Access Control List) do bucket.
- `aws_cloudfront_distribution`: Cria uma distribuição do Cloudfront que usa o bucket S3 como origem.

## Variáveis de Entrada

- `reagions`: A região da AWS onde os recursos serão criados (padrão é "us-east-1").
- `bucket_name`: O nome do bucket S3. Deve ser globalmente único e ter entre 3 e 63 caracteres sem espaços.
- `bucket_acl`: O ACL predefinido a ser aplicado ao bucket S3 (padrão é "private").
- `cdn_aliases`: Uma lista de nomes de domínio para o CDN responder. O primeiro nome de domínio da lista será o nome de domínio principal para a distribuição.

## Uso

1. Certifique-se de ter o Terraform instalado em seu ambiente.
2. Crie um arquivo `.tfvars` ou forneça os valores das variáveis de entrada diretamente no comando `terraform apply`.
3. Execute o seguinte comando para criar os recursos:

```
terraform init
terraform apply -var-file="your-variables.tfvars"
```

4. Após a conclusão, você poderá acessar a distribuição do Cloudfront usando os nomes de domínio especificados na variável `cdn_aliases`.

## Observações

- Você ainda precisa configurar o certificado para os aliases que você inserir.