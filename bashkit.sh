#!/bin/bash

# Bash Kit - Script Menu.
# By Ludovic Tual - @2015
# ludovic.tual@gmail.com

#+--------------------------------------+
#| variables 				|
#+--------------------------------------+

## VERSION BASHKIT :
version=v0.4c RC1
## COLORS VARIABLES
VERT="\\033[1;32m"
VERT_BLINK="\\033[5;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROUGE_BLINK="\\033[5;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
JAUNE="\\033[1;33m"
CYAN="\\033[1;36m"
NOIR_B='\e[40m'  # Black - Backgroun
VIOLET='\e[4;35m' # Purple
ORANGE="\e[38;5;208m"

# GRAS
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# SOUSLIGNE
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White



#########################################
#////////////////////////////////////////

#+--------------------------------------+
#| fonctions ASCII-graphic Onglets      |
#+--------------------------------------+


# affichage banniere.
bann ()
{
echo ""
cat ./ban.sh
echo -e $BLANCLAIR" "$version $NORMAL
}

# forme ASCII de l'onglet A lors de sa selection.
onglet_menu_a ()
{
bann
echo " ________  _________  ____________  ____________  ___________"
echo -e "/$CYAN'A-Menu'$NORMAL\/ B-Graph \/ C-Services \/ D-Firewall \/ E-Network \ "
echo -e "$BLANCLAIR          \______________________________________________________________$NORMAL"
#echo ""
}

# forme ASCII de l'onglet B lors de sa selection.
onglet_menu_b ()
{
bann
echo " ________  _________  ____________  ____________  ___________"
echo -e "/ A-Menu \/$CYAN'B-Graph'$NORMAL\/ C-Services \/ D-Firewall \/ E-Network \ "
echo "_________/           \___________________________________________________"
#echo ""
}

# forme ASCII de l'onglet C lors de sa selection.
onglet_menu_c ()
{
bann
echo " ________  _________  ____________  ____________  ___________"
echo -e "/ A-Menu \/ B-Graph \/$CYAN'C-Services'$NORMAL\/ D-Firewall \/ E-Network \  "
echo "____________________/              \_____________________________________ "
#echo ""
}

# forme ASCII de l'onglet D lors de sa selection.
onglet_menu_d ()
{
bann
echo " ________  _________  ____________  ____________  ___________"
echo -e "/ A-Menu \/ B-Graph \/ C-Services \/"$CYAN"'D-Firewall'"$NORMAL"\/ E-Network \  "
echo "__________________________________/              \_______________________ "
#echo ""
}

# forme ASCII de l'onglet E lors de sa selection.
onglet_menu_e ()
{
bann
echo " ________  _________  ____________  ____________  ___________"
echo -e "/ A-Menu \/ B-Graph \/ C-Services \/ D-Firewall \/"$CYAN"'E-Network'"$NORMAL"\  "
echo "________________________________________________/             \__________ "
#echo ""
}

#########################################
#////////////////////////////////////////

#+--------------------------------------+
#|     fonctions des deplacements  	|
#+--------------------------------------+


#Identification de la commande souhaiter.
#fonction de choix/deplacement.
choix ()
{
echo ""
echo -e $BLANCLAIR"╔═══════════════════════════════════════════════════════════════════════╗"$NORMAL
echo -e $BLANCLAIR"║"$NORMAL"       Choose Action$ROUGE a$NORMAL,$ROUGE b$NORMAL,$ROUGE c$NORMAL, .. $ROUGE 1$NORMAL, $ROUGE 2$NORMAL, $ROUGE 3$NORMAL, .. [$ROUGE q$NORMAL ]uit ? :      "$BLANCLAIR"     ║"$NORMAL
echo -e $BLANCLAIR"╚═══════════════════════════════════════════════════════════════════════╝"$NORMAL
read -p "" action 
case $action in
# quitter le menu
  [qQ])
  clear
  echo -e "$ROUGE Exit Menu. $NORMAL"
  exit 0
  ;;
  [a-z])
  if [[ $action = [a-e] ]]
# C'est une lettre donc :
  then
# on determine le choix d'onglet pour deplacement [ type A-Z ]
  menu_$action
  else
  clear
  $currentmenu
  fi
  ;;
