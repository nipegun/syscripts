#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA EDITAR LA CONFIGURACIÓN DE GRUB
#----------------------------------------------------------

echo ""
echo "---------------------------------------------------"
echo "  EDITANDO EL ARCHIVO DE CONFIGURACIÓN DE GRUB..."
echo "---------------------------------------------------"
echo ""
nano /etc/default/grub

echo ""
echo "----------------------------"
echo "  APLICANDO LOS CAMBIOS..."
echo "----------------------------"
echo ""
update-grub

