#!/bin/bash
COLOR_ROJO='\033[01;31m'
COLOR_VERDE='\033[01;32m'
COLOR_AMARILLO='\033[01;33m'
COLOR_NEGRO='\033[00;30m'
COLOR_ROSA="\033[35m"
COLOR_PURPURA='\033[01;35m'
COLOR_AZUL="\033[34m"
COLOR_CYAN='\033[01;36m'
QUITAR_COLOR="\033[0m"

X="\033[01;31mX$QUITAR_COLOR"
O="\033[34mO$QUITAR_COLOR"
j=0

function TABLERO(){
	    
            echo -e "\n"
            echo -e " \t -------------"
            echo -e " \t | ${ARRAY[0]} | ${ARRAY[1]} | ${ARRAY[2]} |"
            echo -e " \t -------------"
            echo -e " \t | ${ARRAY[3]} | ${ARRAY[4]} | ${ARRAY[5]} |"
            echo -e " \t -------------"
            echo -e " \t | ${ARRAY[6]} | ${ARRAY[7]} | ${ARRAY[8]} |"
            echo -e " \t -------------"
            
            }
function TURNOHUMANO(){

	CONTADORHUMANO=$((CONTADORHUMANO+1))
	
	if test $CONTADORHUMANO -le 3
	then
		read -n 1 -p 'Introduce la posición en la que desea posicionarse ' POSI

		while test $POSI -eq 0            
		do
			read -n 1 -p '<<ERROR>>  INTRODUCE UNA POSICION QUE NO SEA 0 ' POSI
		done
		
		while [ "${ARRAY[POSI-1]}" = "$X" ] || [ "${ARRAY[POSI-1]}" = "$O" ]            
		do
		    	read -n 1 -p '<<ERROR>>  INTRODUCE UNA POSICION QUE NO ESTE OCUPADA                ' POSI
		done
 
            	if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
        	then
               		 ARRAY[((POSI-1))]="$X"
    
            	else
                    ARRAY[((POSI-1))]="$O"
        fi
        else  
         	JUGADA[j]="1."
         	j=$((j+1))

         	if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ]
        	then
			read -n 1 -p 'Introduce la ficha que desea mover ' POSI2

		        while test "${ARRAY[POSI2-1]}" != "$X" -o "$FICHACENTRAL" = 1 -a "$POSI2" = 5 
		        do
		        	if [ "$FICHACENTRAL" = 1 ] && [ "$POSI2" = 5 ]
		        	then
		        		read -n 1 -p '<<ERROR>>La ficha central no se puede mover, seleccione otra posicion' POSI2
		        	else		  
		 			read -n 1 -p '<<ERROR>>Introduce una posicion ocupada por una de tus fichas  ' POSI2
		 		fi
		    	done

		    	ARRAY[((POSI2-1))]=$POSI2
		    	JUGADA[j]="$POSI2."
         		j=$((j+1))

		    	read -n 1 -p 'Introduce la posicion a la que deseas moverte ' POSINUEVA

		        while [ "${ARRAY[POSINUEVA-1]}" = "$X" ] || [ "${ARRAY[POSINUEVA-1]}" = "$O" ]
		        do
		 		read -n 1 -p '<<ERROR>>Introduce una posicion que no este ocupada   ' POSINUEVA
		    	done
		    	
		    	ARRAY[((POSINUEVA-1))]="$X"
			JUGADA[j]="$POSINUEVA:"
         		j=$((j+1))

		    	
            	else
            		read -n 1 -p 'Introduce la ficha que desea mover ' POSI2

		        while test "${ARRAY[POSI2-1]}" != "$O" -o "$FICHACENTRAL" = 1 -a "$POSI2" = 5 
		        do
		        	if [ "$FICHACENTRAL" = 1 ] && [ "$POSI2" = 5 ]
		        	then
		        		read -n 1 -p '<<ERROR>>La ficha central no se puede mover, seleccione otra posicion' POSI2
		        	else		  
		 			read -n 1 -p '<<ERROR>>Introduce una posicion ocupada por una de tus fichas  ' POSI2
		 		fi
		    	done

		    	ARRAY[((POSI2-1))]=$POSI2
		    	JUGADA[j]="$POSI2."
         		j=$((j+1))

		    	read -n 1 -p 'Introduce la posicion a la que deseas moverte ' POSINUEVA

		        while [ "${ARRAY[POSINUEVA-1]}" = "$X" ] || [ "${ARRAY[POSINUEVA-1]}" = "$O" ]
		        do
		 		read -n 1 -p '<<ERROR>>Introduce una posicion que no este ocupada   ' POSINUEVA
		    	done

		    	ARRAY[((POSINUEVA-1))]="$O"
			JUGADA[j]="$POSINUEVA:"
         		j=$((j+1))

            	fi
        fi            
        
            }
