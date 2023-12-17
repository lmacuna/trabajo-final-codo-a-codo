<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap demo</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<link rel="stylesheet" href="./css/inteBoot.css">
</head>

<body>
	<%
	ConexionDB conex=new ConexionDB();
	Statement st=conex.conectar();
	ResultSet rs;

	String id=request.getParameter("id");
	String na=new String();
	String foto=new String();
	if(id!=null) {
		
		rs=st.executeQuery("SELECT * FROM usuarios WHERE id="+id);
		rs.next();
		na=rs.getString("nombre") + " "+ rs.getString("apellido");
		foto="../images/" + rs.getString("fotoPerfil");
	}		
	%>
	<!-- Menu y Logo -->
	<header>
		<nav class="navbar navbar-expand-lg bg-body-tertiary bg-body-tertiary" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand ms-5" href="./inicio.jsp?id=<% out.print(id); %>">
					<img src="../images/codoacodo.png" alt="" class="w-25">
					Conf BsAs
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
					aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse me-5" id="navbarText">
					<ul class="navbar-nav me-auto"></ul>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
						</li>
						<li class="nav-item">
							<a class="nav-link text-white text-nowrap" href="./inicio.jsp?id=<% out.print(id); %>">La Conferencia</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-nowrap" href="./inicio.jsp?id=<% out.print(id); %>#theSpeakers">Lo Oradores</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-nowrap" href="./inicio.jsp?id=<% out.print(id); %>#thePlaceAndDate">El lugar y la fecha</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-nowrap" href="./inicio.jsp?id=<% out.print(id); %>#becomeSpeaker">Conviertete en orador</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-nowrap text-success" type="button" data-toggle="modal"
								data-target="#myModal" href="#">Comprar Tickets</a>
						</li>
					</ul>
					 <div class="btn-group dropstart" style="background-color:rgba(0,0,0,0);">
					  <button type="button"  style="background-color:rgba(0,0,0,0); border-color: rgba(0,0,0,0)"class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					    <img alt="" src="<% out.print(foto); %>" class="img-fluid rounded-4 " width="40px">
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="./login.jsp">Cerrar Sesion</a></li>
					  </ul>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<main>
		<section id="dicounts">
			<div class="d-flex justify-content-center flex-wrap mt-4 mb-2">
				<div data-aos="fade-down-right" class="card mx-1 mb-3" data-option="Estudiante">
					<div class="card-body">
						<div class="mb-3 text-center">
							<a class="btn btn-sm btn-success fw-bold">80% Off</a>
							<span class="card-title fw-bold">Estudiante</span>
						</div>
						<img src="../images/estudiante.jpg" class="card-img-top" alt="steve">
					</div>
				</div>
				<div data-aos="fade-right" class="card mx-1 mb-3 " data-option="Socio">
					<div class="card-body ">
						<div class="mb-3 text-center">
							<a class="btn btn-sm btn-warning fw-bold">35% Off</a>
							<span class="card-title fw-bold">Socio</span>
						</div>
						<img src="../images/socio.png" class="card-img-top" alt="steve">
					</div>
				</div>
				<div data-aos="fade-up-left" class="card mx-1 mb-3" data-option="Standard">
					<div class="card-body">
						<div class="mb-3 text-center">
							<a class="btn btn-sm btn-danger fw-bold">0% Off</a>
							<span class="card-title fw-bold">Standard</span>
						</div>
						<img src="../images/ticket.png" class="card-img-top" alt="steve">
					</div>
				</div>
			</div>
			<div class="w-100 row">
				<div class="col-lg-3 col-md-5 col-sm-10 m-auto">
					<form action="./inicio.jsp?id=<% out.print(id); %>" method="get">
						<div id="error-container" class="mb-3"></div>
						<div class="row ">
							<input type="text" name="nombre" id="nombre" placeholder="Nombre" class="mb-3 form-control">
							<input type="text" name="apellido" id="apellido" placeholder="Apellido"
								class="mb-3 form-control">
							<input type="text" name="mail" id="mail" placeholder="Mail" class="mb-3 form-control">
							<select name="tipo-entrada" id="descuento" class="mb-3 form-select">
								<option value="Standard">Standard</option>
								<option value="Estudiante">Estudiante</option>
								<option value="Socio">Socio</option>
							</select>
							<label>Cantidad</label>
							<input type="text" name="cantidad" id="cantidad" value="1" class="mb-4 form-control">
						</div>
						<div class="row">
							<div class="col mb-3 ju d-flex justify-content-center">
								<label class="w-25 ">Total: </label>
								<span id="total" class="me-5 ">0</span>
								<input id="sendGreenBtn" type="submit" value="Comprar" class="w-50 btn btn-success">
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>

	<!-- Foooter -->
	<footer class="text-white p-3">
		<div class="text-center col-12 col-md-11 col-lg-10 mx-auto">
			<a href="">Preguntas frecuentes</a>
			<a href="">Contactanos</a>
			<a href="">Prensa</a>
			<a href="">Conferencias</a>
			<a href="">Terminos y Condiciones</a>
			<a href="">Privacidad</a>
			<a href="">Estudiantes</a>
		</div>
	</footer>

	<!-- Librerias y Frameworks -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Comprar Ticket -->
	<script src="../js/comprar.js"></script>

</body>

</html>