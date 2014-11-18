<?php

class Model_stranka extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}
	
	function select_from_db($sql){
		$query = $this->db->query($sql);
		return $query->result();
	}
	
}

?>