# C'est un chiffre donc :
  [1-9])
  case $currentmenu in
# Si menu A
  menu_a)
  coreselect_menu_a
  ;;
# Si menu B
  menu_b)
  clear
  $currentmenu
  ;;
# Si menu C .. etc ..
  menu_c)
  service_viewer
  ;;
  menu_e)
  network_viewer
  ;;
  esac
  ;;
# si aucun n'est connu retour menu actuel
  *)
  $currentmenu
  ;;
esac
}


#########################################
#////////////////////////////////////////

#+--------------------------------------+
#|   fonctions BUILD-CORE onglets	|
#+--------------------------------------+

# Fonction date, heure haut droite
hour_tab ()
{
date_now=$(date "+%d/%m/%Y - %H:%M")
echo ""
echo -e "  $CYAN$definition$NORMAL                                   $BLANCLAIR$date_now$NORMAL" 
echo -e "$BLANCLAIR═════════════════════════════════════════════════════════════════════════$NORMAL"
}

# Fonction permmetant d'afficher le contenue associeté a longlet A
coreselect_menu_a ()
{
definition="Welcome BashKit. "
clear
onglet_menu_a
hour_tab
fnsecA1
fnsecA2
fnsecA3
choix
 }

# Fonction permmetant d'afficher le contenue associeté a longlet B
coreselect_menu_b ()
{
definition="System Summary.  "
clear
onglet_menu_b
hour_tab
graph
choix
}

# Fonction permmetant d'afficher le contenue associeté a longlet C
coreselect_menu_c ()
{
definition="Services Manager."
clear
onglet_menu_c
hour_tab
service_manager
choix
}

# Fonction permmetant d'afficher le contenue associeté a longlet D
coreselect_menu_d ()
{
definition="Firewall Manager."
clear
onglet_menu_d
hour_tab
echo "WORK IN PROGRESS - NEXT RELEASE"
choix
}

# Fonction permmetant d'afficher le contenue associeté a longlet E
coreselect_menu_e ()
{
definition="Network Manager. "
clear
onglet_menu_e
hour_tab
inf_check
inf_manager
choix
}

#########################################
#////////////////////////////////////////

#+--------------------------------------+
#|   fonctions BUILDER VERTICAL onglet	|
#+--------------------------------------+


#########################################
#	     Fonction menu A            #
#########################################


# contenue du choix 1 dans menu A
fnsecA1 ()
{
echo ""
if [[ $currentmenu = "menu_a" ]]
then
if [[ $action = [1] ]]
	then
	echo -e "$BLANCLAIR [$JAUNE"1"$BLANCLAIR] - Access Shell.$NORMAL"
	wait
	clear
	echo -e "$ROUGE Exit Menu. $NORMAL"
	exit 0
	else
	echo -e " [$JAUNE"1"$NORMAL] - Access Shell."
fi

fi
}
#########################################
#////////////////////////////////////////

# contenue du choix 2 dans menu A
fnsecA2 ()
{
echo ""
if [[ $action = [2] ]]
        then
	echo -e "$BLANCLAIR [$JAUNE"2"$BLANCLAIR] - Task Manager.$NORMAL"
	wait
  gest_top=$(whereis htop | grep /)
                if [[ $gest_top = "" ]]
                   then
                   top
                   else
                   htop
                fi
        else
        echo -e " [$JAUNE"2"$NORMAL] - Task Manager."
fi
}
#########################################
#////////////////////////////////////////

# contenue du choix 3 dans menu A
fnsecA3 ()
{
echo ""
if [[ $pid_to_kill != "" ]]
   then
   sudo kill -15 $pid_to_kill 2> /dev/null
   pid_to_kill=
fi
if [[ $action = [3] ]]
        then
        echo -e "$BLANCLAIR [$JAUNE"3"$BLANCLAIR] - Logs Messages System [ REAL TIME ][ PRESS "ENTER" TO QUIT ]:$NORMAL"
	echo "════════════════════════════════════════════════════════════════════"
        wait
        sudo tail -15f /var/log/messages &
        pid_to_kill=$(ps -lfe | grep -b "tail -15f" | head -n1 | awk '{print $4}')
        else
        echo -e " [$JAUNE"3"$NORMAL] - Logs Messages System."
fi
}
#########################################
#////////////////////////////////////////

