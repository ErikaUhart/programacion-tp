Algoritmo biblioteca_tp1_grupal
		//TRABAJO GRUPAL: AGOSTINA GAUTHIER, ERIKA UHART, MICAELA ORTIZ, OLAF DA COSTA Y ROCIO ARRUABARRENA 
		
		
		// Inicialización de variables
		Definir indiceLibro, LIMITE Como Entero
		Definir opcionn, indiceUsuario, estadoDeLibro, i, indi Como Entero
		Definir libros, usuarios Como Caracter
		Definir isbn, dniUsuario Como Caracter
		Definir disponible, estado, encontradoLibro, encontradoUsuario Como Logico
		
		// Inicialización de variables lógicas
		encontradoLibro = Falso
		disponible = Verdadero
		// Inicializamos la variable estado igual que la variable disponible
		estado = disponible
		encontradoUsuario = Falso
		
		// Inicializamos la variable límite
		LIMITE = 8
		
		// Definimos los arrays para guardar los datos de los libros y los usuarios.
		Dimensionar libros[LIMITE, 6] // ISBN, Titulo, Autor, Descripcion, Tematica, Estado
		Dimensionar usuarios[LIMITE, 8] // DNI, Apellido, Nombres, Celular, Dirección, Calle, Altura, Localidad
		
		// Inicializamos los índices
		estadoDeLibro = 0
		indiceLibro = 0
		indiceUsuario = 0
		
		opcionn = 0 // Inicializamos la opción
		
		Mientras opcionn <> 6 Hacer //De esta forma las opciones no quedan en un bucle
			Escribir "1. Registrar nuevo libro"
			Escribir "2. Registrar nuevo usuario"
			Escribir "3. Prestar libro"
			Escribir "4. Devolver libro"
			Escribir "5. Consultar estado de los libros"
			Escribir "6. Salir"
			Escribir "Seleccione una opción:"
			Leer opcionn
			
			//Usamos una condicion segun para que el usuario pueda elegir su opcion 
			Segun opcionn Hacer
				1:
					Escribir "Registro de nuevo libro" //Muestra en pantalla la opcion que se eligio 
					Escribir "Ingrese ISBN" //Le pedimos al usuario que ingrese el ISBN del libro 
					Leer libros[indiceLibro, 0] //Lee los datos ingresados por el usuario y lo guarda en la posicion 0 del contador
					Escribir "Ingrese Título" //Le pedimos al usuario que ingrese el titulo del libro 
					Leer libros[indiceLibro, 1] //Lee los datos ingresados por el usuario y lo guarda en la posicion 1 del contador 
					Escribir "Ingrese Autor" //Le pedimos al usuario que ingrese el autor del libro 
					Leer libros[indiceLibro, 2] //Lee los datos ingresados por el usuario y lo guarda en la posicion 2 del contador
					Escribir "Ingrese Descripción" //Le pedimos al usuario que ingrese la descripcion del libro 
					Leer libros[indiceLibro, 3] //Lee los datos ingresados por el usuario y lo guarda en la posicion 3 del contador
					Escribir "Ingrese Temática" //Le pedimos al usuario que ingrese la tematica del libro 
					Leer libros[indiceLibro, 4] //Lee los datos ingresados por el usuario y lo guarda en la posicion 4 del contador
					// Guardamos el estado inicial del libro como "disponible"
					libros[indiceLibro, 5] = "disponible" //Aca le esta asignando el estado de disponible al libro registrado y lo guarda en la posicion 5
					estadoDeLibro = estadoDeLibro + 1 //Incremente el estado de libro cada vez que se asigna disponible a un nuevo registro 
					indiceLibro = indiceLibro + 1 // Incrementa el indice del libro cada vez que se registre un nuevo libro 
					Escribir "Libro registrado." //Muestra este mensaje para confirmar con el usuario que el libro ya se registro 
					
				2:
					Escribir "Registro de nuevo usuario"
					Escribir "Ingrese DNI"
					Leer usuarios[indiceUsuario, 0]
					Escribir "Ingrese Nombre"
					Leer usuarios[indiceUsuario, 1]
					Escribir "Ingrese Apellido"
					Leer usuarios[indiceUsuario, 2]
					Escribir "Ingrese número de teléfono"
					Leer usuarios[indiceUsuario, 3]
					Escribir "Ingrese Dirección"
					Leer usuarios[indiceUsuario, 4]
					Escribir "Ingrese la calle de su dirección"
					Leer usuarios[indiceUsuario, 5]
					Escribir "Ingrese la altura de su dirección"
					Leer usuarios[indiceUsuario, 6]
					Escribir "Ingrese su localidad"
					Leer usuarios[indiceUsuario, 7]
					// Guardamos el estado inicial del usuario como "registrado"
					indiceUsuario = indiceUsuario + 1
					Escribir "Usuario registrado con éxito"
					
				3:
					Si indiceLibro > 0 Entonces //Confrimamos que por lo menos haya un l libro registrado y si es asi
						Escribir "Prestar libro" // se muestra en pantalla la opcion elegida 
						Escribir "Ingrese DNI del usuario" //Se pide al usuario que ingrese el dni para confirmar que el usuario existe 
						Leer dniUsuario // lo lee y lo guarda en dniUsuario 
						
						encontradoUsuario = Falso 
						//En esta parte del codigo se verifica que el usuario ya haya sido registrado antes de pedir un libro 
						//si es asi se cambia el estado de encontradoUsuario a verdadero y se muestra en pantalla 
						// que el usuario puede seguir con su pedido 
						Para indi = 0 Hasta indiceUsuario - 1 Hacer
							Si usuarios[indi, 0] = dniUsuario Entonces
								encontradoUsuario = Verdadero
								Escribir "Usuario encontrado."
								// No es necesario verificar el estado de registro aca, ya que el usuario se registró al añadir
							FinSi
						FinPara
						
						//Lo mismo que en el dni del usuario pasa en este caso del ISBN 
						Si encontradoUsuario Entonces
							Escribir "Ingrese ISBN del libro"
							Leer isbn
							encontradoLibro = Falso
							
							Para i = 0 Hasta indiceLibro - 1 Hacer //
								Si libros[i, 0] = isbn Entonces
									encontradoLibro = Verdadero //Una vez que se confirma que el libro existe se verifca si es que este libro 
									Si libros[i, 5] = "disponible" Entonces //esta disponible buscando en el contador de la opcion 1
										libros[i, 5] = "prestado" // y si esta disponible se cambia el estado a prestado 
										Escribir "Libro prestado con éxito."
									SiNo
										Escribir "El libro no está disponible."
									FinSi
								FinSi
							FinPara
							
							
							//En esta parte del codigo estan las posibles opciones de si no fue registrado el libro, o el usuario
							Si encontradoLibro = Falso Entonces
								Escribir "Libro no encontrado."
							FinSi
						SiNo
							Escribir "Usuario no registrado."
						FinSi
					SiNo
						Escribir "El registro del libro no ha sido inicializado."
					FinSi
					
				4:
					Escribir "Devolver libro"
					Escribir "Ingrese ISBN del libro a devolver" //Se pide a el usuario el ISBN del libro que se quiere devolver
					Leer isbn
					
					encontradoLibro = Falso 
					Para i = 0 Hasta indiceLibro - 1 Hacer //Recorre el registro de los libros 
						Si libros[i, 0] = isbn Entonces
							encontradoLibro = Verdadero //Se asegura que el libro exista 
							Si libros[i, 5] = "prestado" Entonces //Y verifica si es que ese libro fue prestado 
								libros[i, 5] = "disponible" //En ese caso se cambia el estado a disponible 
								Escribir "Libro devuelto con éxito." // Y muestra en pantalla que se devolvio 
							SiNo
								Escribir "El libro no estaba prestado." //En caso de que no se le avisa a el usuario que no fue prestado 
							FinSi
						FinSi
					FinPara
					
					//Estas lineas de codigo son en caso de que el libro no exista o no este registrado 
					Si encontradoLibro = Falso Entonces
						Escribir "Libro no encontrado."
					FinSi
					
				5:  Escribir "Consultar estado de los libros" //Muestra la opcion elegida por el usuario 
					Escribir "Ingrese ISBN" //Le pide que ingrese el isbn del libro al usuario 
					Leer  isbn //Una vez que se ingreso lee el isbn 
					
					Si estado == disponible Entonces //Si el estado del libro es igual a disponible 
						Escribir("El libro está disponible.") //Se muestra en pantalla esto 
					Sino Si estado <> disponible  Entonces //Si es distinto 
							Escribir("El libro está disponible.") //Se muestra esto 
						FinSi
					FinSi
				6:
					//Esta opcion es la de salida asi que solo va a mostrar en la pantalla que esta saliendo del menu 
					Escribir "Saliendo."
					
				De Otro Modo:
					Escribir "Opción no válida. Ingrese un número entre 1 y 6." //Asi termina el codigo y es en caso de que 
			FinSegun // se seleccione una opcion inexiste, muestra en pantalla el error y le recomienda a el usuario elegir otra opcion. 
			
		FinMientras

FinAlgoritmo
