<%@include file="menu.jsp" %>
<%@page import="modelo.Producto"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Factura - Empresa X</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Factura - Empresa X</h1>

        <%
            // Obtener la lista de productos de la sesión
            List<Producto> productos = (List<Producto>) session.getAttribute("productos");
            double totalPagar = 0;
            if (productos != null) {
                for (Producto producto : productos) {
                    totalPagar += producto.getTotal();
                }
            }
        %>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <% if (productos != null) { 
                    for (Producto producto : productos) { %>
                    <tr>
                        <td><%= producto.getCodigo() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getCantidad() %></td>
                        <td>$<%= producto.getPrecio() %></td>
                        <td>$<%= producto.getTotal() %></td>
                    </tr>
                <% }
                } %>
            </tbody>
        </table>

        <h3>Total a Pagar: $<%= String.format("%.2f", totalPagar) %></h3>
        <a href="capturarProducto.jsp" class="btn btn-primary">Agregar otro producto</a>
        <a href="calcularCambio.jsp" class="btn btn-warning">Calcular Cambio</a>
        <a href="reset.jsp" class="btn btn-danger">Reiniciar</a>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
