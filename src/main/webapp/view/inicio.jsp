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
                <a class="navbar-brand ms-5" href="#">
                    <img src="images/codoacodo.png" alt="" class="w-25">
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
                            <a class="nav-link text-white text-nowrap" href="#theConference">La Conferencia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-nowrap" href="#theSpeakers">Lo Oradores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-nowrap" href="#thePlaceAndDate">El lugar y la fecha</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-nowrap" href="#becomeSpeaker">Conviertete en orador</a>
                        </li>
                        <li class="nav-item">
                            <!--a class="nav-link text-nowrap text-success"  type="button" data-toggle="modal" data-target="#myModal" href="#" >Comprar Tickets</a-->
                            <a class="nav-link text-nowrap text-success"  type="button" href="./tickets.jsp?id=<% out.print(id); %>" >Comprar Tickets</a>
                        </li>
                        <li class="nav-item">
                            
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
    
     <!-- La Conferencia ( Carrusel ) -->
    <main>
        <section id="theConference">
            <div id="carouselExampleCaptions" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/ba1.jpg" class="d-block w-100 contrast" alt="b">
                        <div class="carousel-caption d-block">
                            <div class="row mb-3">
                                <div class="col-0 col-lg-4">
                
                                </div>
                                <div class="col-12 col-lg-8 mb-5 text-center text-lg-end">
                                    <h5 class="fs-3">Conf Bs As</h5>
                                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere asperiores, eveniet inventore nobis
                                        pariatur quas, labore ut expedita repellendus itaque cumque odio distinctio maxime ipsam eum dolorum
                                        reprehenderit ratione unde.</p>
                                    <div class="mb-4">
                                        <a href="#becomeSpeaker" class="btn btn-outline-light">Quiero ser orador</a>
                                        <!--a href="" class="btn btn-success" type="button" data-toggle="modal" data-target="#myModal">Comprar Ticket</a-->
                                        <a href="./tickets.jsp?id=<% out.print(id); %>" class="btn btn-success" type="button">Comprar Ticket</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/ba2.jpg" class="d-block w-100 contrast" alt="a">
                        <div class="carousel-caption d-block">
                            <div class="row mb-3">
                                <div class="col-0 col-lg-4">
                
                                </div>
                                <div class="col-12 col-lg-8  mb-5 text-center text-lg-end">
                                    <h5 class="fs-3">Conf Bs As</h5>
                                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere asperiores, eveniet inventore nobis
                                        pariatur quas, labore ut expedita repellendus itaque cumque odio distinctio maxime ipsam eum dolorum
                                        reprehenderit ratione unde.</p>
                                    <div class="mb-4">
                                        <a href="#becomeSpeaker" class="btn btn-outline-light">Quiero ser orador</a>
                                        <!--a href="" class="btn btn-success" type="button" data-toggle="modal" data-target="#myModal">Comprar Ticket</a-->
                                        <a href="./tickets.jsp?id=<% out.print(id); %>" class="btn btn-success" type="button">Comprar Ticket</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/ba3.jpg" class="d-block w-100 contrast" alt="c">
                        <div class="carousel-caption d-block">
                            <div class="row mb-3">
                                <div class="col-0 col-lg-4">
                
                                </div>
                                <div class="col-12 col-lg-8  mb-5 text-center text-lg-end">
                                    <h5 class="fs-3">Conf Bs As</h5>
                                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere asperiores, eveniet inventore nobis
                                        pariatur quas, labore ut expedita repellendus itaque cumque odio distinctio maxime ipsam eum dolorum
                                        reprehenderit ratione unde.</p>
                                    <div class="mb-4">
                                        <a href="#becomeSpeaker" class="btn btn-outline-light">Quiero ser orador</a>
                                        <!--a href="" class="btn btn-success" type="button" data-toggle="modal" data-target="#myModal">Comprar Ticket</a-->
                                        <a href="./tickets.jsp?id=<% out.print(id); %>" class="btn btn-success" type="button">Comprar Ticket</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>


     <!-- Los Oradores ( Las tarjetas ) -->
        <section id="theSpeakers">
            <header class="text-center m-3">
                <div class="fs-7">
                    CONOCE A LOS 
                </div>
                <div class="fs-4">
                    ORADORES
                </div>
            </header>

    <div class="d-flex justify-content-center flex-wrap">

		<%
		rs=st.executeQuery("SELECT * FROM oradores");
        while(rs.next()) {
        	out.println("<div data-aos='fade-right' class='card mx-1 mb-3' style='width: 18rem;'>");
        	out.println("<img src='"+"../images/"+rs.getString("fotoPerfil")+"' class='card-img-top' alt='"+rs.getString("nombre")+"'>");
        	out.println("<div class='card-body'>");
        	out.println("<div class='botones mb-3'>");
        	out.println("<a href='#' class='btn btn-sm btn-warning'>Javascript</a>");
        	out.println("<a href='#' class='btn btn-sm btn-info text-light'>React</a>");
        	out.println("</div>");
        	out.println("<h5 class='card-title'>"+rs.getString("nombre") +" "+ rs.getString("apellido") +"</h5>");
        	out.println("<p class='card-text'>"+rs.getString("temas")+"</p>");
        	out.println("</div>");
        	out.println("</div>");
        }
		
		%>
            </div>
        </section>
