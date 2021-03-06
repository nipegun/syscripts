#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#--------------------------------------------------------------------
#  Script de NiPeGun para instalar y configurar UHub en Debian
#--------------------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

## Determinar la versión de Debian

   if [ -f /etc/os-release ]; then
       # Para systemd y freedesktop.org
       . /etc/os-release
       OS_NAME=$NAME
       OS_VERS=$VERSION_ID
   elif type lsb_release >/dev/null 2>&1; then
       # linuxbase.org
       OS_NAME=$(lsb_release -si)
       OS_VERS=$(lsb_release -sr)
   elif [ -f /etc/lsb-release ]; then
       # Para algunas versiones de Debian sin el comando lsb_release
       . /etc/lsb-release
       OS_NAME=$DISTRIB_ID
       OS_VERS=$DISTRIB_RELEASE
   elif [ -f /etc/debian_version ]; then
       # Para versiones viejas de Debian.
       OS_NAME=Debian
       OS_VERS=$(cat /etc/debian_version)
   else
       # Para el viejo uname (También funciona para BSD)
       OS_NAME=$(uname -s)
       OS_VERS=$(uname -r)
   fi

if [ $OS_VERS == "7" ]; then

  echo ""
  echo "-----------------------------------------------------------------------------"
  echo "  Iniciando el script de instalación de UHub para Debian 7 (Wheezy)..."
  echo "-----------------------------------------------------------------------------"
  echo ""

  echo ""
  echo "Instalación para Debian 7 todavía no preparada. Prueba instalarlo en otra versión de Debian"
  echo ""

elif [ $OS_VERS == "8" ]; then

  echo ""
  echo "-----------------------------------------------------------------------------"
  echo "  Iniciando el script de instalación de UHub para Debian 8 (Jessie)..."
  echo "-----------------------------------------------------------------------------"
  echo ""

  echo ""
  echo "Instalación para Debian 8 todavía no preparada. Prueba instalarlo en otra versión de Debian"
  echo ""

elif [ $OS_VERS == "9" ]; then

  echo ""
  echo "------------------------------------------------------------------------------"
  echo "  Iniciando el script de instalación de UHub para Debian 9 (Stretch)..."
  echo "------------------------------------------------------------------------------"
  echo ""

  echo ""
  echo "Instalación para Debian 9 todavía no preparada. Prueba instalarlo en otra versión de Debian"
  echo ""

