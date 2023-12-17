<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<% 
	String id=request.getParameter("id");
	String idUpd=request.getParameter("idUpd");
	String nom=request.getParameter("nom");
	String ape=request.getParameter("ape");
	String email=request.getParameter("email");
	
	ConexionDB conex=new ConexionDB();
	Statement st=conex.conectar();
	try{
		Integer updateOk=st.executeUpdate("UPDATE oradores SET nombre='"+nom+"', apellido='"+ape+"', email='"+email+"' WHERE id="+idUpd);
		
		if(updateOk==1) {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20se%20modificó%20exitosamente&id=" + id);
		} else {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20no%20se%20pudo%20modificar&id="+ id);
		}

	}
	catch(Exception e){
		response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20no%20se%20pudo%20modificar&id="+ id);

	}
	
	
	

%>