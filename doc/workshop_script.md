<p align="center" width="100%">
    <img width="15%" src="images/forotecnoloxico.png">
</p>

Workshop Foro Tecnolóxico 2021
==============================

### 1 Presentación

[Seresco](https://seresco.es/) es una compañía española especializada en soluciones de software y servicios en Tecnología de la Información y Comunicación (TIC). Fundada en 1969 en Oviedo, donde mantiene su sede central, en la actualidad cuenta con centros de servicios en Madrid, Barcelona y Vigo, así como con sucursales internacionales en Portugal, Ecuador, Colombia, Bolivia y Costa Rica.

La compañía atesora 50 años de experiencia en la prestación de servicios en las áreas de administración de personal y de nómina, transformación digital, cartografía y catastro, infraestructuras y servicios de IT y desarrollo de software.

* Qué vamos a hacer en este Workshop

Este workshop del foro tecnológico 2021 no está pensado para usuarios avanzados de las tecnologías que aquí veremos, simplemente es una introducción para entender de forma muy sencilla ciertos conceptos que utilizamos en el trabajo que realizamos diariamente. No profundizaremos en aspectos técnicos más allá de los necesarios para este workshop, ya que a nivel de programación hay muchos tutoriales paso a paso sobre cómo utilizar cualquiera de las tecnologías que veremos, incluso un tutorial realizado por los creadores de este workshop quedará disponible para su consulta y descarga por parte de los asistentes.

* Usaremos Git/GitHub, Docker, Broker mqtt, JS y Python ...

### 2 Requisitos Previos

* VirtualBox instalado
* Imagen de máquina virtual Ubuntu 18.04

### 3 Control de versiones: Git

* Qué es Git

`Git` es una herramienta que realiza la función del control de versiones de código de forma distribuida. Los Sistemas de Control de Versiones pueden ser Centralizados (VCS), como por ejemplo `Subversion`, en la que se ha confiado para albergar el histórico de revisión de versiones en un punto centralizado, lo cual puede llegar a suponer una merma de trabajo si perdemos la conectividad de la red.

Los Sistemas de Control de Versiones Distribuidos (DVCS) salvan este problema. Algunos ejemplos de sistemas distribuidos, aparte de `Git`, son `Mercurial`, `Bazaar` o `Darcs`. En este tipo de herramientas, los clientes replican completamente el repositorio en máquina local.

* Diferencia entre Git y GitHub

`GitHub` es un repositorio que ofrece un grupo de servicios que facilitan el uso de `Git`, como por ejemplo hosting de proyectos, facilidades de colaboración, reviews de código, perfiles personales, pull requests, issues, etc.

> #### Clonar el proyecto
Tenemos los archivos de configuración y la documentación del taller en un repositorio público en Github.

Podemos clonarlo en el servidor local con:
```bash
git clone https://github.com/Ciges/levantate-y-anda.git
```

Una mejor alternativa sería hacer un fork del repositorio en nuestro usuario de GitHub, configurar el acceso por SSH para acceder desde nuestra máquina virtual y poder hacer modificaciones cómodamente con control de versione en GitHub :-)

### 4 Docker

* Qué es Docker

Es muy probable que, de una u otra forma, hayas escuchado hablar de `Docker` en algún contexto: En una conferencia, en boca de algún compañero, en la facultad...
Esta tecnología está relacionada con el área de sistemas, con los entornos en que se ejecutan las aplicaciones de software. El motivo de traerlo a este workshop es para sacar partido de una de las características que han hecho tan exitosa y extendida a esta herramienta: la facilidad de crear __entornos de trabajo__. De otro modo este proceso requiere de instalaciones, configuraciones y un proceso más complejo.

La idea detrás de docker es crear CONTENDORES ligeros y portables para las aplicaciones de software y que van a poder ejecutarse en cualquuier máquina (con Docker instalado previamente) independientemente del Sistema.

La comunidad Docker de open source trabaja para mejorar estas tecnologías y beneficiar a todos los usuarios de forma gratuita.

Docker ya está instalado

* Diferencia con la máquina virtual

Realmente el concepto es algo similar, aunque en esencia un contenedor no es lo mismo que una máquina virtual. Un contenedor es más ligero, ya que mientras que a una máquina virtual es necesario instalarle un sistema operativo para funcionar, un contenedor de Docker funciona utilizando el sistema operativo que tiene la máquina en la que se ejecuta el contenedor.

Docker toma los recursos más básicos, que no cambian de un ordenador a otro del sistema operativo de la máquina en la que se ejecuta. Y los aspectos más específicos del sistema que pueden dar más problemas a la hora de llevar el software de un lado a otro, se meten en el interior del contenedor.

* Ventajas de uso

Docker está diseñada para beneficiar a desarrolladores, testers, administradores de sistemas.

Modularidad, El enfoque Docker para la creación de contenedores se centra en la capacidad de tomar una parte de una aplicación, para actualizarla o repararla, sin necesidad de tomar la aplicación completa

Capas, Cada archivo de imagen de Docker se compone de una serie de capas. Estas capas se combinan en una sola imagen. Una capa se crea cuando la imagen cambia. Cada vez que un usuario especifica un comando, como ejecutar o copiar, se crea una nueva capa. Docker reutiliza estas capas para construir nuevos contenedores, lo cual hace mucho más rápido el proceso de construcción.

Restauración, Probablemente la mejor parte de la creación de capas es la capacidad de restaurar. Toda imagen tiene capas. La capacidad de restaurar es increiblemente rápida.

