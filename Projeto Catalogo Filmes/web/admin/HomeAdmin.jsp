<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="java.util.ArrayList"%>
<%
    Usuario user = new Usuario();
    Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
    String nomeUser = (String) session.getAttribute("nome");
    

    Filme filmeT = new Filme();
    ArrayList<Filme> lista = filmeT.listarFilmes();   
    
    if("admin".equals(nomeUser)){
    }else{
        response.sendRedirect("../Home.jsp");
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Cinema - Cliente</title>
    <link rel="stylesheet" href="../global.css">
    <link rel="stylesheet" href="../home.css">
    <link rel="stylesheet" href="styles/menu.css">
    <link rel="stylesheet" href="styles/generalHome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body class="body">
    <nav class="container-menu">
        <div class="buttonsAreaView">
            <div class="buttonView active"><button style="cursor: pointer;" onclick="window.location.href='cadNewFilme.jsp'"><i class="fa-solid fa-circle-plus"  ></i></button><p>Adicionar Filme</p></div>
            <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href='addActorPage.jsp'"><i class="fa-solid fa-user-plus" ></i></button><p>Adicionar Ator</p></div>
            <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href='../logout.jsp'"><i class="fa-solid fa-right-from-bracket" ></i></button><p>Logout</p></div>            
        </div>
    </nav>
    <main class="main_page">
        <div class="container">
            <!-- MENU DE FILTROS DO FILME -->
            <div class="cockpit_filmes_adm flex">
                
                    <h1>Catálogo</h1>
                
                <div class="cockpit_item_adm flex-center">
                    <label class="search_input">
                        <span><i class="fa-solid fa-magnifying-glass"></i></span>  
                        <input type="text" placeholder="Pesquisar" >
                    </label>
                    
                    <div class="perfil_user" ><a href="../Home.jsp">op</a></div>
                    
                </div>
                
            </div>
            <section id="filmes_container">
                <% for(Filme filme:lista){%>
                <div class="filme_content flex-center">
                    <img src="data:image/png;base64,<%if(filme.capaimagemBase64 != null)out.print(filme.capaimagemBase64);%>" alt="<%out.print(filme.getNome());%>"  ></img>
                    <button class="btn_favoritar_filme flex-center" onclick="window.location.href='EditFilm.jsp?valor=<%=filme.getId() %>'; return false;">
                        <i class="fa-solid fa-pen"></i>                           
                    </button>
                </div>
                <%}%>
            </section>
        </div>
    </main>
    
    <script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>
</body>
</html>