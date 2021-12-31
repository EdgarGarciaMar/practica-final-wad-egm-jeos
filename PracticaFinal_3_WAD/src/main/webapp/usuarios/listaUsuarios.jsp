<%-- 
    Document   : listaProductos
    Created on : 17 oct. 2021, 14:22:57
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
        <title>Usuarios</title>
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
            
            <br>
            <h1>Usuarios</h1>
            <br><br>
            
            <div>
                <div class="card-header text-center" style="font-size:120%">
                    Usuarios
                </div>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="UsuarioServlet?accion=nuevo" class="btn btn-outline-success">Crear Usuario</a>
                    </h4>
                    
                    <c:if test="${mensaje != null}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>${mensaje}</strong>
                            <button class="btn-close" data-bs-dismiss="alert" aria-lbel="Close"></button>
                        </div>
                    </c:if>
                    
                    <table class="table table-dark">
                        <thead>
                            <tr class="table-active">
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Paterno</th>
                                <th>Materno</th>
                                <th>Email</th>
                                <th>Tipo Usuario</th>
                                <th>Eliminar</th>
                                <th>Actualizar</th>
                            </tr>
                        </thead>
                        <c:forEach var="dto" items="${listaDeUsuarios}">
                        <tbody>
                            <tr class="table table-dark">
                                <td class="table-active">
                                    <a href="UsuarioServlet?accion=ver&id=<c:out value="${ dto.entidad.idUsuario }"/>" class="btn btn-warning">
                                        <c:out value="${ dto.entidad.idUsuario }"/>
                                    </a>
                                </td>
                                <td class="table-primary">
                                    <c:out value="${ dto.entidad.nombre }"/>
                                </td>
                                <td class="table-primary">
                                    <c:out value="${ dto.entidad.paterno }"/>
                                </td>
                                <td class="table-primary">
                                    <c:out value="${ dto.entidad.materno }"/>
                                </td>
                                <td class="table-primary">
                                    <c:out value="${ dto.entidad.email }"/>
                                </td>
                                <td class="table-primary">
                                    <c:out value="${ dto.entidad.tipoUsuario }"/>
                                </td>
                                <td class="table-primary">
                                    <a href="UsuarioServlet?accion=eliminar&id=<c:out value="${ dto.entidad.idUsuario }"/>" class="btn btn-outline-danger">Eliminar</a>
                                </td>
                                <td class="table-primary">
                                    <a href="UsuarioServlet?accion=actualizar&id=<c:out value="${ dto.entidad.idUsuario }"/>" class="btn btn-outline-success">Actualizar</a>
                                </td>
                            </tr>
                        </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
