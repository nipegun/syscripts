#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------
#  Script de NiPeGun para instalar eMule como demonio en Debian 9
#  aceptando distintas configuraciones
#------------------------------------------------------------------

EXPECTED_ARGS=4
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
  then
    echo ""
    echo "--------------------------------------------------------------------------------------------"
    echo "  Mal uso del script."
    echo ""
    echo "  El uso correcto sería:"
    echo "  $0 [CarpetaDeDescargas] [CarpetaDeIncompletos] [Usuario] [Password] [AdminPassword]"
    echo ""
    echo "  Ejemplo:"
    echo "  $0 /var/tmp/amule/completos /var/tmp/amule/incompletos 12345678 debian-amule"
    echo "--------------------------------------------------------------------------------------------"
    echo ""
    exit $E_BADARGS
  else
    echo ""
    echo "Creando las carpetas para las descargas..."
    echo ""
    mkdir -p $1
    mkdir -p $2
    
    echo ""
    echo "Instalando el paquete amule-daemon..."
    echo ""
    apt-get -y install amule-daemon

    echo ""
    echo "Agregando el usuario $3..."
    echo ""
    adduser $3

    echo ""
    echo "Corriendo el comando amuled por primera vez para el usuario $3..."
    echo ""
    runuser -l $3 -c 'amuled'

    echo ""
    echo "Deteniendo el servicio amule-daemon..."
    echo ""
    service amule-daemon stop

    echo ""
    echo "Realizando cambios en la configuración..."
    echo ""
    sed -i -e 's|TempDir=/home/debian-amule/.aMule/Temp|TempDir="'$1'"|g' /home/$3/.aMule/amule.conf
    sed -i -e 's|IncomingDir=/home/debian-amule/.aMule/Incoming|IncomingDir="'$2'"|g' /home/$3/.aMule/amule.conf

    runuser -l $3 -c 'amuleweb --write-config --host=localhost --password=$4 --admin-pass=$5'
    AdminPassword=$(echo -n $5 | md5sum | cut -d ' ' -f 1)
    sed -i -e 's|AcceptExternalConnections=0|AcceptExternalConnections=1|g' /home/$3/.aMule/amule.conf
    sed -i -e 's|ECPassword=|ECPassword=$AdminPassword|g' /home/$3/.aMule/amule.conf
    sed -i '/WebServer]/{n;s/.*/Enabled=1/}' /home/$3/.aMule/amule.conf
    WebPassword=$(echo -n $4 | md5sum | cut -d ' ' -f 1)
    sed -i -e 's|^Password=|Password=$WebPassword|g' /home/$3/.aMule/amule.conf
    sed -i -e 's|AMULED_USER=""|AMULED_USER="$3"|g' /etc/default/amule-daemon

    echo ""
    echo "Iniciando el servicio amule-daemon..."
    echo ""
    service amule-daemon start

    #echo ""
    #echo "Agregando el usuario al grupo amule-daemon..."
    #echo ""
    #usermod -a -G debian-amule $3

    echo ""
    echo "--------------------------------------------------------------"
    echo "  El demonio amule ha sido instalado, configurado e inciado."
    echo ""
    echo "  Deberías poder administrarlo mediante web en la IP de"
    echo "  este ordenador seguida por :9091"
    echo ""
    echo "  Ejemplo: 192.168.0.120:9091"
    echo ""
    echo "  Nombre de usuario: transmission"
    echo "  Contraseña: $3"
    echo "---------------------------------------------------------"
    echo ""
fi

