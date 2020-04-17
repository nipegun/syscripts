#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA INSTALAR Y CONFIGURAR EL SERVIDOR DC++ UHUB
#----------------------------------------------------------------------

# Agregar el repositorio
echo "deb http://ppa.launchpad.net/tehnick/tehnick/ubuntu vivid main" > /etc/apt/sources.list.d/uhub.list

# Actualizar
apt-get update

# Instalar uHub
apt-get -y install uhub

