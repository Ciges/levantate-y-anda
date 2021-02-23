## 1.  Importación de la máquina virtual
* Instalar [VirtualBox](https://www.virtualbox.org/)
* Descargar la imagen de la máquina virtual Ubuntu para VirtualBox desde [este enlace](https://mega.nz/fm/ZK4AWaIQ) e [importarla](https://descargarmaquinasvirtuales.com/instalar-una-maquina-virtual-en-virtualbox/)
* Deberíamos tener en nuestro virtualbox una nueva máquina disponible *"Ubuntu Server 1804 con docker"*
* Esta máquina virtual tiene la distribución de Linux instalada Ubuntu Server 18, en la cual realizaremos la instalación y configuración del software usado en este taller.
* El usuario y contraseña para acceder a la máquina es *vmtest* / *vmtest01*
* Usaremos [GitHub](https://github.com/), sería interesante que cada paritcipante tenga o cree una cuenta para tener su propia copia del código y configuraciones
* Instalación del software [mqtt-explorer](http://mqtt-explorer.com/)


## 2. Clonación del repositorio de GitHub con la configuración

Tenemos los archivos de configuración y la documentación del taller en un repositorio público en Github.

Podemos clonarlo en el servidor local con:
```bash
git clone https://github.com/Ciges/levantate-y-anda.git
```

Una mejor alternativa sería hacer un fork del repositorio en nuestro usuario de GitHub, configurar el acceso por SSH para acceder desde nuestra máquina virtual y poder hacer modificaciones cómodamente con control de versione en GitHub :-)


## 3.  Contenedor Servidor de mensajería con Mosquitto

Servidor
```bash
cd docker-mosquitto
docker pull eclipse-mosquitto
docker run --name mosquitto -it -d --network host --mount type=bind,source="$PWD/mosquitto",target=/mosquitto eclipse-mosquitto
```
```bash
docker exec -it mosquitto sh
```

Cliente
```bash
mosquitto_sub -t "noticias"
mosquitto_pub -t "noticias" -m "El test de mqtt broker en docker ha sido un exito"
```

Un artículo interesante con una configuración algo más completa es ["Running the eclipse-mosquitto MQTT Broker in a docker container"](https://blog.feabhas.com/2020/02/running-the-eclipse-mosquitto-mqtt-broker-in-a-docker-container/) de Feabhas

* Cambio de la configuración para usar websockets


## 4. Creación del escenario de prueba

```bash
apt install python3-paho-mqtt
cd levantate-y-anda/mqtt-panel/
./test-messages.py
```

Descargamos [mqtt-panel](https://github.com/Ciges/levantate-y-anda/tree/main/mqtt-panel) en nuestro equipo local y cargamos la web 'mqtt-panel/index.html'


## 5.  Contenedor con Apache y PHP

```bash
cd levantate-y-anda/docker-apache-php
docker build -t apache-php74 .
docker run -p 80:80 apache-php74
```