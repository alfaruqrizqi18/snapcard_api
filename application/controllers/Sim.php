<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sim extends CI_Controller
{

    public function sim_card()
    {
        $query = $this->db->query('SELECT * FROM sim_card ORDER BY id DESC')->result_array();
        $to_json = array(
            'message' => "success",
            'row' => count($query),
            "data" => $query == null ? null : $query
        );
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }

    public function sim_card_plus()
    {
        $query = $this->db->query('SELECT * FROM sim_card_plus ORDER BY id DESC')->result_array();
        $to_json = array(
            'message' => "success",
            'row' => count($query),
            "data" => $query == null ? null : $query
        );
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }


    public function create_sim_card()
    {
        $input_sim_card_barcode = $this->input->post('sim_card_barcode');
        $to_json = array();
        $query = $this->db->query("SELECT * FROM sim_card WHERE sim_card_barcode = '$input_sim_card_barcode'")->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "duplicate"
            );
        } else {
            $this->db->insert('sim_card', array('sim_card_barcode' => $input_sim_card_barcode));
            $to_json = array(
                'message' => "success"
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }

    public function create_sim_card_plus()
    {
        $input_sim_card_plus_barcode = $this->input->post('sim_card_plus_barcode');
        $input_physical_voucher = $this->input->post('physical_voucher');
        $to_json = array();
        $query = $this->db->query(
            "SELECT * 
            FROM sim_card_plus 
            WHERE sim_card_plus_barcode = '$input_sim_card_plus_barcode'
            AND physical_voucher = '$input_physical_voucher'
            "
        )->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "duplicate"
            );
        } else {
            $this->db->insert('sim_card_plus', array(
                'sim_card_plus_barcode' => $input_sim_card_plus_barcode,
                'physical_voucher' => $input_physical_voucher
            ));
            $to_json = array(
                'message' => "success"
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }
}
