<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title> Entrar</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/register.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/WebProject.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/content/imagem/logo.ico">
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
        <p class="register-name">Registre-se</p>
    </div>
    <form  method="post" class="register-form-form" action="<%=request.getContextPath()%>/cadastrar">
        <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/user.png"/>
        <input class="register-input" type="text" name="user" placeholder="Nome Completo" maxlength="45" required>
        <br>
        <br>
        <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/email.png">
        <input class="register-input" type="email" name="email" placeholder="exemplo@dominio.com" maxlength="45" required>
        <br>
        <c:if test="${verify_email == false}">
            <br>
            <br>
            <br>
            <p class="register-input-false">E-mail já cadastrado ou inválido!</p>
        </c:if>
        <br>
        <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/key.png"/>
        <input class="register-input" type="password" name="pass" placeholder="Senha" maxlength="15" required>
        <br>
        <br>
        <img class="register-img" src="<%=request.getContextPath()%>/content/imagem/key.png"/>
        <input class="register-input" type="password" name="confirm-pass" placeholder="Confirmar Senha" maxlength="15" required>
        <br>
        <c:if test="${verify_senha == false}">
            <p class="register-input-false">Senhas não conferem, tente novamente!</p>
        </c:if>
        <br>
        <input class="btn-submit" type="submit" value="Cadastrar">
    </form>
</div>
</body>
</html>