#########################################
#           Fonction menu B             #
#########################################

graph ()
{
getinfo
echo ""
echo -e "$JAUNE   System :$NORMAL"
echo ""
echo -e "$BLANCLAIR  Host : $ROUGE[ $NORMAL"$nommachine$ROUGE" ]"$NORMAL
echo -e "$BLANCLAIR  Type : $ROUGE[ $NORMAL$redhatversion"$ROUGE"]"$NORMAL 
echo -e "$BLANCLAIR  Boot : $ROUGE[ $NORMAL$timeup"$ROUGE" ]"$NORMAL
echo -e $BLANCLAIR" ════════════════════════════════════════════════════════════════════════"$NORMAL
echo -e "$JAUNE   Processor : $NORMAL"
echo ""
echo " $procspeed" "x" $procqt "core"
echo -e $BLANCLAIR" ════════════════════════════════════════════════════════════════════════"$NORMAL
echo -e "$JAUNE   Memory : $NORMAL"
echo ""
echo -e " ----" $JAUNE"RAM"$NORMAL" ----  ----" $JAUNE"SWAP"$NORMAL" ----"
echo -e "$BLANCLAIR Total  :$NORMAL "$memtotal" $BLANCLAIR Total :$NORMAL "$swaptotal
echo    " -----------------------------"
echo -e "$BLANCLAIR Used   :$NORMAL "$memused" $BLANCLAIR Used  :$NORMAL "$swapused
echo -e "$BLANCLAIR Free   :$NORMAL "$memfree" $BLANCLAIR Free  :$NORMAL "$swapfree
echo -e "$BLANCLAIR Buffer :$NORMAL "$membuffer
echo -e $BLANCLAIR" ════════════════════════════════════════════════════════════════════════"$NORMAL
echo -e "$JAUNE   Disk Storage :$NORMAL"
echo ""
echo -e	$BLANCLAIR"  Disk                       Total   Used  Free  %   Mount"$NORMAL
echo "$diskusage"
memfree=""
}

getinfo ()
{
#model & vitesse processeur
procspeed=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -d':' -f2)

#nombre de coeurs
procqt=$(cat /proc/cpuinfo | grep processor | wc -l)

#utildisk
diskusage=$(df -h | grep '^/')

#uptime machine
timeup=$(uptime | cut -d',' -f1 | awk '{print $2,$3,$4}')

#nom machine
nommachine=$(hostname)

#definition ram total
memtotal=$(free -h | head -n2 | tail -n1 | awk '{print $2}')
#definition swap total
swaptotal=$(free -h | head -n3 | tail -n1 | awk '{print $2}')

#definition swap total
membuffer=$(free -h | head -n2 | tail -n1 | awk '{print $6}')

#definition ram libre
memfree=$(free -h | head -n2 | tail -n1 | awk '{print $4}')
#definition swap libre
swapfree=$(free -h | head -n3 | tail -n1 | awk '{print $4}')

#definition ram utilisé
memused=$(free -h | head -n2 | tail -n1 | awk '{print $3}')
swapused=$(free -h | head -n3 | tail -n1 | awk '{print $3}')

#version system
redhatversion=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'=' -f2 | cut -d'"' -f2)
}

#########################################
#////////////////////////////////////////

# Onglet Menu C

#+--------------------------------------+
#| fonctions de management des services |
#+--------------------------------------+

