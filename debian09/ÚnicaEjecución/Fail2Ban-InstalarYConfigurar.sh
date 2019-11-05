#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#---------------------------------------------------------
#  Script de NiPeGun para instalar y configurar Fail2Ban
#---------------------------------------------------------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

echo ""
echo -e "${ColorVerde}Instalando Fail2Ban...${FinColor}"
apt-get -y install fail2ban
service fail2ban stop
echo "ignoreip = 127.0.0.1" >> /etc/fail2ban/jail.d/defaults-debian.conf
echo "maxretry = 3" >> /etc/fail2ban/jail.d/defaults-debian.conf
echo "bantime = 10m" >> /etc/fail2ban/jail.d/defaults-debian.conf
echo "findtime = 5m" >> /etc/fail2ban/jail.d/defaults-debian.conf
echo "#destemail = mail@gmail.com" >> /etc/fail2ban/jail.d/defaults-debian.conf
service fail2ban start
# tail -f /var/log/fail2ban.log