elif [ $OS_VERS == "10" ]; then

  echo ""
  echo "------------------------------------------------------------------------------"
  echo "  Iniciando el script de instalación de UHub para Debian 10 (Buster)..."
  echo "------------------------------------------------------------------------------"
  echo ""

  apt-get -y install dialog 2> /dev/null

  menu=(dialog --timeout 5 --checklist "Elección de la arquitectura:" 22 76 16)
    opciones=(1 "Instalar desde los repos de Debian -- normalmente la 0.4 --" off
              2 "Instalar desde los binarios de Tehnick -- Mejor para Ubuntu --" off
              3 "Bajar, compilar e instalar la última versión de GitHub" on)
    choices=$("${menu[@]}" "${opciones[@]}" 2>&1 >/dev/tty)
    clear

    for choice in $choices
      do
        case $choice in

          1)
            echo ""
            echo -e "${ColorVerde}Instalando la versión disponible en los repos de Debian...${FinColor}"
            echo ""
            apt-get -y update 2> /dev/null
            apt-get -y install uhub
            echo "# uHub access control lists." > /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# Syntax: <command> [data]" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# commands:" >> /etc/uhub/users.conf
            echo "# 'user_reg'   - registered user with no particular privileges (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'user_op'    - operator, can kick or ban people (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'user_admin' - administrator, can do everything operators can, and reconfigure the hub (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'deny_nick'  - nick name that is not accepted (example; Administrator)" >> /etc/uhub/users.conf
            echo "# 'deny_ip'    - Unacceptable IP (masks can be specified as CIDR: 0.0.0.0/32 will block all IPv4)" >> /etc/uhub/users.conf
            echo "# 'ban_nick'   - banned user by nick" >> /etc/uhub/users.conf
            echo "# 'ban_cid'    - banned user by cid" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Administrator" >> /etc/uhub/users.conf
            echo "# user_admin    userA:password1" >> /etc/uhub/users.conf
            echo "# user_op       userB:password2" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# We don't want users with these names" >> /etc/uhub/users.conf
            echo "deny_nick Hub-Security" >> /etc/uhub/users.conf
            echo "deny_nick Administrator" >> /etc/uhub/users.conf
            echo "deny_nick root" >> /etc/uhub/users.conf
            echo "deny_nick admin" >> /etc/uhub/users.conf
            echo "deny_nick username" >> /etc/uhub/users.conf
            echo "deny_nick user" >> /etc/uhub/users.conf
            echo "deny_nick guest" >> /etc/uhub/users.conf
            echo "deny_nick operator" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Banned users" >> /etc/uhub/users.conf
            echo "# ban_nick H4X0R" >> /etc/uhub/users.conf
            echo "# ban_cid FOIL5EK2UDZYAXT7UIUFEKL4SEBEAJE3INJDKAY" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# ban by ip" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban by CIDR" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.0/24" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban by IP-range." >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7-10.21.44.9" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban a single IP address" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7" >> /etc/uhub/users.conf
            echo "# (which is equivalent to using):" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7/32" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Will not work, yet" >> /etc/uhub/users.conf
            echo "# nat_ip 10.0.0.0/8" >> /etc/uhub/users.conf
            echo "# nat_ip 127.0.0.0/8" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# If you have made changes to this file, you must send a HANGUP signal" >> /etc/uhub/users.conf
            echo "# to uHub so that it will re-read the configuration files." >> /etc/uhub/users.conf
            echo "# For example by invoking: 'killall -HUP uhub'" >> /etc/uhub/users.conf
            echo "Bienvenido a este Hub" > /etc/uhub/motd.txt
            openssl genrsa -out /etc/uhub/sslpriv.key 8192
            openssl req -new -x509 -nodes -sha512 -days 365 -key /etc/uhub/sslpriv.key > /etc/uhub/sslown.crt
            echo 'tls_private_key="/etc/uhub/sslpriv.key"' >> /etc/uhub/uhub.conf
            echo 'tls_certificate="/etc/uhub/sslown.crt"' >> /etc/uhub/uhub.conf
            echo 'tls_enable=yes' >> /etc/uhub/uhub.conf
            #echo 'tls_require=yes' >> /etc/uhub/uhub.conf
            uhub-passwd /etc/uhub/users.db create
            systemctl enable uhub.service
            systemctl start uhub.service

          ;;

          2)

            echo ""
            echo -e "${ColorVerde}Instalando los paquetes binarios de Tehnick...${FinColor}"
            echo ""
            apt-get -y update 2> /dev/mull
            apt-get -y install software-properties-common 2> /dev/mull
            add-apt-repository -y 'deb http://ppa.launchpad.net/tehnick/tehnick/ubuntu vivid main'
            apt-get -y update 2> /dev/mull
            apt-get -y install uhub
            uhub-passwd /etc/uhub/users.db create
            #uhub-passwd /etc/uhub/users.db add UsuarioPrueba PasswordPrueba

          ;;

          3)
            echo ""
            echo -e "${ColorVerde}Bajando, compilando e instalando la versión de GitHub...${FinColor}"
            echo ""
            apt-get -y install cmake make gcc git libsqlite3-dev libssl-dev > /dev/null
            mkdir /root/git/ 2> /dev/null
            cd /root/git/
            rm /root/git/uhub/ -R
            git clone https://github.com/janvidar/uhub.git
            cd /root/git/uhub/
            cmake .
            make
            make install
            echo "# uHub access control lists." > /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# Syntax: <command> [data]" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# commands:" >> /etc/uhub/users.conf
            echo "# 'user_reg'   - registered user with no particular privileges (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'user_op'    - operator, can kick or ban people (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'user_admin' - administrator, can do everything operators can, and reconfigure the hub (data=nick:password)" >> /etc/uhub/users.conf
            echo "# 'deny_nick'  - nick name that is not accepted (example; Administrator)" >> /etc/uhub/users.conf
            echo "# 'deny_ip'    - Unacceptable IP (masks can be specified as CIDR: 0.0.0.0/32 will block all IPv4)" >> /etc/uhub/users.conf
            echo "# 'ban_nick'   - banned user by nick" >> /etc/uhub/users.conf
            echo "# 'ban_cid'    - banned user by cid" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Administrator" >> /etc/uhub/users.conf
            echo "# user_admin    userA:password1" >> /etc/uhub/users.conf
            echo "# user_op       userB:password2" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# We don't want users with these names" >> /etc/uhub/users.conf
            echo "deny_nick Hub-Security" >> /etc/uhub/users.conf
            echo "deny_nick Administrator" >> /etc/uhub/users.conf
            echo "deny_nick root" >> /etc/uhub/users.conf
            echo "deny_nick admin" >> /etc/uhub/users.conf
            echo "deny_nick username" >> /etc/uhub/users.conf
            echo "deny_nick user" >> /etc/uhub/users.conf
            echo "deny_nick guest" >> /etc/uhub/users.conf
            echo "deny_nick operator" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Banned users" >> /etc/uhub/users.conf
            echo "# ban_nick H4X0R" >> /etc/uhub/users.conf
            echo "# ban_cid FOIL5EK2UDZYAXT7UIUFEKL4SEBEAJE3INJDKAY" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# ban by ip" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban by CIDR" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.0/24" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban by IP-range." >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7-10.21.44.9" >> /etc/uhub/users.conf
            echo "#" >> /etc/uhub/users.conf
            echo "# to ban a single IP address" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7" >> /etc/uhub/users.conf
            echo "# (which is equivalent to using):" >> /etc/uhub/users.conf
            echo "# deny_ip 10.21.44.7/32" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# Will not work, yet" >> /etc/uhub/users.conf
            echo "# nat_ip 10.0.0.0/8" >> /etc/uhub/users.conf
            echo "# nat_ip 127.0.0.0/8" >> /etc/uhub/users.conf
            echo "" >> /etc/uhub/users.conf
            echo "# If you have made changes to this file, you must send a HANGUP signal" >> /etc/uhub/users.conf
            echo "# to uHub so that it will re-read the configuration files." >> /etc/uhub/users.conf
            echo "# For example by invoking: 'killall -HUP uhub'" >> /etc/uhub/users.conf
            echo "Bienvenido a este Hub" > /etc/uhub/motd.txt
            openssl genrsa -out /etc/uhub/sslpriv.key 8192
            openssl req -new -x509 -nodes -sha512 -days 365 -key /etc/uhub/sslpriv.key > /etc/uhub/sslown.crt
            echo 'tls_private_key="/etc/uhub/sslpriv.key"' >> /etc/uhub/uhub.conf
            echo 'tls_certificate="/etc/uhub/sslown.crt"' >> /etc/uhub/uhub.conf
            echo 'tls_enable=yes' >> /etc/uhub/uhub.conf
            echo '#tls_require=yes' >> /etc/uhub/uhub.conf
            echo "[Unit]"                         > /etc/systemd/system/uhub.service
            echo "Description=uHub DC Hub"       >> /etc/systemd/system/uhub.service
            echo "After=network.target"          >> /etc/systemd/system/uhub.service
            echo ""                              >> /etc/systemd/system/uhub.service
            echo "[Service]"                     >> /etc/systemd/system/uhub.service
            echo "Type=simple"                   >> /etc/systemd/system/uhub.service
            echo "Restart=always"                >> /etc/systemd/system/uhub.service
            echo "ExecStart=/usr/local/bin/uhub" >> /etc/systemd/system/uhub.service
            echo ""                              >> /etc/systemd/system/uhub.service
            echo "[Install]"                     >> /etc/systemd/system/uhub.service
            echo "WantedBy=multi-user.target"    >> /etc/systemd/system/uhub.service
            uhub-passwd /etc/uhub/users.db create
            systemctl enable uhub.service
            systemctl start uhub.service
          ;;

        esac

  done

elif [ $OS_VERS == "11" ]; then

  echo ""
  echo "--------------------------------------------------------------------------------"
  echo "  Iniciando el script de instalación de xxxxxxxxx para Debian 11 (Bullseye)..."
  echo "--------------------------------------------------------------------------------"
  echo ""

  echo ""
  echo "Instalación para Debian 11 todavía no preparada. Prueba instalarlo en otra versión de Debian"
  echo ""

fi
