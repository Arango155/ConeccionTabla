
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Alumno</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        
        
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                min-height: 100vh;
                background-image: url("img/fondo2.jpg");
                background-size: 100%;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        
        
        
        
    </head>
    <body>
        
         <%
            //conectando a base de datos
            Connection conexion=null;
            String url="jdbc:mysql://localhost:3306/final_progra";//url de MySQL
            String usuario="root";// usuario de mysql local
            String clave="root"; 
           
            
             Class.forName("com.mysql.jdbc.Driver");
             conexion=DriverManager.getConnection( url, usuario,clave);
             
             //listado de la tabla pero de la fila seleccionada
             
             PreparedStatement ps;
             ResultSet rs;
             
             int id=Integer.parseInt(request.getParameter("id")); 
             
             ps=conexion.prepareStatement("select * from libro where codigo_libro="+id);
             rs=ps.executeQuery();
             
             
             while(rs.next()){
          
            %>
        
     <div class="container-sm ">              
           
        <form method="POST" id="form" name="form" action="" >
             <div class="for m-group">                       
                        
         
            
            <div  >
   <form class="form-register"   method="POST"  id="form" name="form"  >
               <h1>Modificar alumno</h1>
            <div class="form-group">
                <label for="exampleInputName">Codigo</label>
                <input class="form-control" type="text" readonly="" value="<%= rs.getInt("codigo_libro")%>"> 
                <input type="hidden" name="control" value="GUARDAR">
            </div>
            <div class="form-group">
                <label for="exampleInputName">Nombre del libro</label>
                <input class="form-control" type="text" placeholder="Ingrese nombre" name="nombre"  value="<%= rs.getString("nombre")%>">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Fecha lanzamiento</label>
              <input class="form-control" type="text" placeholder="Ingrese correo" name="fecha_lanzamiento"  value="<%= rs.getString("fecha_lanzamiento")%>">
         
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Autor</label>
              <input type="text" class="form-control"  name="autor" id="autor" value="<%= rs.getString("autor")%>"  >
            </div>
               
               
            
            <select class="form-control" name="tipo_pasta_id" value="<%= rs.getInt("tipo_pasta_id")%>">
              
                <option value="1">Opci??n 1</option>
                <option value="2">Opci??n 2</option>
            </select><br>
            
            <div>
                <input type="submit" value="Guardar" class="btn btn-primary "/>             
             <a class="btn btn-warning" href="home.jsp" style="float: right;">Atras</a>
                
            </div>
        </form> 
                <% } %>
        </div>
        
    </body>
</html>
<%
        String nombre, fecha_lanzamiento, autor, tipo_pasta_id;
        
       
        nombre=request.getParameter("nombre");
       
   fecha_lanzamiento=request.getParameter("fecha_lanzamiento");
        autor=request.getParameter("autor");      
        
        tipo_pasta_id=request.getParameter("tipo_pasta_id");
        if(nombre!=null)
        {
        ps=conexion.prepareStatement("update libro set nombre='"+nombre+"',fecha_lanzamiento='"+fecha_lanzamiento+"',autor='"+autor+"',tipo_pasta_id='"+tipo_pasta_id+"' where codigo_libro="+id);
        
        ps.executeUpdate();
        response.sendRedirect("home.jsp");
        
        }
%>