function TURNOMAQUINA(){

	 clear
         echo -e "Turno de la maquina:"
         
        CONTADORMAQUINA=$((CONTADORMAQUINA+1))
	if test $CONTADORMAQUINA -le 3
	then
		    VARIABLE=$(($(($RANDOM%9))+1))
	  
		    while [ "${ARRAY[$((VARIABLE-1))]}" = "$X" ] || [ "${ARRAY[$((VARIABLE-1))]}" = "$O" ]           
		    do
		                VARIABLE=$(($(($RANDOM%9))+1))
		    done
		    
	 
		    if [ "$COMIENZO" = 2 ] || [ "$ALEATORIO" = 2 ]
		    then
		                ARRAY[((VARIABLE-1))]="$X"
	 
		    else
		                ARRAY[((VARIABLE-1))]="$O"
		    fi
	else  
		JUGADA[j]="2."
		j=$((j+1))

         	if [ "$COMIENZO" = 2 ] || [ "$ALEATORIO" = 2 ]
        	then
			while test "${ARRAY[$((VARIABLE-1))]}" != "$X" -o "$FICHACENTRAL" = 1 -a "$VARIABLE" = 5 
			do
				VARIABLE=$(($(($RANDOM%9))+1))
			done

			ARRAY[((VARIABLE-1))]=$VARIABLE
			JUGADA[j]="$VARIABLE."
			j=$((j+1))

			VARIABLE=$(($(($RANDOM%9))+1))

			while [ "${ARRAY[$((VARIABLE-1))]}" = "$X" ] || [ "${ARRAY[$((VARIABLE-1))]}" = "$O" ]           
			do
				VARIABLE=$(($(($RANDOM%9))+1))
			done

			ARRAY[((VARIABLE-1))]="$X"
			JUGADA[j]="$VARIABLE:"
			j=$((j+1))
			   
			    	
            	else
            	    while test "${ARRAY[$((VARIABLE-1))]}" != "$O" -o "$FICHACENTRAL" = 1 -a "$VARIABLE" = 5 
		    do
		                VARIABLE=$(($(($RANDOM%9))+1))
		    done

		    ARRAY[((VARIABLE-1))]=$VARIABLE
		    JUGADA[j]="$VARIABLE."
		    j=$((j+1))
		    	
		    VARIABLE=$(($(($RANDOM%9))+1))

		    while [ "${ARRAY[$((VARIABLE-1))]}" = "$X" ] || [ "${ARRAY[$((VARIABLE-1))]}" = "$O" ]           
		    do
		               VARIABLE=$(($(($RANDOM%9))+1))
		    done

		    ARRAY[((VARIABLE-1))]="$O"
		    JUGADA[j]="$VARIABLE:"
		    j=$((j+1))
		    	
                fi
	fi            
		
		
		
		
}	   
 
