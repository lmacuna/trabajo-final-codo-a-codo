<!doctype html>

<%@page import="dao.OradorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Orador"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
  	<jsp:include page="menu.jsp"/>
	<div class="container">
		<div class="text-center fs-3 my-4">Listado Oradores</div>
		
		<% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded' id='msj'>");
				out.println(mensaje);
				out.println("</div>");
			} else {
				//TODO: eliminar div del mensaje
				
			}	
		%>			
		
		<button class="btn btn-primary my-3" data-bs-toggle='modal' data-bs-target='#addModal'>Agregar oradores</button>
		
		
		<table class="table table-striped text-center">
		  <thead class="table-dark">
		    <tr>
		      <th scope="col">#ID</th>
		      <th scope="col">Nombre</th>
		      <th scope="col">Apellido</th>
		      <th scope="col">email</th>
		      <th scope="col">Operaciones</th>
		    </tr>
		  </thead>
		  <tbody>
			<!-- dentro de estas etiquetas podemos programar en java -->
			<% 
			//conectarnos a la db, traer la tabla usuarios y generar un html para enviar al usuario
			
			OradorDAO oradorDAO=new OradorDAO();
			List<Orador> listOra=oradorDAO.listOradores();
			for(Orador orador: listOra){
				out.println("<tr>");
				
				out.println("<td>");
				out.println(orador.getId());
				out.println("</td>");

				out.println("<td>");
				out.println(orador.getNombre());
				out.println("</td>");
				
				out.println("<td>");
				out.println(orador.getApellido());
				out.println("</td>");
				
				out.println("<td>");
				out.println(orador.getEmail());
				out.println("</td>");
				
				out.println("<td>");
				out.println("<a href=''#' data-bs-toggle='modal' data-bs-target='#deleteModal' data-bs-whatever='"+orador.getId()+"'><i class='bi bi-trash-fill'></i></a>");
				out.println("<a href=''#' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='"+orador.getId()+"' nom='"+orador.getNombre()+"' ape='"+orador.getApellido()+"' email='"+orador.getEmail()+"'><i class='bi bi-pencil-fill'></i></a>");
				out.println("</td>");
				
				out.println("</tr>");				
			}
			
			
			
			
			%>		
		   
		   
		   
		  </tbody>
		</table>
		

		
	</div>    


	<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Orador</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="../controller/addOrador.jsp?id=<% out.print(id); %>" method="post">
	          <div class="mb-3 text-center">
	            <input type="text" class="form-control mb-3" id="nomAdd" name="nomAdd" placeholder="Nombre">
	            <input type="text" class="form-control mb-3" id="apeAdd" name="apeAdd" placeholder="Apellido">
	            <input type="text" class="form-control mb-3" id="emailAdd" name="emailAdd" placeholder="Email">
	            <input type="text" class="form-control mb-3" id="dniAdd" name="dniAdd" placeholder="DNI">
	            <input type="text" class="form-control mb-3" id="fotoAdd" name="fotoAdd" placeholder="Nombre del archivo de la foto de perfil(con extension)">
	            <textarea rows="4" class="form-control mb-3" id="temasAdd" name="temasAdd" placeholder="Temas del que hablará"></textarea>
	          </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="submit" class="btn btn-primary">Agregar</button>
		      </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

	
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Orador</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="../controller/updOrador.jsp?id=<% out.print(id); %>" method="post">
	          <div class="mb-3 text-center">
	            <input type="hidden" class="form-control mb-3" id="idUpd" name=idUpd>
	            <input type="text" class="form-control mb-3" id="nom" name="nom">
	            <input type="text" class="form-control mb-3" id="ape" name="ape">
	            <input type="text" class="form-control mb-3" id="email" name="email">
	          </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="submit" class="btn btn-primary">Modificar</button>
		      </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Orador</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="../controller/delOrador.jsp?id=<% out.print(id); %>" method="post">
	          <div class="mb-3 text-center">
	            <label for="recipient-name" class="col-form-label">¿Desea eleminar el orador?</label>
	            <input type="hidden" class="form-control" id="recipient-name" name="idDel">
	          </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="submit" class="btn btn-primary">Eliminar</button>
		      </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="js/listOra.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>