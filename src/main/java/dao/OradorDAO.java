package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.ConexionDB;
import model.Orador;

/**
 * Concentra todas las consultas, modificaiones,
 * eliminaciones y creaciones en la tabla Oradores.
 * Select, insert, update, delete
 * 
 * @author Santos
 *
 */
public class OradorDAO {
	
	public List<Orador> listOradores() {
		ConexionDB conex=new ConexionDB();
		Statement st=conex.conectar();
		ResultSet rs;
		List<Orador> listOra=new ArrayList<Orador>();
		try {
			rs = st.executeQuery("SELECT * FROM oradores");
			//transformar un resultset en una lista de objetos orador
			//cambiamos de un modelo relacional de la DB a un POO
			
			while(rs.next()) {
				Orador ora=new Orador();
				ora.setId(rs.getInt("id"));
				ora.setNombre(rs.getString("nombre"));
				ora.setApellido(rs.getString("apellido"));
				ora.setFotoPerfil(rs.getString("fotoPerfil"));
				ora.setEmail(rs.getString("email"));
				listOra.add(ora);
			}			
			
		} catch (SQLException e) {
			// eror del sistema, email a los desarrolladores
			System.out.println("Error en el sitema");
			e.printStackTrace();
		}
		

		
		return listOra;
	}

}
