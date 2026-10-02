# Terraform2 – Infraestructura base en Azure

Práctica de Terraform que despliega en Azure:

- Resource Group
- Virtual Network
- Subnets (`web`, `app`) creadas con `for_each`
- Network Security Group (permite HTTPS 443) asociado a cada subnet

## Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.13.0
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- Suscripción de Azure

## Uso

```bash
az login
cp terraform.tfvars.example terraform.tfvars   # edita tus valores
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

Para eliminar todo: `terraform destroy`.

## Variables principales

| Variable | Descripción | Default |
|---|---|---|
| `project_name` | Nombre del proyecto (5-20 caracteres) | – |
| `environment` | `dev`, `qa` o `prod` | – |
| `location` | Región de Azure | `mexicocentral` |
| `vnet_address_space` | Rango CIDR de la VNet | `["10.0.0.0/16"]` |
| `subnets` | Mapa de subnets | `web`, `app` |
| `subscription_id` | ID de suscripción (sensible) | – |
