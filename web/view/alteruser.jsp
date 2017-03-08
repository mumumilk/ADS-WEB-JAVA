<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Alteração Cadastro</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/register.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/WebProject.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/content/imagem/logo.ico">
    <script src="../content/javascript/jquery-3.1.1.js"></script>

    <script>

    </script>
</head>
    <body>
        <div class="navbar">
            <img class="navbar-img" src="<%=request.getContextPath()%>/content/imagem/logo.ico"/>
            <a class="navbar-name" href="<%=request.getContextPath()%>/index">Escriba Cafe</a>
        </div>


        <table class="table-cores iv">
            <tbody>
            <tr>
                <td class="mun"></td>
                <td class="pla"></td>
                <td class="arr"></td>
                <td class="ate"></td>
                <td class="com"></td>
                <td class="pes"></td>
                <td class="sau"></td>
                <td class="edu"></td>
                <td class="lei"></td>
            </tr>
            </tbody>
        </table>

        <div class="register-form">
            <div class="register-tip">
                <p class="register-name-alter">Alteração de Cadastro:</p>
            </div>
            <form  method="post" class="register-form-form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/updateUser">
                <input id="email" style="display: none;" type="text" name="email" value="${sessionScope.user.email}">
                <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/user.png"/>
                <input id="name" class="register-input" type="text" name="user" value="${sessionScope.user.name}" maxlength="45" required>
                <br>
                <br>
                <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/key.png"/>
                <input id="novaSenha" class="register-input" type="password" name="pass" placeholder="Nova Senha" maxlength="15" required>
                <br>
                <br>
                <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/key.png"/>
                <input id="confirmSenha" class="register-input" type="password" name="confirm-pass" placeholder="Confirmar Nova Senha" maxlength="15" required>
                <br>
                <c:if test="${verify_senha == false}">
                    <p class="register-input-false">Senhas não conferem, tente novamente!</p>
                </c:if>
                <br>
                <br>
                <img class="register-img-usr" src="<%=request.getContextPath()%>/content/imagem/${sessionScope.user.imgPath}">
                <input class="register-input" type="file" name="file" required/>
                <br>
                <input class="btn-submit" type="submit" value="Salvar">
            </form>
        </div>

    <script>
        function verificaCampos(){
            var nome = $("#name").val();
            var novaSenha = $("#novaSenha").val();
            var confirmSenha = $("#confirmSenha").val();

            if (nome == null)
            {
                $('#name')
            }
        }
    </script>
    </body>
</html>
