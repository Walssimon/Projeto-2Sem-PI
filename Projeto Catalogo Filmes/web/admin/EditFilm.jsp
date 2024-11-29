<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Filme"%>
<%@page import="model.Ator"%>
<%
    
String nomeUser = (String) session.getAttribute("nome");
Filme filme = new Filme();
    if("admin".equals(nomeUser)){
    }else{
        response.sendRedirect("../Home.jsp");
    }
    
    String idzinho = request.getParameter("valor");
    int idzao = Integer.valueOf(idzinho);
    filme.id = idzao;
 
 Ator atr = new Ator();
    ArrayList<Ator> atores = atr.listarAtores();
    
%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Filme - SenacBuster</title>
    <link rel="stylesheet" href="../global.css">
    <link rel="stylesheet" href="../home.css">
    <link rel="stylesheet" href="styles/menu.css">
    <link rel="stylesheet" href="styles/generalHome.css">
    <link rel="stylesheet" href="styles/formsNewFilm.css">
    <link rel="stylesheet" href="styles/editFilmStyles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
</head>
<body class="body">
    <nav class="container-menu">
        <div class="buttonsAreaView">

            <div class="buttonView active"><button style="cursor: pointer;" onclick="window.location.href='cadNewFilme.jsp'"><i class="fa-solid fa-circle-plus"  ></i></button><p>Adicionar Filme</p></div>
            <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href='addActorPage.jsp'"><i class="fa-solid fa-user-plus" ></i></button><p>Adicionar Ator</p></div>
            <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href='../logout.jsp'"><i class="fa-solid fa-right-from-bracket" ></i></button><p>Logout</p></div>

        </div>
    </nav>
    <main class="container">
               <div class="">
        <!-- titulo do formulario -->
        <div class="cockpit_filmes_form">
            <div class="cockpit_item_adm ">
                    <button class="btn_return" style="cursor: pointer;" onclick="window.location.href='./HomeAdmin.jsp'" ><i class="fa-solid fa-arrow-left"></i></button>
                    <h1>Capas & Banners</h1>
                </div>
            </div>
            <form class="div_security_area"  method="post" action="../CadFilme" name="formAtor" enctype="multipart/form-data" onsubmit="formreg.alterar.value = '1'">
            <input type="hidden" name="alterar" value="0">
            <input type="hidden" name="id" value="<%=idzinho%>">
                <!-- banners -->
            <div class="inputs_area">
                <div class="input_div">
                    <label>Capa principal</label>
                    <label class="input_capas border">
                        <img src="" alt="Clique para selecionar uma imagem" id="imagePreview" class="img_preview">
                        <!-- Campo de input de arquivo escondido -->
                        <input type="file" name="arquivoCapa"  class="principal" id="file-input"  accept="image/*" onchange="handleFileChange(event, 'imagePreview')">
                    </label>
                    <!-- <label class="input_capas"> <input type="file" accept="image/*" class="principal"></label> -->
                </div>
                <div class="input_div">
                    <label>Banner principal</label>
                    <label class="input_capas">
                        <img src="" alt="Clique para selecionar uma imagem" id="imagePreview2">
                        <!-- Campo de input de arquivo escondido -->
                        <input type="file" name="arquivoBanner"  class="banners" id="file-input2"  accept="image/*" onchange="handleFileChange(event, 'imagePreview2')">
                    </label>

                </div>
            </div>
            
            <!-- campos -->
            <div class="inputs_area linear">
                <h1> Informações</h1>
                <div class="div_list_inputs">
                    <div class="input_div_grid">
                        <label>Nome</label>
                        <label class="input_capas"> <input type="text" name="nome" class="principal"></label>
                    </div>
                    <div class="input_div_grid">
                        <label>Categoria</label>
                        <label class="input_capas">
                            <select id="cate" name="categoria" class="principal">
                                    <option value="Ação">Ação</option>
                                    <option value="Aventura">Aventura</option>
                                    <option value="Comédia">Comédia</option>
                                    <option value="Drama">Drama</option>
                                    <option value="Terror">Terror</option>
                                    <option value="Ficção">Ficção Científica</option>
                                    <option value="Românce">Romance</option>
                                    <option value="Fantasia">Fantasia</option>
                                    <option value="Suspense">Suspense</option>
                                    <option value="Mistério">Mistério</option>
                                    <option value="Animação">Animação</option>
                                    <option value="Documentário">Documentário</option>
                                    <option value="Musical">Musical</option>
                                    <option value="Histórico">Histórico</option>
                                    <option value="Família">Família</option>
                                </select>                                  
                        </label>
                    </div>
                    <div class="input_div_grid">
                        <label>Ano de Lançamento</label>
                        <label class="input_capas"> <input type="date" name="data" class="principal"></label>
                    </div>
                    <div class="input_div_grid">
                        <label>Avaliações</label>
                        <label class="input_capas"> <input type="text" name="avaliacao" class="principal"></label>
                    </div>
                    <div class="input_div_grid">
                        <label>Tempo de duração <span style="font-size: 0.7rem;color: #cccccc65;">(exemplo: 120
                                min)</span></label>
                        <label class="input_capas"> <input type="text" name="duracao" class="principal"></label>
                    </div>
                    <div class="input_div_grid">
                        <label>Restrição de idade</label>
                        <label class="input_capas">
                            <select id="rest" name="classificacao" class="principal">
                                <option value="livre">Livre</option>
                                <option value="10">+10</option>
                                <option value="12">+12</option>
                                <option value="14">+14</option>
                                <option value="16">+16</option>
                                <option value="18">+18</option>
                            </select>
                        </label>
                        
                    </div>
                    <div class="input_div_grid desc_area">
                        <label>Descrição</label>
                        <label class="input_capas"> <textarea name="sinopse" class="descr_input" ></textarea></label>
                    </div>
                </div>
            </div>

            <!-- atores -->
 

                    <!-- ABRIR MODAL PARA SELECIONAR ATORES -->
 

                <!-- ABRIR MODAL PARA SELECIONAR ATORES -->
            

            <div class="footer">
                <div class="footer_container_area with_delete_button">
                    <button class="delete_btn" onclick="window.location.href='./ExcluirFilme.jsp?valor=<%=filme.getId() %>'" type="button">
                        Excluir 
                    </button>
                    <div class="others">
                        <button class="cancel_btn" type="reset">
                            Cancelar
                        </button>
            
                        <button class="add_btn"  type="submit">
                            Editar
                        </button>
                    </div>
                </div>                
            </div>
        </form>    
    
    </main>






    <script src="../scriptGlobal.js"></script>
    <script src="./../scriptGlobal.js"></script>
    <script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>

</body>
</div></html>