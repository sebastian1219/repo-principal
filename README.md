\# Repo Principal - Infraestructura AWS



Este repositorio actúa como \*\*controlador central\*\* para orquestar los módulos de Terraform de \*\*Redes\*\*, \*\*Cómputo\*\* y \*\*Almacenamiento\*\*.  

Todo el código está diseñado siguiendo buenas prácticas de modularización, documentación y versionado semántico.



\---



\## 📂 Estructura del repositorio



repo-principal/

├── main.tf              # Orquesta los módulos externos

├── variables.tf         # Variables globales requeridas

├── outputs.tf           # Outputs de alto nivel

├── versions.tf          # Versiones de Terraform y proveedores

├── README.md            # Documentación general

├── CHANGELOG.md         # Registro de cambios

├── .gitignore           # Ignorar archivos sensibles

├── examples/README.md   # Ejemplos prácticos de uso

└── .github/workflows/ci-cd.yml  # Pipeline CI/CD



\---



\## 📄 Explicación de los scripts



\### \*\*main.tf\*\*

\- Contiene la integración de los módulos externos:

&#x20; - \*\*Redes\*\*: VPC, subnets y security groups.

&#x20; - \*\*Cómputo\*\*: Instancias EC2.

&#x20; - \*\*Almacenamiento\*\*: Buckets S3.

\- Cada módulo se invoca desde su repositorio GitHub correspondiente:

&#x20; - Redes → \[Módulo Redes](https://github.com/sebastian1219/M-dulo-Redes.git)  

&#x20; - Cómputo → \[Módulo Cómputo](https://github.com/sebastian1219/M-dulo-C-mputo-.git)  

&#x20; - Almacenamiento → \[Módulo Almacenamiento](https://github.com/sebastian1219/M-dulo-Almacenamiento-.git)



\### \*\*variables.tf\*\*

\- Define las variables globales necesarias para el despliegue.

\- No incluye valores por defecto, lo que obliga a definirlas en `terraform.tfvars` o en la línea de comandos.

\- Ejemplo de variables:

&#x20; - `vpc\_cidr` → CIDR block de la VPC.

&#x20; - `bucket\_name` → Nombre del bucket S3.

&#x20; - `instance\_type` → Tipo de instancia EC2.

&#x20; - `ami\_id` → AMI para la instancia EC2.



\### \*\*outputs.tf\*\*

\- Expone los resultados clave del despliegue:

&#x20; - `vpc\_id` → ID de la VPC creada.

&#x20; - `instance\_ip` → IP pública de la instancia EC2.

&#x20; - `bucket\_name` → Nombre del bucket S3.



\### \*\*versions.tf\*\*

\- Define la versión mínima de Terraform y los proveedores requeridos.

\- En este caso:

&#x20; - Terraform `>= 1.5.0`

&#x20; - AWS Provider `\~> 5.0`



\### \*\*CHANGELOG.md\*\*

\- Documenta los cambios realizados en cada versión del proyecto.

\- Sigue el formato semántico (MAJOR.MINOR.PATCH).


Explicación paso a paso
Checkout → Descarga el código del repo.

Setup Terraform → Instala la versión requerida.

Init → Inicializa el backend y proveedores.

Validate → Revisa sintaxis y estructura.

TFLint → Aplica buenas prácticas de estilo.

Checkov → Escanea seguridad y compliance.

Plan → Genera plan de ejecución en PR (no aplica cambios).

Apply → Aplica cambios automáticamente en main.

🚀 Flujo de trabajo en acción
Cuando haces un pull request, el workflow corre hasta terraform plan → así validas antes de aplicar.

Cuando haces push a main, el workflow corre hasta terraform apply → despliega la infraestructura usando tus módulos.


