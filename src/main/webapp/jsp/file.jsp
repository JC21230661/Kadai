<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ファイル一覧</title>
<link href="./css/style.css" rel="stylesheet">
<script>
function submitCheck(){
	if(window.confirm("削除してよろしいですか？")){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<header>
		<h1>画像リスト</h1>
	</header>
	<main>
		<div class=""
		<form method="post" action="delete" onSubmit="return submitCheck()" >
			<div class="buttonArea">
				<button type="submit">削除</button>
				<a href="./html/uploadform.html"><button type="button">新規登録</button></a>
			</div>
			<div class="grid-container">
				<%
				  String path = (String) request.getAttribute("PATH");
			      List<String> files = (List<String>) request.getAttribute("FILES");
				
				   if(files !=null){
                     for(String file:files){
                       String pathName=path+file;
                %>
                   <div class="grid-item">
                     <div class="checkbox-label">
                       <input type="checkbox" name="check" value="<%=file %>">
                       削除
                     </div>
                     <img src="<%=pathName %>" alt="画像ファイル">
                     <div class="filename"><%=file %></div>
                   </div>
                   <%
                     }
                   }
                   %>
			</div>
		</form>
	</main>
</body>
</html>