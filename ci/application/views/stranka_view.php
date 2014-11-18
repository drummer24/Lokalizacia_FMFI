<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title><?php echo $title;?></title>
<!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

<link rel="stylesheet"
	href="<?php echo base_url();?>assets/css/mainstyle.css"
	type="text/css" />

</head>
<body>
	<div id="wrapper">
		<header>
			<span class="red">Cerveny Header</span>
		</header>
		<nav>Nav</nav>
		<section id="content">Content
		<br />
		<?php 
		foreach ($query as $row)
			{
    		echo $row->id;
    		echo "<br />";
    		echo $row->suradnice;
    		echo "<br />";
    		}
			?>
		</section>

		<footer> Footer </footer>
	</div>
</body>
</html>