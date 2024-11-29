<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");

    Filme filmeT = new Filme();
    
    ArrayList<Filme> lista = filmeT.getFavsByIdUser(userLogado.getPkuser());
    
    
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favorito : Nome do usuário</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="./favorite.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>

       <main class="big_container flex-center">
        <div class="container">

            <div class="cockpit_favorite flex">
                <div class="content flex">
                    <a href="Home.jsp" class="voltar_btn input_style flex-center">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
                    </a>
                    <h1>Meus favoritos</h1>
                </div>
            </div>
            
         <% if (lista != null && !lista.isEmpty()) { %>
            <section id="filmes_container">
                <% for (Filme filme : lista) { %>
                    <div class="filme_content flex-center">
                        <img src="data:image/png;base64,<% if (filme.capaimagemBase64 != null) out.print(filme.capaimagemBase64); %>" alt="">
                    </div>
                <% } %>
            </section>
        <% } else { %>
            <h1 align="center">Nenhum favorito encontrado</h1>
        <% } %>
        </div>
    </main>

    <script src="scriptGlobal.js"></script>
    <script src="./favorite.js"></script>
</body>
</html>