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
		$query = $this->db->query('SELECT name, title, email FROM test');

		foreach ($query->result() as $row)
			{
    		echo $row->title;
    		echo "<br />";
    		echo $row->name;
    		echo "<br />";
    		echo $row->email;
    		echo "<br />";
			}

			echo 'Total Results: ' . $query->num_rows();
			?>
		</section>

		<footer> Footer </footer>
	</div>
</body>
</html>