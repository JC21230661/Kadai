<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>画像一覧</title>
<style>
*{
	margin:0;
	padding:0;
}
table{
	border-collapse: collapse;
}
table,td,th{
	border:solid 1px #000000;
}
td,th{
	padding:5px 10px;
}

img{
	max-height:800px;
}
header{
	background-color:#336633;
}
h1{
	color:#ffffff;
	padding-top:20px;
	padding-bottom:10px;
	text-align:center;
}
main{
	width:600px;
	margin:20px; auto;
}
.buttonArea{
	margin-top:10px;
	margin-bottom:10px;
}
</style>
<script>
	
	function submitCheck(){
		if(window.confirm("削除してよろしいですか")){
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
		<form method="post" action="./delte" onSubmit="return submitCheck()">
			<div class="buttonArea">
				<button type="submit">削除</button>
				<a href="./html/uploadform.html"><botton type="button">新規登録</botton></a>
			</div>
			<table>
				<tr>
					<th></th>
					<th>画像</th>
					<th>ファイル名</th>
				</tr>
				<%
				 // 画像用フォルダのパス
		 		String imagePath = "images/";
		 		// フォルダの情報を実パス（OS でのパス）のから取得
		 		File fileObject = new File(getServletContext().getRealPath(imagePath));
		 		// 個々のファイル情報を配列に確保
		 		File[] files = fileObject.listFiles();
				 if (files != null) {
		 			for (File file : files) {
		 			String name = file.getName(); // ファイル名の取得
		 			String pathName = imagePath + name; // 画像用フォルダと合わせたパス
		 		%>
		 		<tr>
		 			<td><input type="checkbox" name="check" value="<%=name %>"></td>
		 			<td><img src="<%=pathName %>" alt="画像ファイル"></td>
		 			<td><%=name %></td>
		 		</tr>
		 		<%
					 }
				}
				 %>
 			</table>
 		</form>
 	</main>
</body>
</html>