<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<% 
String idDel=request.getParameter("idDel");
String id=request.getParameter("id");

	ConexionDB conex=new ConexionDB();
	Statement st=conex.conectar();
	try{
		Integer deleteOk=st.executeUpdate("DELETE FROM oradores WHERE id="+idDel);
		
		if(deleteOk==1) {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20se%20eliminó%20exitosamente&id="+ id);
		} else {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20no%20se%20puedo%20eliminar&id="+ id);
		}

	}
	catch(Exception e){
		response.sendRedirect("../view/listOra.jsp?mensaje=El%20usuario%20no%20se%20puedo%20eliminar&id="+ id);
	}
	
	
	

%>