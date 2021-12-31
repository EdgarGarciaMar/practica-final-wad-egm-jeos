/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.ProductoDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edgar y lalo
 */
public class ProductoDAO {
    
    private static final String SQL_INSERT="call spInsertarProducto(?,?,?,?,?,?)";
    private static final String SQL_UPDATE = "update producto set nombreproducto = ?, descripcionproducto = ?, precio = ?, existencia = ?, stockminimo = ?, clavecategoria = ? where idproducto = ?";
    private static final String SQL_DELETE="call spEliminarProducto(?)";
    private static final String SQL_READ="select * from seleccionarProducto(?)";
    private static final String SQL_READ_ALL="select * from seleccionaTodoProducto()";
    
    private Connection conexion;
    
//    private void conectar(){
//        String user = "postgres";
//        String pwd = "admin";
//        String url="jdbc:postgresql://localhost:5432/Base3CM13";
//        String pgDriver = "org.postgresql.Driver";
//        
//        try{
//            Class.forName(pgDriver);
//            conexion = DriverManager.getConnection(url, user, pwd);
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//    };
    
//    private void conectar(){
//        String user = "iewcorrxmgvsmo";
//        String pwd = "a7750a2841c65540faa134f8c25978da1ea8dd72aaca9a853f0c30f2ac424fb7";
//        String url="jdbc:postgresql://ec2-44-198-24-0.compute-1.amazonaws.com:5432/d5luuaqm2h0rv1";
//        String pgDriver = "org.postgresql.Driver";
//        
//        try{
//            Class.forName(pgDriver);
//            conexion = DriverManager.getConnection(url, user, pwd);
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//    };
    
    public Connection conectar(){
        String user = "hbxntbcggfqvpw";
        String pwd = "f37cb4cb0eda164e5e14785687995c70a23efe1e7112d2fbb3821d1efe340987";
        String url="jdbc:postgresql://ec2-34-236-87-247.compute-1.amazonaws.com:5432/d15ql48g1bj9mp";
        String pgDriver = "org.postgresql.Driver";
        
        try{
            Class.forName(pgDriver);
            conexion = DriverManager.getConnection(url, user, pwd);
        }catch(Exception e){
            e.printStackTrace();
        }
        return conexion;
    }
        
    
    public void create(ProductoDTO dto) throws SQLException{
        conectar();
        PreparedStatement ps = null;
        try{
            ps = conexion.prepareStatement(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombreProducto());
            ps.setString(2, dto.getEntidad().getDescripcionProducto());
            ps.setFloat(3, dto.getEntidad().getPrecio());
            ps.setInt(4, dto.getEntidad().getExistencia());
            ps.setInt(5, dto.getEntidad().getStockMinimo());
            ps.setInt(6, dto.getEntidad().getClaveCategoria());
            
            ps.executeUpdate();
            
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.INFO, null, "Almacenado correctamente");
        }finally{
            if(ps != null)
                ps.close();
            
            if (conexion != null)
                conexion.close();
        }
    }
    
    public void Update(ProductoDTO dto)throws SQLException{
        conectar();
        PreparedStatement ps = null;
        try{
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombreProducto());
            ps.setString(2, dto.getEntidad().getDescripcionProducto());
            ps.setFloat(3, dto.getEntidad().getPrecio());
            ps.setInt(4, dto.getEntidad().getExistencia());
            ps.setInt(5, dto.getEntidad().getStockMinimo());
            ps.setInt(6, dto.getEntidad().getClaveCategoria());
            ps.setInt(7, dto.getEntidad().getIdProducto());
            ps.executeUpdate();
        }finally{
            if(ps !=null){
                ps.close();
            }
            if(conexion != null){
                conexion.close();
            }
        }
    }
    
    public void delete(ProductoDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        try{
            ps = conexion.prepareCall(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdProducto());
            ps.executeUpdate();
        }finally{
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }
    
    public ProductoDTO read(ProductoDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;
        
        try{
            ps = conexion.prepareCall(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdProducto());
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            
            if(resultados.size()>0)
                return (ProductoDTO)resultados.get(0);
            else
                return null;
        }finally{
            if(rs != null)
                rs.close();
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }
    
    public List readAll() throws SQLException{
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;
        
        try{
            ps = conexion.prepareCall(SQL_READ_ALL);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if(resultados.size() > 0)
                return resultados;
            else
                return null;
        }finally{
            if(rs != null)
                rs.close();
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while(rs.next()){
            ProductoDTO dto =  new ProductoDTO();
            dto.getEntidad().setIdProducto(rs.getInt("idProducto"));
            dto.getEntidad().setNombreProducto(rs.getString("nombreProducto"));
            dto.getEntidad().setDescripcionProducto(rs.getString("descripcionProducto"));            
            dto.getEntidad().setPrecio(rs.getFloat("precio"));
            dto.getEntidad().setExistencia(rs.getInt("existencia"));
            dto.getEntidad().setStockMinimo(rs.getInt("stockMinimo"));
            dto.getEntidad().setClaveCategoria(rs.getInt("claveCategoria"));
            resultados.add(dto);
        }
        return resultados;
    }
    
    public static void main (String [] args){
        ProductoDAO dao = new ProductoDAO();
        ProductoDTO dto = new ProductoDTO();
        
        dto.getEntidad().setIdProducto(1);
        dto.getEntidad().setNombreProducto("Huawei");
        dto.getEntidad().setDescripcionProducto("Menos");
        dto.getEntidad().setPrecio(1000);
        dto.getEntidad().setExistencia(54);
        dto.getEntidad().setStockMinimo(10);
        dto.getEntidad().setClaveCategoria(1);
        
        try {
//            dao.create(dto);
            //dao.update(dto);
            System.out.println(dao.readAll());
            //System.out.println(dao.read(dto));
            //dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
