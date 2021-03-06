#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------
#  Script de NiPeGun para enviar mail en una sola línea
#  Asegúrate de tener instalados los siguientes paquetes:
#  postfix mailutils
#----------------------------------------------------------

CantArgsEsperados=3
ArgsInsuficientes=65

ColorAdvertencia='\033[1;31m'
ColorArgumentos='\033[1;32m'
FinColor='\033[0m'

if [ $# -ne $CantArgsEsperados ]
  then
    echo ""
    echo "------------------------------------------------------------------------------"
    echo -e "${ColorAdvertencia}Mal uso del script.${FinColor} El uso correcto sería:"
    echo ""
    echo -e "EnviarMailA ${ColorArgumentos}[DirecciónDeCorreo] [Asunto] [Texto]${FinColor}"
    echo ""
    echo "Ejemplo:"
    echo ' EnviarMailA pepe@pepe.com "Recordatorio de cita" "Acuérdate que quedamos para comer"'
    echo "------------------------------------------------------------------------------"
    echo ""
    exit $ArgsInsuficientes
  else
    echo "$3" | mail -a "Content-Type: text/plain; charset=UTF-8" -s "$2" $1
fi

