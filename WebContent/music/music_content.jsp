<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Board</title>

<script src="../js/httpRequest.js"></script>
<script>
		function addListf( musicidx, memberidx ) { //플레이리스트 담기
			if(memberidx == 0){
				location.href = "../login/check_login.jsp";
				return;
			}
			var url = "playlist_insert.korea";
			var param = "musicidx=" + musicidx + "&memberidx=" + memberidx;
			sendRequest(url, param, resultFn, "POST");
		}
		function resultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ) { 
				var data = xhr.responseText;
				var json = eval(data);
				if( json[0].result == 'yes' ) {
					alert("playlist에 담았습니다.");
					if( confirm("playlist로 이동하시겠습니까?") == true ) {
						location.href = "playlist_list.korea";
					}
				}
				else {
					alert("이미 playlist에 담겨져 있습니다.");
				}
			}
		}
		function goodpoint(idx,name){ //게시물 좋아요 올리기
			var url = "goodpoint_add.korea";
			var param = "idx="+idx+"&name="+name;
			sendRequest(url, param, resultFnAdd, "POST");
		}
		function resultFnAdd() {
			if( xhr.readyState == 4 && xhr.status == 200 ) {
				var data = xhr.responseText;
				var json = eval(data);
				location.href = "view.korea?idx="+${vo.m_no}+"&name="+json[0].name;
			}
		}
		function deletef( didx ) { //내 게시물 삭제
			var url = "music_delete.korea";
			var param = "idx="+didx;
			sendRequest(url, param, delresultFn, "POST");
		}
		function delresultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ) {
				location.href = "list.korea";
			}
		}
		function writedata(f,name,checkidx){ //댓글달기
			if(checkidx == 0){
				location.href = "../login/check_login.jsp";
				return;
			}
			var c_content = f.c_content.value.trim();
			if( c_content == '') {			//추가-댓글 입력안할경우	
				alert("Please Input Comment!!");
				return;
			}
			var musicidx = f.musicidx.value.trim();
			f.action = "comments_insert.korea?name="+name;
			f.method = "POST";
			f.submit();
		}
		function CgoodFn(cidx,name){ //댓글좋아요
			var url = "comments_goodpoint_add.korea";
			var param = "idx="+cidx+"&name="+name;
			sendRequest(url, param, resultFnAdd_cmt, "POST");
		}
		function resultFnAdd_cmt() {
			if( xhr.readyState == 4 && xhr.status == 200 ) {
				var data = xhr.responseText;
				var json = eval(data);
				location.href = "view.korea?idx="+${vo.m_no}+"&name="+json[0].name;
			}
		}
		function Cmtdel(cdidx,name){ //내 댓글 삭제
			var url = "comments_delete.korea";
			var param = "idx="+cdidx+"&name="+name;
			sendRequest(url, param, delresultFn_cmt, "POST");
		}
		function delresultFn_cmt() {
			if( xhr.readyState == 4 && xhr.status == 200 ) {
				var data = xhr.responseText;
				var json = eval(data);
				location.href = "view.korea?idx="+${vo.m_no}+"&name="+json[0].name;
			}
		}
		
		
</script>

</head>
<body>
	<jsp:include page="../music/index.jsp"/>
	<div class="jumbotron text-center">
	<div class="container">
	<div class="raw">
		
	<table class="table">
	<h3>${ vo.m_title }</h3>
		<ul class="nav navbar-nav navbar-right" ><li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            		${vo.name}님 정보<span class="caret"></span></a>
              	<ul class="dropdown-menu">                	
					<li><a href="../music/other_list.korea?idx=${vo.memberidx }">${vo.name}님의 Post</a></li>
                </ul>
            </li>
        </ul>
	<tr>
		<td>
			<img src ="../musicfile/${ vo.m_image }" width = "50%" class="col-lg-4" alt="Cinque Terre">
			<br><h4>${ vo.m_content }</h4><br>
			
			<h5>${ vo.m_musicfile }</h5>
			<audio src="../musicfile/${ vo.m_musicfile }" controls ></audio><br>			
			</td>
		</tr>
		</table>
		

	</div>
	</div>
	</div>
	</body>
</html>