<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="whitesmoke">
<head>
    <title>${post.title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/register.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/content/imagem/logo.ico">
</head>
<body>
<navbar class="navbar">
    <div class="navbar">
        <img class="navbar-img" src="<%=request.getContextPath()%>/content/imagem/logo.ico"/>
        <a class="navbar-name" href="<%=request.getContextPath()%>/index">Escriba Cafe</a>
        <c:if test="${sessionScope.logged == true}">
        <span class="sp-session">
            <div class="div-session">
            <form  class="form-session" method="post" action="<%=request.getContextPath()%>/logout">
                    <input  class="img-session" type="image"  src="<%=request.getContextPath()%>/content/imagem/exit.png">
            </form>
            </div>
            <img class="navbar-img" style="float:right;" src="<%=request.getContextPath()%>/content/imagem/${sessionScope.user.imgPath}"/>
            <a class="navbar-name" style="float:right;" href="<%=request.getContextPath()%>/index">${sessionScope.user.name}</a>
        </span>
        </c:if>
    </div>

</navbar>
<div class="background-post">
    <div class="post-img" style="background-image: url(<%=request.getContextPath()%>/content/imagem/${post.img_path}); background-repeat: no-repeat"></div>
    <br>
    <hr class="post-line">
    <div class="post-body">
        <div class="post-title">
            <textarea readonly>${post.title}</textarea>
        </div>
        <div class="post-description">
            <textarea readonly>${post.description}</textarea>
        </div>
        <br>
        <hr class="post-line">
        <div class="post-author">
            <img class="post-author-img" src="<%=request.getContextPath()%>/content/imagem/default-user.png">
            <p class="post-author-text">${post.user.name}</p>
        </div>
    </div>
</div>
</body>
</html>
