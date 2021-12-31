<%-- 
    Document   : datosProducto
    Created on : 17 oct. 2021, 14:55:27
    Author     : edgar y lalo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
        <style type="text/css">
            *{
              padding: 0;
              margin: 0;
             }
             
             body{
                 background-image:url('http://www.defondos.com/images/wallpapers/white%20wallpaper%20(30)-991074_800.jpeg');
                 background-size:cover;
             }
             
             .navbar{
                 font-size: 120%;
             }
            
        </style>
        <title>Datos de Producto</title>
    </head>
    <body>

        <div class="container">


            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="/imagenes/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
                        Práctica Final
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CategoriaServlet?accion=listaDeCategorias">Listado De Categorias</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CategoriaServlet?accion=nuevo">Nueva Categoria</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ProductoServlet?accion=listaDeProductos">Listado de Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ProductoServlet?accion=nuevo">Nuevo Producto</a>
                            </li>
                           <li class="nav-item">
                                                            <a class="nav-link" href="UsuarioServlet?accion=listaDeUsuarios">Listado de Usuarios</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="UsuarioServlet?accion=nuevo">Nuevo Usuario</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <br/>
            <br/>

            <div class="card bg-light">
                <div class="card-header">
                    <h3 class="text-center">Datos de Producto</h3>
                </div>
                <div class="card-body">
                    <center>
                        <img src="https://media.istockphoto.com/vectors/preparing-of-shipping-a-product-drawing-vector-id480022196" alt="" width="250" class="d-inline-block align-text-top">
                        <ul class="list-group">
                            <li class="list-group-item">
                                
                                <c:out value="${producto.entidad.idProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.nombreProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.descripcionProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.precio}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.existencia}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.stockMinimo}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.claveCategoria}" />
                            </li>
                        </ul>
                    </center>
                </div>
            </div>

        </div>
    </body>
</html>
