Algoritmo SistemaReservasSalonBelleza
    Dimension turnos[20]; // Turnos tomados en la semana
    Dimension diasSemana[7];
    Dimension horarios[2];
    Dimension servicios[3]; // Catálogo de servicios
	Dimension precios[3]; // Listado de precios
    Definir diaElegido, horarioElegido Como Cadena;
    Definir opcionMenu, cantTurno, cantidadServicios, servicioActualizar Como Entero;
	Dimension calendario[7,2]; // Estructura de datos para el calendario (7 días x 2 turnos)
	
	// Definir días y horarios disponibles
	diasSemana[1] <- "Lunes ";
	diasSemana[2] <- "Martes ";
	diasSemana[3] <- "Miércoles ";
	diasSemana[4] <- "Jueves ";
	diasSemana[5] <- "Viernes ";
	diasSemana[6] <- "Sábado ";
	diasSemana[7] <- "Domingo ";
	horarios[1] <- "10:00 AM - 12:00 PM";
	horarios[2] <- "2:00 PM - 4:00 PM";
	
	// Se inicializa el calendario con todos los turnos como "disponible"
	Para  dia <- 1 Hasta 7 Hacer
		Para turno<- 1 Hasta 2 Hacer
			calendario[dia,turno] <- "Disponible";
		FinPara
	FinPara
	
	cantTurno <- 1; // Cantidad de turnos que reserva el usuario
	
    // Menú principal
    Repetir
        Escribir "¿Qué desea hacer?";
        Escribir "1. Reservar turnos";
        Escribir "2. Listado de precios y servicios";
		Escribir "3. Ver calendario";
        Escribir "4. Salir";
        Leer opcionMenu;
		
        // Reservar turnos
        Si (opcionMenu = 1) Entonces
            Repetir
                Mostrar "Seleccione el día para el turno:";
                Para i <- 1 Hasta 7 Hacer
                    Mostrar i, ". ", diasSemana[i];
                Fin Para;
                Leer diaElegido;
				
                Mostrar "Ahora seleccione un horario:";
                Para i <- 1 Hasta 2 Hacer
                    Mostrar i, ". ", horarios[i];
                Fin Para;
                Leer horarioElegido;
				
                turnoElegido <- concatenar(concatenar(diasSemana[diaElegido], " "), horarios[horarioElegido]);
				
                Si cantTurno = 1 Entonces
                    // Es el primer turno, no se compara con otros
                    turnos[cantTurno] <- turnoElegido; // Se almacena el turno seleccionado en el arreglo turnos
					// Actualiza el calendario marcando el turno como "Ocupado"
					calendario[diaElegido,horarioElegido] <- "Ocupado";
                    Mostrar "Turno reservado exitosamente.";
					cantTurno <- cantTurno + 1;
                SiNo // del turno 2 en adelante...
                    Existe <- Falso; // Verdadero si encuentra un turno duplicado
                    Para i <- 1 Hasta cantTurno Hacer
                        Si turnos[i] = turnoElegido Entonces
                            Existe <- Verdadero;
                        Fin Si;
                    Fin Para;
					
                    Si Existe Entonces
                        Mostrar "El turno seleccionado ya está ocupado. Por favor, elija otro.";
                    SiNo
						// Si NO existe un turno duplicado, se almacena en el arreglo turnos
                        turnos[cantTurno] <- turnoElegido;
						// Actualiza el calendario marcando el turno como "Ocupado"
						calendario[diaElegido,horarioElegido] <- "Ocupado";
                        Mostrar "Turno reservado exitosamente.";
						cantTurno <- cantTurno + 1;
                    Fin Si;
                Fin Si;
                
                Mostrar "¿Desea reservar otro turno? (1: Sí / 0: No)";
                Leer opcionMenu;
				
            Hasta Que opcionMenu = 0;
			
            // Mostrar lista de turnos ingresados
            Mostrar "Lista de turnos ingresados:";
            Para i <- 1 Hasta cantTurno -1  Hacer // se resta uno para no mostrar el espacio vacío
                Mostrar turnos[i];
            Fin Para;
		FinSi
		
		// Actualizar precios de servicios
		Si (opcionMenu == 2) Entonces
			cantidadServicios <- 3; // Se inicializa con 3 servicios existentes
			
			// Lista de servicios predefinidos
			servicios[1] <- "Corte";
			servicios[2] <- "Peinado";
			servicios[3] <- "Manicura";
			
			// Precios iniciales de los servicios
			precios[1] <- 3000;
			precios[2] <- 5000;
			precios[3] <- 3500;
			
			Repetir
				Mostrar "Servicios disponibles:";
				Para i <- 1 Hasta cantidadServicios Hacer
					Mostrar i, ". ", servicios[i], " - Precio: $", precios[i];
				Fin Para;
				
				Mostrar "¿Desea actualizar los precios? (1: Sí / 0: No)";
				Leer opcionMenu;
				Si opcionMenu = 1 Entonces
					Mostrar "Seleccione el número del servicio que desea actualizar:";
					Leer servicioActualizar;
					Mostrar "Ingrese el nuevo precio para ", servicios[servicioActualizar], ":";
					Leer precios[servicioActualizar];
					Mostrar "Precio actualizado exitosamente.";
					Mostrar "¿Desea actualizar otro precio? (1: Sí / 0: No)";
					Leer opcionMenu;
				Fin Si;
				
				
				
			Hasta Que opcionMenu = 0;
			
			// Se muestra la lista actualizada
			Mostrar "Lista de servicios y precios actualizados:";
			Para i <- 1 Hasta cantidadServicios Hacer
				Mostrar "Servicio: ", servicios[i], " - Precio: $", precios[i];
			Fin Para;
		FinSi;
		
		
		// Ver calendario y disponibilidad de turnos
        Si opcionMenu = 3 Entonces
            Mostrar "Calendario de turnos:";
			Para dia <- 1 Hasta 7 Hacer
				Mostrar diasSemana[dia] , ":";
				Para turno <- 1 Hasta 2 Hacer
					Si calendario[dia,turno] = "Disponible" Entonces
						Mostrar "Turno " , turno , ": Disponible;";
					SiNo
						Mostrar "Turno " , turno , ": Ocupado;";
					Fin Si
				Fin Para
			Fin Para
        Fin Si
		
	Hasta Que opcionMenu = 4;
	
FinAlgoritmo