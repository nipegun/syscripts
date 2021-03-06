#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------------------
#  SCRIPT DE NIPEGUN PARA INSTALAR Y CONFIGURAR LAS ESTADÍSTICAS WEB GOACCESS
#------------------------------------------------------------------------------

CantArgsCorrectos=2
ArgsInsuficientes=65

if [ $# -ne $CantArgsCorrectos ]
  then
    echo ""
    echo "------------------------------------------------------------------------------"
    echo "Mal uso del script."
    echo ""
    echo "El uso correcto sería: $0 [CarpetaDeLogs] [CarpetaDeStats]"
    echo ""
    echo "Ejemplo:"
    echo ' $0 /var/www/pepe.com/logs /var/www/pepe.com/_/stats'
    echo "------------------------------------------------------------------------------"
    echo ""
    exit $ArgsInsuficientes
  else
    echo ""
    echo "--------------------------------------"
    echo "  INSTALANDO Y CONFIGURANDO GOACCESS"
    echo "--------------------------------------"
    echo ""
    echo "deb http://deb.goaccess.io/ jessie main" | tee -a /etc/apt/sources.list.d/goaccess.list
    wget -O - http://deb.goaccess.io/gnugpg.key | apt-key add -
    apt-get -y update
    apt-get -y install goaccess
    sed -i -e 's|#time-format %H:%M:%S|time-format %H:%M:%S|g' /etc/goaccess.conf
    sed -i -e 's|#date-format %d/%b/%Y|date-format %d/%b/%Y|g' /etc/goaccess.conf
    sed -i -e 's|#log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"|log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"|g' /etc/goaccess.conf
    sed -i -e 's|#html-prefs {"theme":"bright","perPage":5,"layout":"horizontal","showTables":true,"visitors":{"plot":{"chartType":"bar"}}}|html-prefs {"theme":"bright","perPage":20,"layout":"vertical","showTables":true,"visitors":{"plot":{"chartType":"bar"}}}|g' /etc/goaccess.conf
    sed -i -e 's|#html-report-title My Awesome Web Stats|html-report-title Estadísticas de la Web|g' /etc/goaccess.conf
    sed -i -e 's|#daemonize false|daemonize true|g' /etc/goaccess.conf
    sed -i -e 's|ignore-crawlers false|ignore-crawlers true|g' /etc/goaccess.conf
    sed -i -e 's|ignore-panel REFERRERS|#ignore-panel REFERRERS|g' /etc/goaccess.conf
    sed -i -e 's|ignore-panel KEYPHRASES|#ignore-panel KEYPHRASES|g' /etc/goaccess.conf
    goaccess -f $1/access.log -o $2/index.html --real-time-html --daemon --pid-file=/etc/goaccess/pid.number
fi

