Algoritmo SistemaReservasSalonBelleza
    Dimension turnos[20]; // Turnos tomados en la semana
    Dimension diasSemana[7];
    Dimension horarios[2];
    Dimension servicios[3]; // Cat�logo de servicios
	Dimension precios[3]; // Listado de precios
    Definir diaElegido, horarioElegido Como Cadena;
    Definir opcionMenu, cantTurno, cantidadServicios, servicioActualizar Como Entero;
	Dimension calendario[7,2]; // Estructura de datos para el calendario (7 d�as x 2 turnos)
	
	// Definir d�as y horarios disponibles
	diasSemana[1] <- "Lunes ";
	diasSemana[2] <- "Martes ";
	diasSemana[3] <- "Mi�rcoles ";
	diasSemana[4] <- "Jueves ";
	diasSemana[5] <- "Viernes ";
	diasSemana[6] <- "S�bado ";
	diasSemana[7] <- "Domingo ";
	horarios[1] <- "10:00 AM - 12:00 PM";
	horarios[2] <- "02:00 PM - 04:00 PM";
	
	// se inicializan los array y variables de servicios
	cantidadServicios <- 3; // Se inicializa con 3 servicios existentes
	
	// Lista de servicios predefinidos
	servicios[1] <- "Corte";
	servicios[2] <- "Peinado";
	servicios[3] <- "Manicura";
	
	// Precios iniciales de los servicios
	precios[1] <- 3000;
	precios[2] <- 5000;
	precios[3] <- 3500;
	
	// Se inicializa el calendario con todos los turnos como "disponible"
	Para  dia <- 1 Hasta 7 Hacer
		Para turno<- 1 Hasta 2 Hacer
			calendario[dia,turno] <- "Disponible";
		FinPara
	FinPara
	
	cantTurno <- 1; // Cantidad de turnos que reserva el usuario
	
	Mostrar "//==================================\\";
	Mostrar "||   ***   Sal�n de Belleza   ***   ||";
	Mostrar "||    ~   Sistema de Gesti�n   ~    ||";
	Mostrar "\\==================================//";
	
	// Men� principal
	Repetir
		Mostrar "";
		Mostrar "+------------------------------------+";
		Mostrar "|           Men� Principal           |";
		Mostrar "|====================================|";
		Mostrar "| [1] Reservar turnos                |";
		Mostrar "| [2] Listado de precios y servicios |";
		Mostrar "| [3] Ver calendario                 |";
		Mostrar "| [4] Salir                          |";
		Mostrar "+------------------------------------+";
		Mostrar ""
		Leer opcionMenu;
		
        // Reservar turnos
        Si (opcionMenu = 1) Entonces
            Repetir
				Mostrar "+------------------------------------+";
				Mostrar "|   Seleccione el d�a para el turno  |";
				Mostrar "+------------------------------------+";
				
				Para i <- 1 Hasta 7 Hacer
					diaTexto <- diasSemana[i] + "                           ";
					Mostrar "| (", i, ") ", Subcadena(diaTexto, 1, 30) " |"; // Asegura un ancho m�ximo de 30 caracteres
				Fin Para;
				
				Mostrar "+------------------------------------+";
				Leer diaElegido;
				
				Mostrar "+------------------------------------+";
				Mostrar "|      Seleccione un horario         |";
				Mostrar "+------------------------------------+";
				
				Para i <- 1 Hasta 2 Hacer
					horarioTexto <- horarios[i] + "                          ";
					Mostrar "| (", i, ") ", Subcadena(horarioTexto, 1, 30), " |"; // Asegura un ancho m�ximo de 30 caracteres
				Fin Para;
				
				Mostrar "+------------------------------------+";
				Leer horarioElegido;
				
                turnoElegido <- concatenar(concatenar(diasSemana[diaElegido], " "), horarios[horarioElegido]);
				
                Si cantTurno = 1 Entonces
                    // Es el primer turno, no se compara con otros
                    turnos[cantTurno] <- turnoElegido; // Se almacena el turno seleccionado en el arreglo turnos
					// Actualiza el calendario marcando el turno como "Ocupado"
					calendario[diaElegido,horarioElegido] <- "Ocupado";
                    Mostrar " *** Turno reservado exitosamente. ***";
					cantTurno <- cantTurno + 1;
                SiNo // del turno 2 en adelante...
                    Existe <- Falso; // Verdadero si encuentra un turno duplicado
                    Para i <- 1 Hasta cantTurno Hacer
                        Si turnos[i] = turnoElegido Entonces
                            Existe <- Verdadero;
                        Fin Si;
                    Fin Para;
					
                    Si Existe Entonces
                        Mostrar "|# El turno elegido ya est� ocupado #|";
						Mostrar "|#     Por favor, elija otro.       #|";
                    SiNo
						// Si NO existe un turno duplicado, se almacena en el arreglo turnos
                        turnos[cantTurno] <- turnoElegido;
						// Actualiza el calendario marcando el turno como "Ocupado"
						calendario[diaElegido,horarioElegido] <- "Ocupado";
                        Mostrar " *** Turno reservado exitosamente. ***";
						cantTurno <- cantTurno + 1;
                    Fin Si;
                Fin Si;
                
				Mostrar "                 ~~~                  ";
				Mostrar "|#    �Desea reservar otro turno?   #|";
				Mostrar "|#        (1: S� / 0: No)           #|";				
				Mostrar "                 ~~~                  ";
                Leer opcionMenu;
				Mostrar "                 ~~~                  ";
            Hasta Que opcionMenu = 0;
			
			// Mostrar lista de turnos ingresados
			Mostrar "+------------------------------------+";
			Mostrar "||    Lista de turnos ingresados    ||";
			Mostrar "+------------------------------------+";
			
			Para i <- 1 Hasta cantTurno - 1 Hacer // se resta uno para no mostrar el espacio vac�o
				Mostrar "| ", turnos[i], "    ~";
			Fin Para;
			
			Mostrar "+------------------------------------+";
			Mostrar "                 ~~~                  ";
		FinSi
		
		
		// Actualizar precios de servicios
		Si (opcionMenu == 2) Entonces
			
			Repetir
				Mostrar "+------------------------------------+";
				Mostrar "|      Servicios Disponibles         |";
				Mostrar "+------------------------------------+";
				
				Para i <- 1 Hasta cantidadServicios Hacer
					Mostrar "| [", i, "] ", Subcadena(servicios[i] + "                              ", 1, 17), " | $", precios[i], " |";
				Fin Para;
				
				Mostrar "+------------------------------------+";
				Mostrar "                 ~~~                  ";
				Mostrar "|-  �Desea actualizar los precios?  -|";
				Mostrar "|-        (1: S� / 0: No)           -|";
				Mostrar "                 ~~~                  ";
				Leer opcionMenu;
				Si opcionMenu = 1 Entonces
					Mostrar "                 ~~~                  ";
					Mostrar "|-  Seleccione el n�mero del        -|";
					Mostrar "|-  servicio que desea actualizar:  -|";
					Mostrar "                 ~~~                  ";
					Leer servicioActualizar;
					Mostrar "                 ~~~                  ";
					Mostrar "|-   Ingrese el nuevo precio para   -|";
					Mostrar "             * ", servicios[servicioActualizar], " *   ";
					Mostrar "                 ~~~                  ";
					Leer precios[servicioActualizar];
					Mostrar "                 ~~~                  ";
					Mostrar "| * Precio actualizado con �xito. *  |";
					Mostrar "                 ~~~                  ";
					Mostrar "                 ~~~                  ";
					Mostrar "|-  �Desea actualizar otro precio?  -|";
					Mostrar "|-        (1: S� / 0: No)           -|";
					Mostrar "                 ~~~                  ";
					Leer opcionMenu;
				Fin Si;
				
				
			Hasta Que opcionMenu = 0;
			
			// Se muestra la lista actualizada
			Mostrar "+------------------------------------+";
			Mostrar "||   Lista de precios actualizada   ||";
			Mostrar "+------------------------------------+";
			Para i <- 1 Hasta cantidadServicios Hacer
				Mostrar "| (", i, ") ", Subcadena(servicios[i] + "                              ", 1,17), " | $", precios[i], " |";
			Fin Para;
			Mostrar "+------------------------------------+";
			Mostrar "                 ~~~                  ";
		FinSi;
		
		
		// Calendario de turnos
		Si opcionMenu = 3 Entonces
			Repetir
				Mostrar "+------------------------------------+";
				Mostrar "|        Calendario de turnos        |";
				Mostrar "+------------------------------------+";
				
				Para dia <- 1 Hasta 7 Hacer
					Mostrar "+------------------------------------+";
					diaTexto <- diasSemana[dia] + "                       ";
					Mostrar "| D�a: ", Subcadena(diaTexto, 1, 29), " |";
					Mostrar "| T1: ", calendario[dia, 1], " | T2: ", calendario[dia, 2], " |";
					Mostrar "+------------------------------------+";
				FinPara
				
				Mostrar "�Desea volver al Men� Principal? (1: S� / 0: No)";
				Leer opcionMenu;
			Hasta Que opcionMenu = 1;
			
			Mostrar "                 ~~~                  ";		
		FinSi
		
	Hasta Que opcionMenu = 4;
	
FinAlgoritmo