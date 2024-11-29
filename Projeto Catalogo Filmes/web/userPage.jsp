
<%@page import="model.Usuario"%>
<%Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
    String nomeLogado = userLogado.getNome();
    String emailLogado = userLogado.getEmail();
    int pkUserLogado = userLogado.getPkuser();
    if (userLogado == null) response.sendRedirect("./login.jsp");
    session.setAttribute("usuarioLogado", userLogado);
    String foto = "", nome = "", email = "", senha = "", sHTML = "";
    String pkuser = "";
    Usuario user = new Usuario(); // Instancia o objeto Usuario
    
    if (user.buscarEmail())out.print("");
    if (!(user.statusSQL == null)) out.println(user.statusSQL);
%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página do usuário: nome do usuário</title>
    <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="userPage.css">
</head>
<body>
    <div class="container flex-center">

        <div class="user_content flex-center">
            <div class="avatar_user_page">
            <div class="avatar_container flex-center">
                <img src="data:image/png;base64,<%if(userLogado.imagemBase64 != null)out.print(userLogado.imagemBase64);%>" alt="<%out.print(userLogado.email);%> ">
            </div>
            <span class="flex-center edit_icon" onclick="openCloseModal('.modal_edit_user_img')">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
                </span>
            </div>
            <div class="flex">
                <h1><%= userLogado.getNome() %></h1> 
                <button class="edit_button" id="edit_user_info_button" onclick="openCloseModal('.modal_edit_user_info')">edit</button>
            </div>
            <div class="label">
                <h4>Email:</h4>
                <p><%= userLogado.getEmail() %></p>
            </div>
            <div class="flex-center actions_buttons">
                <button class="input_style" onclick="window.location.href='Home.jsp'">Voltar para home</button>
               <button class="input_style" onclick="window.location.href='logout.jsp'">Logout</button>
               <%if("admin".equals(userLogado.getNome())) {%>
                  <a href="./admin/HomeAdmin.jsp" class="input_style area_admin_link">Area do administrador</a>
               <%}%>
            </div>

        </div>

    </div>

    <div class="modal modal_edit_user_img hidden">
        <div class="modal_header">
            <p>Editar avatar</p>
            <button class="close" data-modal-close>X</button>
        </div>
        <div class="modal_content">
            <form class="flex" action="./CadUser" name = formFoto method=post enctype="multipart/form-data">  
                <input type="hidden" name = pkuser value ="<%=pkUserLogado%>" >
                <input type="hidden" name = email value ="<%=emailLogado%>" >
                <input type="hidden" name = nomevalue value="<%= request.getParameter("novoome") %>">
                <div class="avatar flex-center">
                    <div class="avatar_img flex-center">
                        <img src="data:image/png;base64,<%if(userLogado.imagemBase64 != null)out.print(userLogado.imagemBase64);%>" alt="Foto" >
                    </div>
                    <label class="avatar_input">
                        <input type="file" class="input_style" name="arquivo" id = "arq">
                    </label>
                </div>
                    <input type="submit" name="gravar" value="Gravar" class="input_style update_button" onclick="">
            </form>
        </div>
    </div>
    <div class="modal modal_edit_user_info hidden">
        <div class="modal_header">
            <p>Editar nome</p>
            <button class="close" data-modal-close>X</button>
        </div>
        <div class="modal_content">
            <form class="flex" action="./CadUser" name = formFoto method=post enctype="multipart/form-data">  
                <input type="hidden" name = email value ="<%=emailLogado%>" >
                    <label class="new_name_label">
                        <span>Novo nome:</span>
                        <input type="text" class="input_style" name="novoNome">
                    </label>
                
                    <input type="submit" name="atualizarNome" value="atualizarNome" class="input_style update_button" onclick="">
            </form>
        </div>
    </div>
    <div id="modal_blur" class="hidden">
    </div>

 <script src="scriptGlobal.js"></script>
</body>
</html>