service_manager ()
{
echo ""
#Variable incrémenale
num_rool=1
#Lecture du fichier des services
service_build=$(head -n1 ./services.txt  | tail -n1)
# Boucle de conception d'affichage
while test $service_build != "STOP"
        do
	# Lire la premiere ligne
	service_build=$(head -n$num_rool ./services.txt  | tail -n1)
	# Verifie l'existance du service
	service_exist=$(systemctl | awk '{print $1}' | cut -d'.' -f1 | grep $service_build$)
	if [[ $service_exist = "" ]]
	    then
		# Si il n'existe pas
		if [[ $service_build = "STOP" ]]
		    then
		    # Si la boucle  arrive a STOP
		    choix
		    else
		    # Innexistant ou Off
		    state_run=$(systemctl status $service_build.service | grep "Active" | cut -d':' -f2)
                    color_state=$(echo -e $ROUGE $state_run $NORMAL)
		fi

	    else
		# Existant On
		state_run=$(systemctl status $service_build.service | grep "Active" | cut -d':' -f2)
		color_state=$(echo -e $VERT $state_run $NORMAL)
	fi
	# Affiche la ligne du services avec status et colo
	echo -e " [$JAUNE"$num_rool"$NORMAL] - $BLANCLAIR $service_build$NORMAL : $color_state"
        echo -e "$BLANCLAIR ════════════════════════════════════════════════════════════════════════$NORMAL"

	#incremente la boucle services
	num_rool=$(($num_rool+1))
        done
}

# Sous manager du service
service_viewer ()
{
# verifie nombre
if [[ $action = [0-9] ]]
    then
	# forme l'affichage
	clear
	onglet_menu_c
	hour_tab
	# recupere le nom par le numero :
	srv_select=$(head -n$action ./services.txt  | tail -n1)
	# status du service : 
	systemctl status $srv_select.service | grep "Active" | cut -d':' -f2 > run
	run_state=$(cat ./run)
	# Si contient etat running alors vert
	red_or_green=$(echo $run_state | grep "dead")
	echo -e "$CYAN  Manager Mode $NORMAL:"
	echo ""
		if [[ $red_or_green = "" ]]
		    then
		    color_state=$(echo -e $VERT $run_state $NORMAL)
		    else
                    color_state=$(echo -e $ROUGE $run_state $NORMAL)
		fi
                    #graphique service
                    echo -e " Service :  $BLANCLAIR $srv_select #$NORMAL"
		    echo -e " Status  :  $color_state"
                    echo -e "$BLANCLAIR╔════════════════╔════════════════╔════════════════╔════════════════════╗$NORMAL"
	 	    echo -e "$BLANCLAIR║$NORMAL    ("$JAUNE"S"$NORMAL")tart     $BLANCLAIR║$NORMAL    ("$JAUNE"R"$NORMAL")estart   $BLANCLAIR║$NORMAL    ("$JAUNE"Ss"$NORMAL")top     $BLANCLAIR║$NORMAL    ("$JAUNE"A"$NORMAL")ctualiser    $BLANCLAIR║$NORMAL"

fi
# recolte du choix
#echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo -e "║        Choose Action$ROUGE S$NORMAL,$ROUGE R$NORMAL,$ROUGE Ss$NORMAL,$ROUGE a$NORMAL, .. [$ROUGE q$NORMAL ]uit$CYAN manager mode$NORMAL ? :        ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
read -p "" action_services
fn_mngt
}

# traitement du choix
fn_mngt ()
{
case $action_services in
  [qQ])
  clear
  echo -e "$ROUGE Exit Menu. $NORMAL"
  menu_c
  ;;
  S)
  sudo service $srv_select start
  ;;
  R)
  sudo service $srv_select restart
  ;;
  "Ss")
  sudo service $srv_select stop 
  ;;
  aA)
  service_viewer
  ;;
esac
# retour au viewer
service_viewer
}



#########################################
#////////////////////////////////////////

#+--------------------------------------+
#| fonctions menu E Network		|
#+--------------------------------------+

inf_check ()
{
#liste toutes les cartes rsx
ifconfig -a | grep : | awk '{print $1}' | grep : | cut -d':' -f1 > network_inf.txt
echo "STOP" >> network_inf.txt
ifconfig | grep : | awk '{print $1}' | grep : | cut -d':' -f1 > network_inf_enabled.txt
echo "STOP" >> network_inf_enabled.txt
}

