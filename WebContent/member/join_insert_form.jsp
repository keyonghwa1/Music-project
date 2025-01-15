<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign up</title>
	
		<script src="../js/httpRequest.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" href="../css/style.css">

		<script>
			var b_idCheck = false;
			
			function send(f){ 
				var name = f.name.value.trim();
				var id = f.id.value.trim();
				var pw = f.pw.value.trim();
				var age = f.age.value.trim();
				var phone1 = f.phone1.value.trim();
				var phone2 = f.phone2.value.trim();
				var phone3 = f.phone3.value.trim();
				
				if( !b_idCheck ) {
		               alert("아이디 중복입니다");
		               return;
		            }
				if(pw == ''){
					alert("비밀번호를 입력하세요!");
					f.pw.focus();
					return;
				}
				
				if(name == ''){
					alert("이름을 입력하세요!");
					f.name.focus();
					return;
				}
				var check = /^[0-9]*$/;
				if(age == '' || check.test(age)==false){
					alert("나이는 정수로 입력하세요!");
					f.age.focus();
					return;
				}
				f.action = "insert.korea";
				f.method = "POST";
				f.submit();
			}
			
			function id_check() {
				var id = document.getElementById("id").value.trim();
				if( id == '' ) {
					alert("아이디를 입력하세요");
					return;
				}
				var url = "check_id.korea";
				var param = "id="+encodeURIComponent(id);
				sendRequest( url, param, result_check, "GET" );
			}
			function result_check() {
				if( xhr.readyState == 4 && xhr.status == 200 ) {
					var data = xhr.responseText;
					var json = eval( data );
					if( json[0].result == 'no' ){
						alert( json[1].id + "은 이미 사용중인 아이디 입니다." );
						return;
					}
					alert( json[1].id + "는 사용 가능한 아이디 입니다." );
					b_idCheck = true;
				}
			}
		</script>
	</head>
	<body>
	<jsp:include page="../music/index.jsp"/>
		<form>
		<div class="jumbotron text-center">
		
		<div class="container">
		<div class="raw">
		
				<h3>Create your Account</h3><br>
				<div class="form-group">
					<label for="NAME">Name
					<input type = "text" class="form-control" name="name" placeholder="NAME"/></label>
				</div>
				<br>
				
				<div class="form-group">
					<label for="ID">ID
						<input type = "text" class="form-control" id="id" name="id" placeholder="ID"/>
						<input type = "button" value="confirm" class="btn btn-warning btn-sm" onclick="id_check();"/>
					</label>
				</div>
				<br>
				
				<div class="form-group">
					<label for="PWD">Password
					<input type = "password" class="form-control" name="pw" placeholder="PW"></label>
				</div>
				<br>
				
				<div class="form-group">
					<label for="AGE">Age
					<input type = "number" class="form-control" name="age" placeholder="AGE"></label>
				</div>
				<br>
				
				<div class="form-group">
					
					<label for="phone">				
						<input type = "text" style="width: 70px;" name="phone1" placeholder="PHONE1" maxlength="3" 	/> -
						<input type = "text" style="width: 70px;" name="phone2" placeholder="PHONE2" maxlength="4" 	/> - 
						<input type = "text" style="width: 70px;" name="phone3" placeholder="PHONE3" maxlength="4"	/>
					</label>					
				
					<!-- <input type = "text" class="form-control" pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000" name="phone" placeholder="PHONE"></label> -->
				</div>
				<br>
				
				<div class="form-group">
					<input type ="button" value="Join" class="btn btn-warning btn-sm" onclick="send(this.form);">
					<input type="button" value="Cancel" class="btn btn-warning btn-sm" onclick="location.href='../music/list.korea';">
				</div>
				
			</div>
		</div>
		</div>
		</form>
	</body>
</html>
