#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#----------------------------------------------------------------------------
#  Script de NiPeGun para crear los alias de los nipe-scripts para Debian 9
#----------------------------------------------------------------------------

ColorVerde="\033[1;32m"
FinColor="\033[0m"

echo ""
echo -e "${ColorVerde}Creando alias para los nipe-scripts...${FinColor}"
echo ""

ln -s /root/scripts/nipe-scripts/debian09/externos/VelocidadDeInternet              /root/scripts/nipe-scripts/vdi

ln -s /root/scripts/nipe-scripts/debian09/APagarSistemaOperativo                    /root/scripts/nipe-scripts/apso
ln -s /root/scripts/nipe-scripts/debian09/AbrirMidnightCommander                    /root/scripts/nipe-scripts/amc
ln -s /root/scripts/nipe-scripts/debian09/ActualizarSistemaOperativo                /root/scripts/nipe-scripts/aso
ln -s /root/scripts/nipe-scripts/debian09/ActualizarSistemaOperativoYApagar         /root/scripts/nipe-scripts/asoya
ln -s /root/scripts/nipe-scripts/debian09/ActualizarSistemaOperativoYReiniciar      /root/scripts/nipe-scripts/asoyr
ln -s /root/scripts/nipe-scripts/debian09/ADministrarUsuariosDElSERvidorCALibre     /root/scripts/nipe-scripts/adudelsercal
ln -s /root/scripts/nipe-scripts/debian09/AgregarAlMailElUsuario                    /root/scripts/nipe-scripts/aameu
ln -s /root/scripts/nipe-scripts/debian09/BloquearTráficoDeTORConIPTables           /root/scripts/nipe-scripts/btdtorcipt
ln -s /root/scripts/nipe-scripts/debian09/BorrarArchivosDSStore                     /root/scripts/nipe-scripts/badss
ln -s /root/scripts/nipe-scripts/debian09/BorrarArchivosPuntoGuiónBajo              /root/scripts/nipe-scripts/bapgb
ln -s /root/scripts/nipe-scripts/debian09/BorrarArchivosZoneIdentifier              /root/scripts/nipe-scripts/bazi
ln -s /root/scripts/nipe-scripts/debian09/BorrarKernelsViejos                       /root/scripts/nipe-scripts/bkv
ln -s /root/scripts/nipe-scripts/debian09/BorrarTAGsMP3                             /root/scripts/nipe-scripts/btagmp3
ln -s /root/scripts/nipe-scripts/debian09/BorrarUsuarioYHome                        /root/scripts/nipe-scripts/buyh
ln -s /root/scripts/nipe-scripts/debian09/BuscarArchivoEnElSistema                  /root/scripts/nipe-scripts/baees
ln -s /root/scripts/nipe-scripts/debian09/BuscarCarpetaEnElSistema                  /root/scripts/nipe-scripts/bcees
ln -s /root/scripts/nipe-scripts/debian09/BuscarMódulosCargables                    /root/scripts/nipe-scripts/bmc
ln -s /root/scripts/nipe-scripts/debian09/BuscarTextoEnArchivos                     /root/scripts/nipe-scripts/btea
ln -s /root/scripts/nipe-scripts/debian09/BuscarTextoEnArchivosDeSistema            /root/scripts/nipe-scripts/bteads
ln -s /root/scripts/nipe-scripts/debian09/BuscarTextoEnNombreDeArchivos             /root/scripts/nipe-scripts/btenda
ln -s /root/scripts/nipe-scripts/debian09/BuscarYReemplazarTextoEnArchivosDeSistema /root/scripts/nipe-scripts/byrteads
ln -s /root/scripts/nipe-scripts/debian09/CambiarNombreDeUsuario                    /root/scripts/nipe-scripts/cndu
ln -s /root/scripts/nipe-scripts/debian09/CompilarEInstalarElÚltimoKernelEstable    /root/scripts/nipe-scripts/ceieuke
ln -s /root/scripts/nipe-scripts/debian09/ComprobarSSD                              /root/scripts/nipe-scripts/cssd
ln -s /root/scripts/nipe-scripts/debian09/CrearBaseDeDatosYUsuario                  /root/scripts/nipe-scripts/cbddyu
ln -s /root/scripts/nipe-scripts/debian09/DejarSóloElKernelMásReciente              /root/scripts/nipe-scripts/dsekmr
ln -s /root/scripts/nipe-scripts/debian09/EditarGRUB                                /root/scripts/nipe-scripts/egrub
ln -s /root/scripts/nipe-scripts/debian09/EditarHAPROXY                             /root/scripts/nipe-scripts/ehaproxy
ln -s /root/scripts/nipe-scripts/debian09/EditarPCIPASSTHROUGH                      /root/scripts/nipe-scripts/epcipassthrough
ln -s /root/scripts/nipe-scripts/debian09/EditarSAMBA                               /root/scripts/nipe-scripts/esamba
ln -s /root/scripts/nipe-scripts/debian09/EditarTRANSMISSION                        /root/scripts/nipe-scripts/etransmission
ln -s /root/scripts/nipe-scripts/debian09/EjecutarComo                              /root/scripts/nipe-scripts/ec
ln -s /root/scripts/nipe-scripts/debian09/EnviarMailA                               /root/scripts/nipe-scripts/ema
ln -s /root/scripts/nipe-scripts/debian09/ExportarBaseDeDatos                       /root/scripts/nipe-scripts/ebdd
ln -s /root/scripts/nipe-scripts/debian09/ExtraerSubtítuloDeMKV                     /root/scripts/nipe-scripts/esdmkv
ln -s /root/scripts/nipe-scripts/debian09/Grupos                                    /root/scripts/nipe-scripts/g
ln -s /root/scripts/nipe-scripts/debian09/HardwareInfo                              /root/scripts/nipe-scripts/hi
ln -s /root/scripts/nipe-scripts/debian09/HardwareInfoGráfica                       /root/scripts/nipe-scripts/higraf
ln -s /root/scripts/nipe-scripts/debian09/HardwareInfoProcesador                    /root/scripts/nipe-scripts/hiproc
ln -s /root/scripts/nipe-scripts/debian09/HardwareInfoRAM                           /root/scripts/nipe-scripts/hiram
ln -s /root/scripts/nipe-scripts/debian09/HardwareInfoRed                           /root/scripts/nipe-scripts/hired
ln -s /root/scripts/nipe-scripts/debian09/ImportarBaseDeDatos                       /root/scripts/nipe-scripts/ibdd
ln -s /root/scripts/nipe-scripts/debian09/IMPrimir                                  /root/scripts/nipe-scripts/imp
ln -s /root/scripts/nipe-scripts/debian09/IMPrimirArchivo                           /root/scripts/nipe-scripts/impa
ln -s /root/scripts/nipe-scripts/debian09/InfoNodoLitecoin                          /root/scripts/nipe-scripts/inl
ln -s /root/scripts/nipe-scripts/debian09/InfoShell                                 /root/scripts/nipe-scripts/is
ln -s /root/scripts/nipe-scripts/debian09/LanzarEscritorio                          /root/scripts/nipe-scripts/le
ln -s /root/scripts/nipe-scripts/debian09/ListarNodosTORQueEntran                   /root/scripts/nipe-scripts/lntorqe
ln -s /root/scripts/nipe-scripts/debian09/MonitorizarLog                            /root/scripts/nipe-scripts/ml
ln -s /root/scripts/nipe-scripts/debian09/MostrarAparatosConectadosAlRouterDebian   /root/scripts/nipe-scripts/macard
ln -s /root/scripts/nipe-scripts/debian09/MostrarAparatosConectadosEnLaInterfaz     /root/scripts/nipe-scripts/maceli
ln -s /root/scripts/nipe-scripts/debian09/MostrarContenidoDelPaquete                /root/scripts/nipe-scripts/mcdp
ln -s /root/scripts/nipe-scripts/debian09/MostrarIPLAN                              /root/scripts/nipe-scripts/miplan
ln -s /root/scripts/nipe-scripts/debian09/MostrarIPWAN                              /root/scripts/nipe-scripts/mipwan
ln -s /root/scripts/nipe-scripts/debian09/MostrarKernelsInstalados                  /root/scripts/nipe-scripts/mki
ln -s /root/scripts/nipe-scripts/debian09/MostrarMódulosCargados                    /root/scripts/nipe-scripts/mmc
ln -s /root/scripts/nipe-scripts/debian09/MostrarReglasIPTablesActivas              /root/scripts/nipe-scripts/mripta
ln -s /root/scripts/nipe-scripts/debian09/MostrarSetsIPSet                          /root/scripts/nipe-scripts/msips
ln -s /root/scripts/nipe-scripts/debian09/MostrarUsuariosDelGrupo                   /root/scripts/nipe-scripts/mudg
ln -s /root/scripts/nipe-scripts/debian09/MostrarVelocidadDeCargaDeLaWeb            /root/scripts/nipe-scripts/mvdcdlw
ln -s /root/scripts/nipe-scripts/debian09/MostrarVersiónDeDebian                    /root/scripts/nipe-scripts/mvdd
ln -s /root/scripts/nipe-scripts/debian09/NotificarFalloDeDisco                     /root/scripts/nipe-scripts/nfdd
ln -s /root/scripts/nipe-scripts/debian09/NuevaWebVarWWW                            /root/scripts/nipe-scripts/nwvwww
ln -s /root/scripts/nipe-scripts/debian09/ProcesosCorriendo                         /root/scripts/nipe-scripts/pc
ln -s /root/scripts/nipe-scripts/debian09/ProcesosCorriendoEnÁrbol                  /root/scripts/nipe-scripts/pcea
ln -s /root/scripts/nipe-scripts/debian09/PuertosAbiertos                           /root/scripts/nipe-scripts/pa
ln -s /root/scripts/nipe-scripts/debian09/QuéInstalóElPaquete                       /root/scripts/nipe-scripts/qiep
ln -s /root/scripts/nipe-scripts/debian09/ReiniciarSistemaOperativo                 /root/scripts/nipe-scripts/rso
ln -s /root/scripts/nipe-scripts/debian09/RepararPermisosVarWWW                     /root/scripts/nipe-scripts/rpvwww
ln -s /root/scripts/nipe-scripts/debian09/RetenerKernels                            /root/scripts/nipe-scripts/rk
ln -s /root/scripts/nipe-scripts/debian09/RPMDeDisco                                /root/scripts/nipe-scripts/rpmdd
ln -s /root/scripts/nipe-scripts/debian09/ServiciosEnEJecución                      /root/scripts/nipe-scripts/seej
ln -s /root/scripts/nipe-scripts/debian09/SINcronizarNiPeScripts                    /root/scripts/nipe-scripts/sinnps
ln -s /root/scripts/nipe-scripts/debian09/TelegramIT                                /root/scripts/nipe-scripts/tit
ln -s /root/scripts/nipe-scripts/debian09/TelegramITFile                            /root/scripts/nipe-scripts/titf
ln -s /root/scripts/nipe-scripts/debian09/TRIM                                      /root/scripts/nipe-scripts/trim
ln -s /root/scripts/nipe-scripts/debian09/UsuarioNuevoConShell                      /root/scripts/nipe-scripts/uncs
ln -s /root/scripts/nipe-scripts/debian09/UsuarioNuevoSinShell                      /root/scripts/nipe-scripts/unss
ln -s /root/scripts/nipe-scripts/debian09/Usuarios                                  /root/scripts/nipe-scripts/u
ln -s /root/scripts/nipe-scripts/debian09/VelocidadDeDiscoDeSistema                 /root/scripts/nipe-scripts/vddds
ln -s /root/scripts/nipe-scripts/debian09/VerEstadoDeServicio                       /root/scripts/nipe-scripts/veds
ln -s /root/scripts/nipe-scripts/debian09/VersiónDeDebian                           /root/scripts/nipe-scripts/vdd
ln -s /root/scripts/nipe-scripts/debian09/VerLogEnTiempoReal                        /root/scripts/nipe-scripts/vletr
ln -s /root/scripts/nipe-scripts/debian09/WinDir                                    /root/scripts/nipe-scripts/wd

ln -s /root/scripts/nipe-scripts/debian09/router/EditarDHCP                /root/scripts/nipe-scripts/edhcp
ln -s /root/scripts/nipe-scripts/debian09/router/EditarHOSTAPD             /root/scripts/nipe-scripts/ehostapd
ln -s /root/scripts/nipe-scripts/debian09/router/MostrarAparatosConectados /root/scripts/nipe-scripts/mac
ln -s /root/scripts/nipe-scripts/debian09/router/EditarOpenVPN             /root/scripts/nipe-scripts/eovpn

echo ""
echo -e "${ColorVerde}Alias creados. Deberías poder ejecutar los nipe-scripts escribiendo el nombre de su alias.${FinColor}"
echo ""