inf_manager ()
{
echo ""
#Variable incrémenale
num_rool=1
#Lecture du fichier des services
network_build=$(head -n1 ./network_inf.txt  | tail -n1)
# Boucle de conception d'affichage
while test $network_build != "STOP"
        do
	# Lire la ligne
	network_build=$(head -n$num_rool ./network_inf.txt  | tail -n1)
        # on verifie si la carte est active
	network_enabled=$(cat network_inf_enabled.txt | grep $network_build)
        # la carte est elle active 
	if [[ $network_enabled = "" ]]
	   then
	   link_state=$ROUGE\LINK-DOWN$NORMAL
	   else
    	   link_state=$VERT\LINK-UP$NORMAL
	fi
	# Verifie l'existance de la config rsx
        network_exist=$(cat /etc/sysconfig/network-scripts/ifcfg-$network_build 2> /dev/null | grep IPADDR | head -n1 | cut -d'=' -f2)
	# Si la config n'existe pas :
	if [[ $network_exist = "" ]]
	    then
		network_exist=$(cat /etc/sysconfig/network-scripts/ifcfg-$network_build 2> /dev/null | grep -i dhcp | head -n1 | cut -d'=' -f2)
		if [[ $network_exist = "" ]]
		    then
		    network_exist=$ROUGE\NO-CONFIG$NORMAL
		    else
		    network_exist=$ORANGE\DHCP$NORMAL
		fi
		# On verifie que ce n'est pas le signal STOP
		if [[ $network_build = "STOP" ]]
		    then
		    # Si la boucle arrive a STOP alors FIN
		    choix
		    else
		    # carte rsx non configure
		    echo -e " [$JAUNE"$num_rool"$NORMAL] - $BLANCLAIR $network_build : $network_exist -- $link_state "
                    echo -e "$BLANCLAIR ════════════════════════════════════════════════════════════════════════$NORMAL"
		fi
	    else
		# Existant On
		echo -e " [$JAUNE"$num_rool"$NORMAL] - $BLANCLAIR $network_build :$VERT $network_exist $NORMAL -- $link_state "
                echo -e "$BLANCLAIR ════════════════════════════════════════════════════════════════════════$NORMAL"
	fi
	# Increment de variable
	num_rool=$(($num_rool+1))
        done
}

# Sous manager du service
network_viewer ()
{
# verifie nombre
if [[ $action = [0-9] ]]
    then
	# forme l'affichage
	clear
	onglet_menu_e
	hour_tab
	# recupere le nom par le numero :
	network_select=$(head -n$action ./network_inf.txt  | tail -n1)
	# status du rsx :
	network_enabled=$(cat network_inf_enabled.txt | grep $network_select)
        # la carte est elle active
	if [[ $network_enabled = "" ]]
	   then
	   link_state=$ROUGE\LINK-DOWN$NORMAL
	   else
    	   link_state=$VERT\LINK-UP$NORMAL
	fi

	# ont recupere @IP
        network_exist=$(cat /etc/sysconfig/network-scripts/ifcfg-$network_select 2> /dev/null | grep IPADDR | head -n1 | cut -d'=' -f2)
	 if [[ $network_exist = "" ]]
            then
		network_exist=$(cat /etc/sysconfig/network-scripts/ifcfg-$network_select 2> /dev/null | grep -i DHCP | head -n1 | cut -d'=' -f2)
		 if [[ $network_exist = "" ]]
	            then
		    network_exist=$ROUGE\NO-CONFIG$NORMAL
		    else
		    network_exist=$ORANGE\DHCP$NORMAL
	         fi
 	 fi

	echo -e "$CYAN  Manager Mode $NORMAL:"
	echo ""
	#graphique service off
	echo -e " Adaptater :  $BLANCLAIR $network_select #$NORMAL"
	echo -e " Status    : '$VERT $network_exist$NORMAL - $link_state '" 
        echo -e "$BLANCLAIR╔════════════════╔════════════════╔════════════════╔════════════════════╗$NORMAL"
	echo -e "$BLANCLAIR║$NORMAL    ("$JAUNE"E"$NORMAL")nable    $BLANCLAIR║$NORMAL    ("$JAUNE"D"$NORMAL")isable   $BLANCLAIR║$NORMAL    ("$JAUNE"Ed"$NORMAL")it $ROUGE     $NORMAL$BLANCLAIR║$NORMAL    ("$JAUNE"A"$NORMAL")ctualize     $BLANCLAIR║$NORMAL"


# recolte du choix
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo -e "║        Choose Action$ROUGE E$NORMAL,$ROUGE D$NORMAL,$ROUGE Ed$NORMAL,$ROUGE a$NORMAL, .. [$ROUGE q$NORMAL ]uit$CYAN manager mode$NORMAL ? :        ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
read -p "" action_network
fn_mngt_network
fi
}

