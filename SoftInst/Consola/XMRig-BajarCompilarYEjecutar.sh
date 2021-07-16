#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-------------------------------------------------------------------------------------------------
#  Script de NiPeGun para instalar y configurar diferentes carteras de criptomonedas en Debian10
#-------------------------------------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

DirWallet="451K8ZpJTWdLBKb5uCR1EWM5YfCUxdgxWFjYrvKSTaWpH1zdz22JDQBQeZCw7wZjRm3wqKTjnp9NKZpfyUzncXCJ24H4Xtr"
Hilos=$(dmidecode -t processor | grep ore | grep ount | cut -d ":" -f 2 | cut -d " " -f 2)

echo ""
echo -e "${ColorVerde}--------------------------------------------------${FinColor}"
echo -e "${ColorVerde}  Iniciando el script de instalación de XMRig...${FinColor}"
echo -e "${ColorVerde}--------------------------------------------------${FinColor}"
echo ""

## Comprobar si el paquete git está instalado. Si no lo está, instalarlo.
   if [[ $(dpkg-query -s git 2>/dev/null | grep installed) == "" ]]; then
     echo ""
     echo "  git no está instalado. Iniciando su instalación..."
     echo ""
     apt-get -y update
     apt-get -y install git
     echo ""
   fi

echo ""
echo "  Descargando el repositorio de XMRig..."
echo ""
rm -rf ~/xmrig/
cd ~
git clone https://github.com/xmrig/xmrig.git
cd xmrig

echo ""
echo "  Compilando..."
echo ""
mkdir build
cd build
apt-get -y install cmake
apt-get -y install libhwloc-dev
apt-get -y install libuv1-dev
apt-get -y install libssl-dev
#cmake .. -DWITH_HWLOC=OFF
cmake ..
make -j $(nproc)

echo ""
echo "  Obteniendo dirección mac de la tarjeta inalámbrica..."
echo ""
DirMACWlan0=$(ip addr show wlan0 | grep link/ether | cut -d" " -f6)
echo ""
echo "  La dirección MAC de la tarjeta inalámbrica es: $DirMACWlan0"
echo ""

echo ""
echo "  Generando un identificador de dispositivo a partir de la MAC $DirMACWlan0..."
echo ""
Dispositivo=$(echo -n $DirMACWlan0 | md5sum | cut -d" " -f1)
echo ""
echo "  El identificador del dispositivo es: $Dispositivo"
echo ""

echo ""
echo "  Ejecutando minero con identificador $Dispositivo..."
echo ""

## Con TLS
./xmrig -o pool.minexmr.com:443 --threads=$Hilos --rig-id=$Dispositivo -u $DirWallet --tls 

## Sin TLS
   #./xmrig -o pool.minexmr.com:4444 --threads=$Hilos --rig-id=$Dispositivo -u $DirWallet

#/data/data/com.termux/files/home/xmrig/build/xmrig
