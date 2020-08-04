<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Users extends CI_Controller
{

    public function login()
    {
        $input_username = $this->input->post('username');
        $input_password = sha1($this->input->post('password'));
        $to_json = array();
        $query = $this->db->query(
            "SELECT * 
            FROM users 
            WHERE username = '$input_username'
            AND password = '$input_password'
            "
        )->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "success",
            );
        } else {
            $to_json = array(
                'message' => "failed",
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }
}
