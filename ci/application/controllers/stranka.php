<?php

if ( ! defined('BASEPATH')) exit('access allowed');

class Stranka extends CI_Controller {
	
	function index()
	{
		//helper('url') handluje base_url() vo view
		$this->load->helper('url');
		$this->load->model('Model_stranka');
		
		$data['title'] = 'stranka';
		
		$sql = 'SELECT id,suradnice FROM budova ';
		$data['query'] = $this->Model_stranka->select_from_db($sql);
		
		$this->load->view('stranka_view',$data);
	}
}
?>