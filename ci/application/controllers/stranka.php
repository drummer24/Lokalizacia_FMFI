<?php

if ( ! defined('BASEPATH')) exit('access allowed');

class Stranka extends CI_Controller {
	
	function index()
	{
		//helper('url') handluje base_url() vo view
		$this->load->helper('url');
		$data['title'] = 'stranka';
		$this->load->view('stranka_view',$data);
	}
}
?>