net_config_builder ()
{
clear
onglet_menu_e
hour_tab
echo -e "$BLANCLAIR  NETWORK IPv4 GENERATOR  ║$NORMAL"
echo -e "$BLANCLAIR══════════════════════════╝$NORMAL"
echo -e "  Network Adaptater ="$CYAN $network_select "$NORMAL-- "$network_exist $NORMAL
echo -e $BLANCLAIR"╔═══════════════════════════════════════════════════════════════════════╗"$NORMAL
echo -e $BLANCLAIR"* Enter IP_ADDR  -  [ xx.xx.xx.xx ]                                    *"$NORMAL
echo -e $BLANCLAIR"╚═══════════════════════════════════════════════════════════════════════╝"$NORMAL
read ip_address
echo -e $BLANCLAIR"╔═══════════════════════════════════════════════════════════════════════╗"$NORMAL
echo -e $BLANCLAIR"* Enter NETMASK  -  [ xx.xx.xx.xx ]                                    *"$NORMAL
echo -e $BLANCLAIR"╚═══════════════════════════════════════════════════════════════════════╝"$NORMAL
read ip_netmask
echo -e $BLANCLAIR"╔═══════════════════════════════════════════════════════════════════════╗"$NORMAL
echo -e $BLANCLAIR"* Enter GATEWAY  -  [ xx.xx.xx.xx ]                                    *"$NORMAL
echo -e $BLANCLAIR"╚═══════════════════════════════════════════════════════════════════════╝"$NORMAL
read ip_gateway
echo -e $BLANCLAIR"═════════════════════════════════════════════════════════════════════════"$NORMAL
echo -e $BLANCLAIR"======================"$ROUGE" WARNING_ERASE_CONFIG ?!"$NORMAL "[Y/N] ===================="$NORMAL
read yes_or_no
echo "to write"


case $yes_or_no in
  [yY])
  echo "DEVICE="$network_select > /etc/sysconfig/network-scripts/ifcfg-$network_select
  echo "BOOTPROTO="static >> /etc/sysconfig/network-scripts/ifcfg-$network_select
  echo "IPADDR="$ip_address >> /etc/sysconfig/network-scripts/ifcfg-$network_select
  echo "NETMASK="$ip_netmask >> /etc/sysconfig/network-scripts/ifcfg-$network_select
  echo "GATEWAY="$ip_gateway >> /etc/sysconfig/network-scripts/ifcfg-$network_select
  echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$network_select
  network_viewer
  ;;
  [nN])
  network_viewer
  ;;
  *)
  network_viewer
  ;;
esac
}


# traitement du choix
fn_mngt_network ()
{
case $action_network in
  [qQ])
  clear
  echo -e "$ROUGE Exit Menu. $NORMAL"
  menu_e
  ;;
  E)
  sudo ifconfig $network_select up
  ;;
  D)
  sudo ifconfig $network_select down
  ;;
  "Ed")
  net_config_builder 
  ;;
  aA)
  inf_check
  network_viewer
  ;;
esac
# retour au viewer
inf_check
network_viewer
}


#########################################
#////////////////////////////////////////

#+--------------------------------------+
#| fonctions de mise en forme des menu  |
#+--------------------------------------+

# 1 nettoie l'affichage
# 2 rempli les variables pour l'affichage
# 3 insere les fonction de contenu
# 4 arrete la boucle entre fonction avec le choix

menu_a ()
{
clear
currentmenu=menu_a
coreselect_menu_a
choix
}

menu_b ()
{
clear
currentmenu=menu_b
coreselect_menu_b
choix
}

menu_c ()
{
clear
currentmenu=menu_c
coreselect_menu_c
choix
}

menu_d ()
{
clear
currentmenu=menu_d
coreselect_menu_d
choix
}

menu_e ()
{
clear
currentmenu=menu_e
coreselect_menu_e
choix
}


#+-------------------------------------+
# execution du script		       |
#+-------------------------------------+


clear
menu_a
