<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
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
<nav class="navbar navbar-expand-md bg-body-tertiary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<div style="display:flex; flex-direction:row;">
	    	<a style="font-weight: bold"class="dropdown-item" href="listadoUsuarios.jsp?id=<% out.print(id); %>">Listado Usuarios</a>
	    	<a style="font-weight: bold"class="dropdown-item ms-3" href="listOra.jsp?id=<% out.print(id); %>">Listado Oradores</a>
      	</div>
    </div>
    <div class="btn-group dropstart" style="background-color:rgba(0,0,0,0);">
	  <button type="button"  style="background-color:rgba(0,0,0,0); border-color: rgba(0,0,0,0)"class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	    <img alt="" src="<% out.print(foto); %>" class="img-fluid rounded-4 " width="40px">
	  </button>
	  <ul class="dropdown-menu">
	    <li><a class="dropdown-item" href="./login.jsp">Cerrar Sesion</a></li>
	  </ul>
	</div>
  </div>
</nav>