<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller {

	public function index()
	{
        
        $query = $this->db->query('SELECT * FROM sim_card')->result_array();
        $to_json = array(
            'status_code' => 200,
            'message' => "success",
            "data" => $query
        );
		$this->output->set_content_type('application/json')
        ->set_output(json_encode($to_json));
	}
}
