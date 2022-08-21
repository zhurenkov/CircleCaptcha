<?php
 $n=rand(0,8);
 #echo $n;
 exec("./circle.pl $n", $sys);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Проверка работы CircleCaptcha</title>
</head>
<body>
<p>Сколько кругов Вы видите на рисунке?</p>
<img src="cap.svg" alt="капча" width="200px" height="200px">
<form action="test.php" method="get">
	<label>Количество кругов: </label>
	<input type="text" name="circles" maxlength="1" size="2" />
	<input type="hidden" name="circlesThrue" value="<?=$n?>" />
	<input type="submit" value="Проверить" />
</form>
<?php
# if(isset($_GET['circles'])) {
# 	$n0=$_GET["circlesThrue"]+1;
# 	$m=$_GET["circles"];
# 	if($n0==$m) echo "<p><strong>Правильно!</strong></p>";
# 		else echo "<p><em>Неравильно!</em></p>";
#		 echo $n+1;
# 	sleep(1);
# }
?>
</body>
</html>