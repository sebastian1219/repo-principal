Proyecto Principal: Infraestructura Modular con Terraform
Este repositorio implementa una arquitectura modular en AWS utilizando Terraform. La infraestructura se divide en tres módulos independientes que se integran desde repositorios privados en GitHub:

Módulo Redes: creación de VPC, subnets y security groups.

Módulo Cómputo: despliegue de instancias EC2.

Módulo Almacenamiento: configuración de buckets S3.

El flujo de despliegue se automatiza mediante GitHub Actions, garantizando reproducibilidad y control de cambios.

Estructura del repositorio
main.tf: orquestación de los módulos.
versions.tf: definición de proveedores y versión mínima de Terraform.
variables.tf: declaración de variables de entrada.
terraform.tfvars: valores concretos para el despliegue.
outputs.tf: exportación de identificadores y recursos creados.
.github/workflows/terraform.yml: pipeline CI/CD.
README.md: documentación principal.

Flujo CI/CD
El pipeline ejecuta las siguientes etapas:

Checkout del repositorio principal.

Configuración de credenciales para clonar módulos privados.

Instalación de Terraform.

Ejecución de terraform init para inicializar backend y módulos.

Validación de sintaxis con terraform validate.

Análisis de buenas prácticas con TFLint.

Análisis de seguridad con Checkov.

Ejecución de terraform plan para mostrar cambios.

Ejecución de terraform apply para aplicar la infraestructura.

Autenticación para módulos privados
Existen dos métodos para permitir que Terraform descargue los módulos privados:

Personal Access Token (PAT): crear un token en GitHub con permisos repo, guardarlo como secreto en el repositorio principal y configurarlo en el workflow.

SSH Deploy Key: generar una clave SSH, registrar la clave pública como Deploy Key en cada repositorio de módulo y guardar la clave privada como secreto en el repositorio principal.

Si los módulos no contienen información sensible, también es posible hacerlos públicos o copiarlos dentro de la carpeta modules del repositorio principal.

Outputs esperados
Al finalizar el despliegue, Terraform mostrará:

vpc_id y subnet_ids: red creada.

sg_id: security group asociado.

instance_id y instance_ip: instancia EC2 desplegada.

bucket_name y bucket_arn: almacenamiento S3 configurado.

Buenas prácticas
Mantener los módulos versionados y documentados.

Validar la sintaxis antes de aplicar cambios.

Registrar modificaciones en un archivo CHANGELOG.md.

Proteger secretos en GitHub Actions.

Revisar periódicamente permisos y credenciales.
