#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-------------------------------------------------------------------------------
#  Script de NiPeGun para enviar mensajes de Telegram desde Bash usando un bot
#-------------------------------------------------------------------------------

ColorAdvertencia="\033[1;31m"
ColorArgumentos="\033[1;32m"
FinColor="\033[0m"

CantArgsCorrectos=3
ArgsInsuficientes=65

if [ $# -ne $CantArgsCorrectos ]
  then
    echo ""
    echo -e "${ColorAdvertencia}Mal uso del script!${FinColor}"
    echo ""
    echo -e 'El uso correcto sería: '$0' '${ColorArgumentos}'[TokenDelBot] [IdDelChatDeDestino] ["Mensaje"]'${FinColor}''
    echo ""
    echo "Ejemplo:"
    echo ""
    echo ''$0' 123456789:AAAAAAAAAA_AAAAAAAAAAAAAAA_AAAAAA_A 000000000 "Mensaje de prueba"'
    echo ""
    exit $ArgsInsuficientes
  else
    wget -q --tries=10 --timeout=20 --spider https://api.telegram.org
    if [[ $? -eq 0 ]]; then
      TokenDelBot="$1"
      URL="https://api.telegram.org/bot$TokenDelBot/sendMessage"
      IdDestino="$2"
      Mensaje="$3"
      curl -s -X POST $URL -d chat_id=$IdDestino -d text="$Mensaje" > /dev/null
      echo ""
    else
      echo ""
      echo -e "${ColorAdvertencia}No se pudo enviar el mensaje porque no se pudo contactar con https://api.telegram.org${FinColor}"
      echo ""
    fi
fi