function COMPROBAR(){
            
	CENTINELA=0
#VERTICAL
            if [ "${ARRAY[0]}" = "$X" ] && [ "${ARRAY[3]}" = "$X" ] && [ "${ARRAY[6]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                    GANADOR=1
                                    echo -e "HA GANADO EL USUARIO"
 
                        else
                                   GANADOR=2
                
                                   echo -e "HA GANADO LA MAQUINA"
                
                     	fi
        		CENTINELA=1
            fi
          
            if [ "${ARRAY[0]}" = "$O" ] && [ "${ARRAY[3]}" = "$O" ] && [ "${ARRAY[6]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
           fi
         
           if [ "${ARRAY[1]}" = "$X" ] && [ "${ARRAY[4]}" = "$X" ] && [ "${ARRAY[7]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
                     	fi
         		CENTINELA=1
          fi
         
          if [ "${ARRAY[1]}" = "$O" ] && [ "${ARRAY[4]}" = "$O" ] && [ "${ARRAY[7]}" = "$O" ]; then
                     
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                    echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
          fi
          if [ "${ARRAY[2]}" = "$X" ] && [ "${ARRAY[5]}" = "$X" ] && [ "${ARRAY[8]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
                     	fi
         		CENTINELA=1
         fi
         if [ "${ARRAY[2]}" = "$O" ] && [ "${ARRAY[5]}" = "$O" ] && [ "${ARRAY[8]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
#DIAGONAL
        if [ "${ARRAY[0]}" = "$X" ] && [ "${ARRAY[4]}" = "$X" ] && [ "${ARRAY[8]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
                     	fi
         		CENTINELA=1
        fi
          
        if [ "${ARRAY[0]}" = "$O" ] && [ "${ARRAY[4]}" = "$O" ] && [ "${ARRAY[8]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
         
        if [ "${ARRAY[6]}" = "$X" ] && [ "${ARRAY[4]}" = "$X" ] && [ "${ARRAY[2]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                     	fi
        		CENTINELA=1
        fi
         
        if [ "${ARRAY[6]}" = "$O" ] && [ "${ARRAY[4]}" = "$O" ] && [ "${ARRAY[2]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
         
#HORIZONTAL
        if [ "${ARRAY[0]}" = "$X" ] && [ "${ARRAY[1]}" = "$X" ] && [ "${ARRAY[2]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                     	fi
        		CENTINELA=1
        fi
         
        if [ "${ARRAY[0]}" = "$O" ] && [ "${ARRAY[1]}" = "$O" ] && [ "${ARRAY[2]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
         
        if [ "${ARRAY[3]}" = "$X" ] && [ "${ARRAY[4]}" = "$X" ] && [ "${ARRAY[5]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                     	fi
        		CENTINELA=1
        fi
          
        if [ "${ARRAY[3]}" = "$O" ] && [ "${ARRAY[4]}" = "$O" ] && [ "${ARRAY[5]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
        if [ "${ARRAY[6]}" = "$X" ] && [ "${ARRAY[7]}" = "$X" ] && [ "${ARRAY[8]}" = "$X" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                        else
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
                     	fi
         		CENTINELA=1
        fi
        if [ "${ARRAY[6]}" = "$O" ] && [ "${ARRAY[7]}" = "$O" ] && [ "${ARRAY[8]}" = "$O" ]; then
                      
                      
                        if [ "$COMIENZO" = 1 ] || [ "$ALEATORIO" = 1 ];
                        then
                                   GANADOR=2
                                   echo -e "HA GANADO LA MAQUINA"
 
                        else
                                   GANADOR=1
                                   echo -e "HA GANADO EL USUARIO"
                     	fi
        		CENTINELA=1
        fi
}
 
 
if test ! -f oxo.cfg
then
            clear
            echo -e "$COLOR_ROJO\n\tERROR: No existe el archivo de configuración 'oxo.cfg'"
            echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 3 segundos."
            sleep 1
            echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 2 segundos."
            sleep 1
            echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 1 segundos.\n$QUITAR_COLOR"
            sleep 1
            else
 
	if test "$1" = "-g"
	then
		clear
		echo -e "$COLOR_ROJO\tO\tX\tO$COLOR_AZUL  por JAIME GOMEZ  y ALEJANDRO ARGÜELLO"
		 
		 
	elif [ "$1" = "" ]
	then
		  
		while test " $OPCION " != 'S'
		do
			clear    
			echo -e "\n$COLOR_ROJO\t\t*----------------*"
			echo -e "\t$COLOR_ROJO\t\tOXO"
			echo -e "$COLOR_ROJO\t\t*----------------*\n"
			echo -e "$COLOR_ROSA\tC) CONFIGURACION "
			echo -e "$COLOR_VERDE\tJ) JUGAR "
			echo -e "$COLOR_AZUL\tE) ESTADISTICAS "
			echo -e "$COLOR_ROJO\tS) SALIR $QUITAR_COLOR"
			read -n 1 -p '   "OXO". Introduzca una opción >> ' OPCION
			echo


			OPCION=`echo $OPCION | tr '[a-z]' '[A-Z]'` 
			    
			case $OPCION in

				     

			C)
				    while test "$CONFIG" != 'N'
				    do
					    WARNING=null
					    clear
					    test -f oxo.cfg
					    WARNING=$?

					    if test "$WARNING" -eq 0
					    then     
						    . oxo.cfg
						    clear           
						    echo -e "\n$COLOR_ROJO\t\t*----------------*"
						    echo -e "\t$COLOR_ROJO\t   CONFIGURACIÓN"
						    echo -e "$COLOR_ROJO\t\t*----------------*\n"
						    echo -e "\n\t\t$COLOR_AZUL\tCOMIENZO = $COMIENZO"
						    echo -e "\t\t$COLOR_AZUL\tFICHACENTRAL = $FICHACENTRAL"
						    echo -e "\t\t$COLOR_AZUL\t ESTADISTICAS = $ESTADISTICAS"
						    echo -e "$COLOR_VERDE\tC) Cambiar el comienzo "
						    echo -e "$COLOR_ROSA\tF) Configuracion ficha central "
						    echo -e "$COLOR_AZUL\tR) Cambiar ruta del fichero estadisticas "
						    echo -e "$COLOR_ROJO\tS) Regresar al menu principal $QUITAR_COLOR"
						    echo -ne "\tIntroduzca una opción >> "
						    read -n 1 CONFIG
						    echo
						    CONFIG=`echo $CONFIG | tr '[a-z]' '[A-Z]'`
						    
						    else
						    clear
						    echo -e "\t$COLOR_ROJO EL FICHERO NO EXISTE "
						    echo -e "\n\tPulse INTRO para continuar"    
						    read
						    break
					    fi
					    
					    case $CONFIG in
					    
					    C)
						       echo -e "$COLOR_VERDE\tIntroduce un 1 para comenzar tu"
						       echo -e "$COLOR_VERDE\tIntroduce un 2 para que comience la maquina"
						       echo -e "$COLOR_VERDE\tIntroduce un 3 para que se decida de forma aleatoria"
						       read -n 1 COMIENZO

						       while test "$COMIENZO" -ne 1 -a "$COMIENZO" -ne 2 -a "$COMIENZO" -ne 3
						       do
								   read -n 1 -p "Introduce una opcion válida " COMIENZO
						       done
					    ;;
					    F)
						       echo -e "$COLOR_ROSA\tIntroduce un 1 para que la ficha situada en la posicion (5) no pueda moverse"
						       echo -e "$COLOR_ROSA\tIntroduce un 2 para que la ficha situada en la posicion (5) pueda moverse"
						       read -n 1 FICHACENTRAL
						       FICHACENTRAL=`echo $FICHACENTRAL | tr '[a-z]' '[A-Z]'`

						       while test "$FICHACENTRAL" -ne 1 -a "$FICHACENTRAL" -ne 2
						       do
								   read -n 1 -p "Introduce una opcion válida " FICHACENTRAL
						       done
						       
					    ;;
					    R)
						       clear
						       echo -e "$COLOR_AZUL\t\t*-------------------------------*$QUITAR_COLOR"
						       echo -e "\t\t\e[104m  CAMBIAR RUTA DE ESTADÍSTICAS\e[0m  "     
						       echo -e "$COLOR_AZUL\t\t*-------------------------------*$QUITAR_COLOR"
						       echo -e "\n\t· Si quieres que el fichero de estadísticas se encuentre en la misma\n\truta que 'oxo.sh' escribe un asterisco: $COLOR_AMARILLO*$QUITAR_COLOR"
						       echo -e "\t· Si quieres cambiar la ruta al escritorio, introduce: $COLOR_AMARILLO\tEscritorio$QUITAR_COLOR"
						       echo -e "\t· Puedes introducir la ruta deseada de la siguiente manera:\n$COLOR_AMARILLO\tEscritorio/alumnos/Descargas$QUITAR_COLOR o $COLOR_AMARILLO\tEscritorio/estadisticas$QUITAR_COLOR (se almacenará e\n\tn una carpeta llamada estadísticas en el escritorio)."
						       echo -e "\t· Si quieres crear una carpeta en el directorio raíz, escribe el nombre\n\tdeseado de la carpeta, si la carpeta existe, se almacenará en ella, si\n\tno existe, se creará y se almacenará en ella."
						       echo -e "\t Ejemplo: $COLOR_AMARILLO estadisticas$QUITAR_COLOR (se creará una carpeta llamada estadísticas en e\n\tl directorio raíz)."
						       echo -ne "\n\t$COLOR_AZUL\tIntroduce la ruta del \e[1;4mfichero de estadísticas:\e[0m \e[1;34m>> $QUITAR_COLOR"
						       read ROOT

						       if test "$ROOT" = "*"
						       then
							       mv $ESTADISTICAS $(pwd)/'oxo.log'
							    
							       ESTADISTICAS=$(pwd)/'oxo.log'
						       else
							       mkdir ~/$ROOT
							    
							       mv $ESTADISTICAS ~/$ROOT/'loxo.log'
							       ESTADISTICAS=~/$ROOT/'oxo.log'
						       fi
					    
					    ;;
					    S)
						       break
					    ;;
					    *)
						       echo -e "\n\tLa opción introducida es $COLOR_ROJO incorrecta.$QUITAR_COLOR"
						       echo -e "\n\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"
						       read
						       clear
					    ;;
					    esac
	 
					    echo
					    echo -e "COMIENZO=$COMIENZO\nFICHACENTRAL=$FICHACENTRAL\nESTADISTICAS=$ESTADISTICAS" > oxo.cfg
				    
				  done
			;;
			J)
			    ARRAY=(1 2 3 4 5 6 7 8 9)
			    
			    . oxo.cfg

			    CONTADORHUMANO=0
			    CONTADORMAQUINA=0

			    case $COMIENZO in
					       1)
					       
					       TIEMPO_INICIAL=$SECONDS
					       PID=$$
					       TABLERO
					       TURNOHUMANO
				    	       TABLERO
					       TURNOMAQUINA
					       TABLERO
					       COMPROBAR
					       while test $CENTINELA -ne 1
					       do
					       		TURNOHUMANO
							TABLERO
							COMPROBAR
							if test $CENTINELA -ne 1;
							then
						        	TURNOMAQUINA
						        	TABLERO
						        	COMPROBAR
							fi         
					       done
					       
					       TIEMPO_FINAL=$SECONDS
					    
			 
					       ;;
					       2)

					       TIEMPO_INICIAL=$SECONDS
					       PID=$$
					       TABLERO
					       TURNOMAQUINA
				    	       TABLERO
					       TURNOHUMANO
					       TABLERO
					       COMPROBAR
					       while test $CENTINELA -ne 1
					       do
					       		TURNOMAQUINA
							TABLERO
							COMPROBAR
							if test $CENTINELA -ne 1;
							then
						        	TURNOHUMANO
						        	TABLERO
						        	COMPROBAR
							fi
					       done
					       
					       
					       TIEMPO_FINAL=$SECONDS
			 
			 
					       ;;
					       3)

					       TIEMPO_INICIAL=$SECONDS
					       PID=$$

				     	       ALEATORIO=$((1+RANDOM%2))
						   
					       if  test $ALEATORIO -eq 1;
					       then
					       		TABLERO
					       		TURNOHUMANO
					       		TABLERO
					       		TURNOMAQUINA
						        TABLERO
						        COMPROBAR
						        while test $CENTINELA -ne 1;
						        do
						        	TURNOHUMANO
								TABLERO
					       			COMPROBAR
								if  test $CENTINELA -ne 1;
								then
									TURNOMAQUINA       
									TABLERO
									COMPROBAR
								fi
						        done
						           

						        TIEMPO_FINAL=$SECONDS
			 
					      fi
					      if test $ALEATORIO -eq 2;
					      then
					      		TABLERO
					       		TURNOMAQUINA
					       		TABLERO
					       		TURNOHUMANO
						        TABLERO
						        COMPROBAR
						        while test $CENTINELA -ne 1;
						        do
						        	TURNOMAQUINA
								TABLERO
					       			COMPROBAR
								if  test $CENTINELA -ne 1;
								then
									TURNOHUMANO       
									TABLERO
									COMPROBAR
								fi
						        done
						           

						        TIEMPO_FINAL=$SECONDS


					     fi
					     ;;

				    	     esac

				echo -e "\n\n\t\t\Pulse INTRO para continuar"
				read
				clear

				FECHA=`date "+%d-%m-%Y"`
				TIEMPO_PARTIDA=$((TIEMPO_FINAL - TIEMPO_INICIAL))
				CONTADORMOVIMIENTO=$((CONTADORHUMANO + CONTADORMAQUINA))
				echo "$PID|$FECHA|$COMIENZO|$FICHACENTRAL|$GANADOR|$TIEMPO_PARTIDA|$CONTADORMOVIMIENTO|${JUGADA[*]}" >> $ESTADISTICAS
			 
			    
			;;
			E)
				    test -f oxo.cfg
				    CENTINELA2=$?
				    
				    if test "$CENTINELA2" -ne 0
				    then     
					    clear
					    echo -e "$COLOR_ROJO\n\tEl fichero de configuración NO existe.$QUITAR_COLOR"
					    echo -e "\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"            
					    read
				    else
				    
					    . oxo.cfg
					    
					    test -f $ESTADISTICAS
					    CENTINELA2=$?       
				    
					    if test "$CENTINELA2" -eq 0
					    then
						    clear
						    echo -e "\n$COLOR_AZUL\t\t*--------------*$QUITAR_COLOR"
						    echo -e "\t\t\e[104m  ESTADÍSTICAS\e[0m  "       
						    echo -e "$COLOR_AZUL\t\t*--------------*$QUITAR_COLOR"
						    echo -e "\n  \t\t\e[43m  GENERALES  \e[0m\n"
					 
						    echo -ne "\t$COLOR_PURPURA· Número total de partidas jugadas:$QUITAR_COLOR "
						    VARIABLE=$(wc -l < $ESTADISTICAS) 
						    echo -e "$COLOR_CYAN $VARIABLE $QUITAR_COLOR"
					 
						    echo -ne "\t$COLOR_PURPURA· Media de las longitudes de los movimientos de todas las partidas jugadas:$QUITAR_COLOR "
						    LONGITUDF=0
						    LONGITUDFINAL=0
						    while read linea
						    do
							    PARTIDA=$linea
							    LONGITUD=$(echo "$PARTIDA" | cut -f 7 -d "|")
							    LONGITUDF=$((LONGITUD+LONGITUDF))
							    LONGITUDFINAL=$((LONGITUDF/VARIABLE))
						    done < $ESTADISTICAS
						    echo -e "$COLOR_CYAN $LONGITUDFINAL $QUITAR_COLOR"
					 
						    echo -ne "\t$COLOR_PURPURA· Media de los tiempos de todas las partidas jugadas:$QUITAR_COLOR "
						    TIEMPOF=0
						    TIEMPOFINAL=0
						    while read linea
						    do
							    PARTIDA=$linea
							    TIEMPO=$(echo "$PARTIDA" | cut -f 6 -d "|")
							    TIEMPOF=$((TIEMPO+TIEMPOF))
							    TIEMPOFINAL=$((TIEMPOF/VARIABLE))
						    done < $ESTADISTICAS
						    echo -e "$COLOR_CYAN $TIEMPOFINAL segundos$QUITAR_COLOR"
					 
						    echo -ne "\t$COLOR_PURPURA· Tiempo total invertido en todas las partidas:$QUITAR_COLOR "
						    TIEMPOFINAL=0
						    while read linea
						    do
							    PARTIDA=$linea
							    TIEMPO=$(echo "$PARTIDA" | cut -f 6 -d "|")
							    TIEMPOFINAL=$((TIEMPO+TIEMPOFINAL))
						    done < $ESTADISTICAS
						    echo -e "$COLOR_CYAN $TIEMPOFINAL segundos$QUITAR_COLOR"
					 
					 
						    echo -e "\n  \t\t\e[101m  JUGADAS ESPECIALES  \e[0m\n"
					 
						    TIEMPO_MAYOR=0
						    while read linea
						    do
							    PARTIDAT=$linea
							    TIEMPO=$(echo "$PARTIDAT" | cut -f 6 -d "|")

							    if test $TIEMPO -gt $TIEMPO_MAYOR
							    then
								    TIEMPO_MAYOR=$TIEMPO
								    PARTIDA_MAYOR=$PARTIDAT
							    fi
						    done < $ESTADISTICAS
					 
						    TIEMPO_MENOR=10000
						    while read linea
						    do
							    PARTIDATM=$linea
							    TIEMPO=$(echo "$PARTIDATM" | cut -f 6 -d "|")

							    if test $TIEMPO -lt $TIEMPO_MENOR
							    then
								    TIEMPO_MENOR=$TIEMPO
								    PARTIDA_MENOR=$PARTIDATM
							    fi
						    done < $ESTADISTICAS
					 
						    echo -e "\t- Datos de la jugada más corta: "
						    echo " -----------------------------"
						    echo "$PARTIDA_MENOR " > min_time.txt
						    while IFS="|" read pid fecha comienzo fichacentral ganador tiempo longitud jugada
						    do
							    echo -e "\t$COLOR_PURPURA· Partida:$COLOR_CYAN $pid $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Fecha:$COLOR_CYAN $fecha $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Comienzo:$COLOR_CYAN $comienzo $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ficha central:$COLOR_CYAN $fichacentral $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ganador:$COLOR_CYAN $ganador $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Tiempo que ha durado:$COLOR_CYAN $tiempo segundos $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Longitud de la secuencia:$COLOR_CYAN $longitud $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Jugada:$COLOR_CYAN $jugada $QUITAR_COLOR"
						    done < min_time.txt
						    rm min_time.txt
						    
						
					       
					 
						    echo -e "\t- Datos de la jugada más larga: "
						    echo " -----------------------------"
						    echo "$PARTIDA_MAYOR" > max_time.txt
						    while IFS="|" read pid fecha comienzo fichacentral ganador tiempo longitud jugada
						    do
							    echo -e "\t$COLOR_PURPURA· Partida:$COLOR_CYAN $pid $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Fecha:$COLOR_CYAN $fecha $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Comienzo:$COLOR_CYAN $comienzo $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ficha central:$COLOR_CYAN $fichacentral $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ganador:$COLOR_CYAN $ganador $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Tiempo que ha durado:$COLOR_CYAN $tiempo segundos $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Longitud de la secuencia:$COLOR_CYAN $longitud $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Jugada:$COLOR_CYAN $jugada $QUITAR_COLOR"
						    done < max_time.txt
						    rm max_time.txt
					 
						    LONGITUD_MAYOR=0
						    while read linea
						    do
							    PARTIDA=$linea
							    LONGITUD=$(echo "$PARTIDA" | cut -f 7 -d "|")

							    if test $LONGITUD -gt $LONGITUD_MAYOR
							    then
								    LONGITUD_MAYOR=$LONGITUD
								    PARTIDA_MAYOR=$PARTIDA
							    fi
						    done < $ESTADISTICAS
					 
						    LONGITUD_MENOR=10000
						    while read linea
						    do
							    PARTIDA=$linea
							    LONGITUD=$(echo "$PARTIDA" | cut -f 7 -d "|")

							    if test $LONGITUD -lt $LONGITUD_MENOR
							    then
								    LONGITUD_MENOR=$LONGITUD
								    PARTIDA_MENOR=$PARTIDA
							    fi
						    done < $ESTADISTICAS
					 
						    echo -e "\t- Datos de la jugada de menor numero de movimientos: "
						    echo " ------------------------------------------------"
						    echo "$PARTIDA_MENOR" > min_long.txt
						    while IFS="|" read pid fecha comienzo fichacentral ganador tiempo longitud jugada
						    do
							    echo -e "\t$COLOR_PURPURA· Partida:$COLOR_CYAN $pid $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Fecha:$COLOR_CYAN $fecha $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Comienzo:$COLOR_CYAN $comienzo $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ficha central:$COLOR_CYAN $fichacentral $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ganador:$COLOR_CYAN $ganador $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Tiempo que ha durado:$COLOR_CYAN $tiempo segundos $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Longitud de la secuencia:$COLOR_CYAN $longitud $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Jugada:$COLOR_CYAN $jugada $QUITAR_COLOR"
						    done < min_long.txt
						    rm min_long.txt
						    
					 
						    echo -e "\t- Datos de la jugada de mayor numero de movimientos::"
						    echo " ------------------------------------------------"
						    echo "$PARTIDA_MAYOR" > max_long.txt
						    while IFS="|" read pid fecha comienzo fichacentral ganador tiempo longitud jugada
						    do
							    echo -e "\t$COLOR_PURPURA· Partida:$COLOR_CYAN $pid $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Fecha:$COLOR_CYAN $fecha $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Comienzo:$COLOR_CYAN $comienzo $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ficha central:$COLOR_CYAN $fichacentral $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Ganador:$COLOR_CYAN $ganador $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Tiempo que ha durado:$COLOR_CYAN $tiempo segundos $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Longitud de la secuencia:$COLOR_CYAN $longitud $QUITAR_COLOR"
							    echo -e "\t$COLOR_PURPURA· Jugada:$COLOR_CYAN $jugada $QUITAR_COLOR"
					 
						    done < max_long.txt
						    rm max_long.txt
					 
						    
					 
						    echo -e "\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"
						    read
						    clear
					 
						    else
						    clear
						    echo -e "$COLOR_ROJO\n\tEl fichero de ESTADÍSTICAS no existe.$QUITAR_COLOR"
						    echo -e "$COLOR_ROJO\tSelecciona 'JUGAR' en el menú, se creará después de jugar una partida.$QUITAR_COLOR"
						    echo -e "\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"
						    read
					    fi
				    fi          
			;;
			S)
				    echo -e "$COLOR_ROJO\n\t\t*-------*$QUITAR_COLOR"
				    echo -e "\t\t\e[101m  SALIR  \e[0m"
				    echo -e "$COLOR_ROJO\t\t*-------*$QUITAR_COLOR"
				    echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 3 segundos."
				    sleep 1
				    echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 2 segundos."
				    sleep 1
				    echo -e "$COLOR_AZUL\t\tEl programa se cerrará en 1 segundos.\n$QUITAR_COLOR"
				    sleep 1
				    clear
				    exit
			;;          
			*)
				    echo -e "\n\tLa opción introducida es $COLOR_ROJO incorrecta.$QUITAR_COLOR"
				    echo -e "\n\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"
				    read
				    clear
				    ;;
				    
			 
			esac
		done
		 
		else
			    clear
			    echo -e "$COLOR_ROJO\n\tERROR: Has invocado el programa de forma INCORRECTA$QUITAR_COLOR"
			    echo -e "\n\tEl programa se puede invocar de dos maneras:"
			    echo -e "\t./oxo.sh      (se ejecutará el OXO)."
			    echo -e "\t./oxo.sh -g  (se mostrarán los componentes del grupo)."
			    echo -e "\n\t\t$COLOR_AZUL Pulse INTRO para continuar$QUITAR_COLOR"
			    read
	fi
fi





