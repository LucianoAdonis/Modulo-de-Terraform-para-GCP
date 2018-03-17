# Módulo de Terraform para GCP

### Prerrequisitos

* [Tener cuenta en GCP](https://cloud.google.com/?hl=es) - Sin una de estas dudo que se pueda hacer algo.
* [Crear el Json de autenticación en GCP](https://www.terraform.io/docs/providers/google/index.html) - Utilizado por el archivo "provider.tf".
* [Instalar el SDK de Google](https://cloud.google.com/sdk/downloads?hl=es) - Facilita la administración de recursos de GCP.
* [Instalar Terraform](https://www.terraform.io/intro/getting-started/install.html) - Instalar y ya.
* [Generar un nuevo par de claves SSH](https://cloud.google.com/compute/docs/instances/connecting-to-instance) - Estas nos permitiran acceder a las nuevas instancias creadas por SSH a traves de Terraform.

### Uso de módulos

* La llave JSON creada en GCP debe ser agregada en la misma ruta donde se encuentra "provider.tf" ya que esta es utilizada por ese archivo, para autenticarse y crear recursos.
* Definir dentro de "var.tf", el nombre de la llave JSON creada, la ID y región del proyecto.
* Desde el main.tf se especifican los modulos que quieren utilizarse dentro del directorio especificado (En este caso "modules/test1"). Se pueden dar más modificaciones pero por el momento no.
* Para crear un nuevo módulo, se crea un nuevo directorio dentro de "modules", en el cual se definirán los archivos a utilizar, para aplicar los cambios y reconocer el módulo, se define dentro del "main.tf".
* Dentro de la carpeta "Test1" se encuentra definida una instancia simple a la cual se le traspasa un script, para ser ejecutado dentro de esta. Para lograr esto, se debe especificar la región en la cual se encontrará, la ID del proyecto en el que será implementada y las demás configuraciones relacionadas con el tipo de instancia a implementar. Todo esto dentro del archivo "var.tf".
* Para lograr el traspaso del script y la ejecución de comandos mediante el "remote-exec", se debe utilizar las claves creadas en el último paso de los prerrequisitos. Ya que utilizó este procedimiento para crear las llaves, solo debería agregarse el nombre de la privada en "modules/test1/vars.tf".
* El Script que utiliza, en este caso "temp.sh" puede ser algun "yum update" o instalar Docker por ejemplo.

### Ejecución

Para descargar los plugins se debe ejecutar dentro del directorio el comando:
```
terraform init
```

Para validar los modulos especificados dentro de main.tf se aplica:
```
terraform get
```

Ya revisado todo, se aplican los cambios con:
```
terraform apply
```



