<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<title>Asiakkaat-lis�ys</title>
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
table tbody tr:hover {background-color: #f5f5f5;}
</style>
</head>
<body>
	<form id="tiedot">
		<table>
			<thead>
				<tr>
					<th colspan="5"><span id="takaisin">Takaisin listaukseen</span></th>
				</tr>
				<tr>
					<th>Etunimi</th>
					<th>Sukunimi</th>
					<th>Puhelin</th>
					<th>S�hk�posti</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="etunimi" id="etunimi"></td>
					<td><input type="text" name="sukunimi" id="sukunimi"></td>
					<td><input type="text" name="puhelin" id="puhelin"></td>
					<td><input type="text" name="sposti" id="sposti"></td>	
					<td><input type="submit" id="tallenna" value="Lis��"></td>
			</tbody>
		</table>
	</form>
	<div id='ilmo'></div>
</body>
<script>
$(document).ready(function() {
	$("#takaisin").click(function(){
		document.location="listaaAsiakkaat.jsp";
	});
	$("#tiedot").validate({
		rules: {
			etunimi: {
				required: true,
				minlength: 1
			},
			sukunimi: {
				required: true,
				minlength: 1
			},
			puhelin: {
			
				minlength: 5
			},
			sposti: {
				required: true,
				email: true
			}
		},
		messages: {
			etunimi: {
				required: "Lis�� etunimi",
				minlength: "Lis�� etunimi"
			},
			sukunimi: {
				required: "Lis�� sukunimi",
				minlength: "Lis�� sukunimi"
			},
			puhelin: {
				required: "Lis�� puh.nro"
			},
			sposti: {
				required: "Lis�� s�hk�posti",
				email: "S�hk�posti virheellinen"
			}
		},
		submitHandler: function(form) {
			lisaaTiedot();
		}
	});
});

function lisaaTiedot(){
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	$.ajax({url:"Asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result){
		console.log(result);
		if(result.response==0){
			$("#ilmo").html("Asiakkaan lis��minen ep�onnistui.");
		}else if(result.response==1){
			$("#ilmo").html("Asiakas lis�tty");
			$("#etunimi", "#sukumi", "#puhelin", "#sposti").val("")
		}
	}});
}
</script>



</html>