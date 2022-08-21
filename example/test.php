<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Проверка работы CircleCaptcha</title>
</head>
<body>
<?php
echo $_GET["circlesThrue"]."+1=".$_GET["circles"];
 if(isset($_GET['circles'])) {
 	$n0=$_GET["circlesThrue"]+1;
 	$m=$_GET["circles"];
 	if($n0==$m) echo "<html><head><meta http-equiv='refresh' content='5; url=index.php'></head><body><p><strong>Правильно!</strong></p></body></html>";
 		else echo "<html><head><meta http-equiv='refresh' content='5; url=index.php'></head><body><p><em>Неравильно!</em></p></body></html>";
 }
?>
</body>
</html>