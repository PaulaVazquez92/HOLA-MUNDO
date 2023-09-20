Algoritmo SistemaReservasSalonBelleza
    Dimension turnos[20]; // Turnos tomados en la semana
    Dimension diasSemana[7];
    Dimension horarios[2];
    Dimension productos[10]; // Catálogo de productos y servicios
    Definir diaElegido, horarioElegido, productoNuevo Como Cadena;
    Definir opcionMenu, cantTurno, cantidadProductos Como Entero;
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
	

    // Menú principal
    Repetir
        Escribir "¿Qué desea hacer?";
        Escribir "1. Reservar turnos";
        Escribir "2. Mantener catálogo de productos y servicios";
		Escribir "3. Ver calendario";
        Escribir "4. Salir";
        Leer opcionMenu;
		
        // Reservar turnos
        Si (opcionMenu = 1) Entonces

            cantTurno <- 1; // Cantidad de turnos que reserva el usuario
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
                SiNo
                    Existe <- Falso; // Verdadero si encuentra un turno duplicado
                    Para i <- 1 Hasta cantTurno Hacer
                        Si turnos[i] = turnoElegido Entonces
                            Existe <- Verdadero;
                        Fin Si;
                    Fin Para;
					
                    Si Existe Entonces
                        Mostrar "El turno seleccionado ya está ocupado. Por favor, elija otro.";
                    SiNo
						// Si no existe un turno duplicado, se almacena en el arreglo turnos
                        turnos[cantTurno] <- turnoElegido;
						// Actualiza el calendario marcando el turno como "Ocupado"
						calendario[diaElegido,horarioElegido] <- "Ocupado";
                        Mostrar "Turno reservado exitosamente.";
                    Fin Si;
                Fin Si;
                cantTurno <- cantTurno + 1;
                Mostrar "¿Desea reservar otro turno? (1: Sí / 0: No)";
                Leer opcionMenu;
            Hasta Que opcionMenu = 0;
			
            // Mostrar lista de turnos ingresados
            Mostrar "Lista de turnos ingresados:";
            Para i <- 1 Hasta cantTurno-1  Hacer // Restar el turno adicional
                Mostrar turnos[i];
            Fin Para;
		FinSi
		
		// Mantener catálogo de productos y servicios
		Si (opcionMenu == 2) Entonces
			cantidadProductos <- 1; // se usa como índice de productos[]
			Repetir
				Mostrar "Ingrese el nombre del producto o servicio:";
				Leer productoNuevo;
				productos[cantidadProductos] <- productoNuevo;
				cantidadProductos <- cantidadProductos + 1;
				Mostrar "¿Desea ingresar otro producto o servicio? (1: Sí / 0: No)";
				Leer opcionMenu;
			Hasta Que opcionMenu = 0;
			
			// Mostrar lista de productos y servicios ingresados
			Mostrar "Lista de productos y servicios ingresados:";
			Para i <- 1 Hasta cantidadProductos Hacer
				Mostrar productos[i];
			Fin Para;
		FinSi;
		
		// Ver calendario
        Si opcionMenu = 3 Entonces
            Mostrar "Calendario de turnos:";
            MostrarCalendario(diasSemana, calendario);
        Fin Si
	Hasta Que opcionMenu = 4;
FinAlgoritmo

// Función para mostrar el calendario
Funcion  MostrarCalendario(diasSemana, calendario)
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
Fin Funcion

