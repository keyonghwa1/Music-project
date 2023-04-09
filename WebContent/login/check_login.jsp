<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 세션영역에 name이 없으면 if문 안에서 페이지가 이동된다. 있으면 아무 효과 없음 -->
<c:if test="${ empty sessionScope.name }">
	<script>
		alert("Please Login!!");
		history.back(); //이전페이지로
		//location.href = "../login/login_form.jsp"; 
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
