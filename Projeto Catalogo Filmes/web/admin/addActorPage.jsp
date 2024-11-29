<%@page import="java.util.ArrayList"%>
<%@page import="model.Ator"%>
<%
 Ator atr = new Ator();
 ArrayList<Ator> atores = atr.listarAtores();  
%>  
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Cinema - Cliente</title>
    <link rel="stylesheet" href="../global.css">
    <link rel="stylesheet" href="styles/menu.css">
    <link rel="stylesheet" href="styles/formsNewFilm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
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
        <section class="container_topArea ">
            
             <div class="cockpit_filmes_form">
                <div class="cockpit_item_adm ">
                    <button class="btn_return" style="cursor: pointer;"  onclick="window.location.href = 'HomeAdmin.jsp'"><a><i class="fa-solid fa-arrow-left"></i></a></button>
                </div>
                 <h1>Cadastro de Atores</h1>
            </div>
            
            <form method="post" action="../CadAtor" name="formAtor" enctype="multipart/form-data" onsubmit="formreg.oper.value = '1'">
                <div class="container_inputs_areas">
                    <div class="inputs_areas">
                        <div class="input_div">
                            
                            <label class="input_capas " >
                                <img src="" alt="Clique para selecionar uma imagem" id="imagePreview6" class="img_preview" >
                                <!-- Campo de input de arquivo escondido -->
                                <input type="file" class="cad_actors" id="file-input6"  accept="image/*" 
                                       onchange="handleFileChange(event, 'imagePreview6')" name="atorCapa">
                            </label>
                           
                        </div>
                    
                        <div class="area_input ">
                            <div class="input_div_grid ">
                                <label>Nome</label>
                                <label class="input_capas" > <input type="text" class="principal" name="nome"></label>
                            </div>
                            <div class="input_div_grid ">
                                <label>Idade</label>
                                <label class="input_capas"> <input type="text" class="principal" name="idade"></label>
                            </div>
                            
                            <div class="input_div_grid">
    
                                <button class="add_btn button" type="submit">
                                    
                                    Adicionar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
            <div class="div_list_inputs actors">

                <!-- ABRIR MODAL PARA SELECIONAR ATORES -->
                <div class="add_atores">
                    <label>Atores Cadastrados</label>
                   
                </div>

                <!-- LISTAGEM DE ATORES -->
                <div class="container_actores_list">
                    <% for(Ator listaatores:atores){%>
                    <div class="actors_div_film">
                        
                        <img src="data:image/png;base64,<%if(listaatores.capaimagemBase64 != null)out.print(listaatores.capaimagemBase64);%>" alt="<%out.print(listaatores.getNomeAtor());%>">
                        <div class="content">
                            <p class="title_actor_name location"><%out.print(listaatores.getNomeAtor());%></p>
                        </div>
                    </div>  <%}%>                                                             
                </div>
                        
            </div>
        </section>
    </main>
</body>
<script src="./../scriptGlobal.js"></script>
<script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>
</html>