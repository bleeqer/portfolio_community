<%--
  Created by IntelliJ IDEA.
  User: linux-king
  Date: 2/15/22
  Time: 6:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EDIT POST</title>
    <form action="/board/edit/${post.bno}" method="POST">
        <label for="title">TITLE</label><input type="text" name="title" id="title" value="${post.title}">
        <label for="content">CONTENT</label><input type="text" name="content" id="content"value="${post.content}">
        <label for="writer">WRITER</label><input type="text" name="writer" id="writer" value="${post.writer}">
        <button type="submit">SUBMIT</button>
    </form>
</head>
<body>

</body>
</html>
