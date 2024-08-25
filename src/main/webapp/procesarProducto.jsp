<%@page import="modelo.Producto"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Producto</title>
</head>
<body>
<%
    // Crear una lista de productos en la sesión
    List<Producto> productos = (List<Producto>) session.getAttribute("productos");
    if (productos == null) {
        productos = new ArrayList<>();
        session.setAttribute("productos", productos);
    }

    // Capturar los datos del formulario
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precio = Double.parseDouble(request.getParameter("precio"));

    // Crear un nuevo producto y agregarlo a la lista
    Producto producto = new Producto(codigo, nombre, cantidad, precio);
    productos.add(producto);

    // Redirigir a la página de factura
    response.sendRedirect("factura.jsp");
%>
</body>
</html>
