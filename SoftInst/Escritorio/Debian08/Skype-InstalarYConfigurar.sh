#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------------
#  Script de NiPeGun para instalar Skype en Debian 8
#-----------------------------------------------------

echo ""
echo "  Instalando Skype..."
echo ""
dpkg --add-architecture i386
apt-get -y update
apt-get -y install gdebi wget
mkdir /root/paquetes
cd /root/paquetes
PaqueteLibSSL=$(wget -qO- http://ftp.at.debian.org/debian/pool/main/o/openssl/ | grep libssl | grep deb8 | grep i386 | grep -v dbg | grep -v dev | grep -v udeb | sed -n 's/.*href="\([^"]*\).*/\1/p')
wget http://ftp.at.debian.org/debian/pool/main/o/openssl/$PaqueteLibSSL
gdebi /root/paquetes/$PaqueteLibSSL

wget -O skype.deb http://www.skype.com/go/getskype-linux-deb
gdebi skype.deb

# apt-get purge ".*:i386"
# dpkg --remove-architecture i386