Rápida implementación, Los contenedores basados en Docker pueden reducir el tiempo de implementación a segundos. Al crear un contenedor para cada proceso, puede compartir rápidamente los procesos similares con nuevas aplicaciones.

* Contenedor

* Imagen

* Ejecutar hola-mundo container

* Portainer

Herramienta ligera y open-source de gestión de contenedores sobre Docker.
Ofrece una interfazgráfica para gestionar eñ host Docker sobre cualquier navegador.

Aprovechamos para visitar el repositorio de imagenes [Docker Hub](https://hub.docker.com/r/portainer/portainer) y ver la diferentes versiones disponibles de esta herramienta. Elegimos como versión a instalar `:latest`.

```
docker run -d --name portainer -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer:latest
```

Accederemos con cualquier navegador en la dirección `localhost:9000` (Recordad abrir el puerto en la máquina virtual)

Es intereante que este contenedor se pueda iniciar cada vez que se arranca la máquina virtual. Para ello deberemos añadir `---restart always`.

### 5 Tarea

* Iniciar la máquina Virtual (Máquina Virtual de test Ubuntu 18.04 - con Docker)

![iniciar máquina virtual](images/iniciar_maquina_virtual.png?raw=true "Iniciar la máquina virtual")

* Comados básicos de Docker

> #### Configurar el Broker -> mosquitto.conf

Usaremos como Broker mosquitto

Creamos el archivo `mosquitto.conf`.

```conf
listener 1883 0.0.0.0
allow_anonymous
```

> #### Iniciar Broker 

Ejecutamos...

```bash
docker run --rm --name moskito -it -p 1883:1883 -v $(pwd)/mosquitto.conf:/mosquitto/config/mosquitto.conf eclipse-mosquitto
```

**docker run** Inicializa el contenedor

**--rm** Elimina el contenedor cuando se para

**--name** Asigna nombre al contenedor, en este caso `moskito`

**-it** `-i` Interactivo, conserva STDIN abierto y `-t` pseudo-TTY. Quiere decir que queremos tanto el input como el output de la máquina, para así poder usarla como un terminal.

**-p** Puertos del contenedor y del host

**-v** Volumen, el contenedor usa el archivo local `mosquitto.conf` de la ubicación del proyecto `$(pwd)` para su configuración

**eclipse-mosquitto** Imagen del broker de mosquitto


> #### Test básico

Terminal 2 [TTY2] 
```
$ mosquito_sub -t "test"
```

Terminal 3 [TTY3] 
```
$ mosquito_pub -t "test" -m "mensaje enviado"
```

> ### Test con python en un solo script

Crearemos en la terminal 2 [TTY2] el fichero `subscribe_publica.py`.

```python
import sys	# El módulo provee acceso a funciones y objetos mantenidos por del intérprete.
import time	# El módulo time ofrece soporte para fechas y horas. Aqui solo usaremos detener el script con sleep() y poder ver los efectos.
import paho.mqtt.client as paho # Importamos el módulo para mqtt

broker = "127.0.0.1" # IP del broker

def on_message(client, userdata, message):
    time.sleep(1)
    print("received message =",str(message.payload.decode("utf-8")))

client = paho.Client("seresco_ws")
client.on_message=on_message
print("connecting to broker ", broker)
client.connect(broker)# connectando con el broker
client.loop_start() # Iniciamos bucle para procesar los mensajes recibidos
print("subscribing ")
client.subscribe("casa/salon/bombilla-01") # realizando la subscripción al tiopic 'casa/salon/bombilla-01'
time.sleep(2)
print("publishing ")
client.publish("casa/salon/bombilla-01","on") # Publicando indormacion en le topic 'casa/salon/bombilla-01'
time.sleep(4)
client.disconnect() # Desconectamos
client.loop_stop() # Detenemos el bucle

sys.exit(0) # Terminamos la ejecución del script devolviendo un valor (en Unix/Linux esto se considera una muy buena práctica ya que permite encadenar comandos en función de si terminaron bien, retornando 0 o si tuvieron algún problema, un valor diferente a 0).
```

> ### Test con python usando generador aleatorio de datos

Crearemos en la terminal 2 [TTY2] el fichero `subscribe.py`.

```python
import sys
import paho.mqtt.client as mqtt

# callback cuando el cleinte recive respuesta CONNACK desde el servidor
def on_connect(client, userdata, flags, rc):
        print("Connected with code " + str(rc))

        # subscribiendose al topic...
        # client.subscribe("$SYS/#")
        client.subscribe("casa/salon/#")

# callback cuando se recibe un mensaje desde el servidor
def on_message(client, userdata, msg):
        # print(msg.topic + " -> " + str(msg.payload))
        print(str(msg.payload.decode("utf-8")))

def main():
        client = mqtt.Client()
        client.on_connect = on_connect
        client.on_message = on_message

        client.connect("127.0.0.1", 1883, 60)

        client.loop_forever()


if __name__ == '__main__':
        main()


sys.exit(0)
```

Crearemos en la terminal 3 [TTY3] el fichero `publica.py`.

```python
import sys
import time
from random import randrange
import paho.mqtt.client as mqtt

def main():
        client = mqtt.Client()

        client.connect("127.0.0.1", 1883, 60)
        # client.loop_forever()
		
        while True:
                temp = str(randrange(4, 25, 1))
                hum = str(randrange(70, 100, 1))
                client.publish("casa/cocina", "{'temperatura':'" + temp  + "','humedad':'" + hum  + "'}")
                time.sleep(1)

if __name__ == '__main__':
        main()

sys.exit(0)
```