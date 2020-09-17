<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원 추가</h1>
	<article>
		<form action="ex4_add.jsp" method="post">
			<label for="s_no">사번:</label>
			<input type="text" id="s_no" name="s_no"/><br/>
			<label for="s_name">이름:</label>
			<input type="text" id="s_name" name="s_name"/><br/>
			<label for="s_job">직종:</label>
			<input type="text" id="s_job" name="s_job"/><br/>
			<label for="s_sal">급여:</label>
			<input type="text" id="s_sal" name="s_sal"/><br/>
			
			<input type="button" value="추가" onclick="exe(this.form)"/>
		</form>
	</article>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script>
		function exe(f){
			//var no = f.s_no;
			//var no = document.getElementById("s_no");
			var no = $("#s_no");//jQuery 방식
			//CSS 선택하는 방법(.class / #id 등)을 jQuery에서 그대로 사용가능하다.
			
			//if(!no.value || no.value.trim().length==0){
			if(!no.val().trim().length==0){
				//val() : jQuery에서 value를 얻어오는 함수
				alert("검색할 사번을 입력하세요.");
				//no.value=""; //이 부분은 적용되지 않는다. 이유는 no가 $("#s_no")라는 jQuery문법이고
								//no.value=""; JavaScript 문법은 통용되지 않는다. 
								//$("#s_no").value=""; jQuery+자바스크립트 사용 X
				no.val("");//위의 내용을 순수한 jQuery문법으로 고친것이다.
				no.focus();//jQuery에도 focus()함수 가 있어서 그대로 사용.
				return;
			}
			f.submit();//서버로 보낸다.
		}
	</script>
</body>
</html>