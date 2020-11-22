<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
thead {color: blue;
	background-color:#8cfaf6;
	border:1;
	padding: 5}

table, th, td {
  border: 1px solid black;
  padding: 15px;
  text-align: center;
  border-collapse: collapse;
}
tr:hover {background-color: #f5f5f5;}
</style>

</head>
<body>
<table id="lista" >
	<thead>
		<tr>
			<th>Hakusana:</th>
			<th colspan="2"><input type="text" id="hakusana"></th>
			<th><input type="button" value=" hae " id="hakunappi"></th>
		</tr>
		<tr>
			
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>e-mail</th>
		</tr>
	</thead>
	<tbody >
	</tbody>
</table>

<script>
$(document).ready(function(){
	haeAsiakkaat();
	
	$("#hakunappi").click(function() {
		console.log($("#hakusana").val());
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		if(event.which==13){
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus();
});	

function haeAsiakkaat() {
	$("#lista tbody").empty();
	$.ajax({url:"Asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
		console.log(result);
		$.each(result.asiakkaat, function(i, field){
			var htmlStr;
			htmlStr+="<tr>";

			htmlStr+="<td>"+field.etunimi+"</td>";
			htmlStr+="<td>"+field.sukunimi+"</td>";
			htmlStr+="<td>"+field.puhelin+"</td>";
			htmlStr+="<td>"+field.sposti+"</td>";
			$("#lista tbody").append(htmlStr);
		});
	}});
}

</script>
</body>
</html>