<!-- El Lugar y la Fecha -->
        <section id="thePlaceAndDate" class="container-fluid mb-5 " style="overflow: hidden;">
            <div class="row ">
                <div data-aos="fade-right" class="col-lg p-0">
                    <img src="images/honolulu.jpg" alt="honolulu" class="img-fluid">
                </div>
                <div data-aos="fade-left" class="p-4 col-lg text-white bg-body-secondary" data-bs-theme="dark">
                    <div class="fs-4 mt-1 mb-3">
                        BsAs - Octubre
                    </div>
                    <div class="mb-3">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eligendi eos voluptates quo esse consectetur aut, cupiditate voluptas laborum. Animi a architecto unde, commodi itaque enim asperiores iste consequuntur excepturi vel.
                    </div>
                    <div>
                        <a href="#" class="btn btn-outline-light">Conocé más</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Conviertete en Orador ( Formulario ) -->
        <section id="becomeSpeaker" class="container text-center mb-3">
            <div class="row">
                <div class="col-12 col-md-10 col-lg-8 mx-auto">
                    <div class="mt-2 mb-1">
                        CONVIÉRTETE EN UN 
                    </div>
                    <div class="fs-3">
                        ORADOR
                    </div>
                    <div class="mb-3">
                        Anótate como orador para dar una charla ignite. Cuentanos de que quieres hablar! 
                    </div >
                    <div>
                        <form action="inicio.jsp" method="get">
                            <div class="row ">
                                <div class="col-md mb-3">
                                    <input type="text" name="nombre" id="nombre" placeholder="Nombre" class="form-control">
                                </div>
                                <div class="col-md mb-3">
                                    <input type="text" name="apellido" id="apellido" placeholder="Apellido" class="form-control">
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-md mb-3">
                                    <textarea name="tema" id="tema" rows="5" class="form-control" placeholder="Sobre que querés hablar?"></textarea>
                                    <div class="small text-start">Recuerda incluir un título para tu charla</div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col mb-3">
                                    <input id="sendGreenBtn" onclick="alert('Solicitud enviada con exito');" type="submit" value="Enviar" class="w-100 btn btn-success">
                                </div>
                            </div>
                        </form>
                    </div>
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
  
    <!-- Comprar Ticket ( Ventana emergente ) -->
    <article class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <header class="modal-header">
                    <h4 class="modal-title">Compra de Producto</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </header>
                <section class="modal-body">
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" class="form-control" placeholder="Ingrese la cantidad">
                    <br>
                    <p>Precio Unitario: $50</p>
                    <p>Total a pagar: <span id="total">0</span></p>
                </section>
                <footer class="modal-footer">
                    <button type="button" class="btn btn-success" id="comprar">Comprar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </footer>
            </div>
        </div>
    </article>
  
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
    
</body>

</html>