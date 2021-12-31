<%-- 
    Document   : iniciarSesion
    Created on : 30 dic. 2021, 21:27:26
    Author     : edgar y lalo
--%>

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
            
        </style>
        
        <title>Ejercicio3</title>
    </head>
    <body>
        <div class="container">
            <main class="form-signin">
                <div class="p-5">
                    <form method="POST" action="ProcesarInicioSesion">
                        <h1 class="h3 my-3 fw-normal">Iniciar Sesión</h1>

                        <div class="form-floating">
                            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="name@example.com" >
                            <label for="usuario">Usuario</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Password" >
                            <label for="contrasena">Contraseña</label>
                        </div>
                        <button class="w-100 btn btn-lg btn-primary mt-3" type="submit">Iniciar Sesión</button>
                    </form>
                </div>

            </main>
        </div>
    </body>
</html>

