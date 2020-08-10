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

    public function report()
    {
        $start = $this->input->get('start');
        $end = $this->input->get('end');
        $query_sim_card = $this->db->query(
            "SELECT * 
            FROM sim_card 
            WHERE created_at BETWEEN CAST('$start' as DATE) AND CAST('$end' as DATE)
            ORDER BY id DESC
            "
        )->result_array();
        $query_sim_card_plus = $this->db->query(
            "SELECT * 
            FROM sim_card_plus 
            WHERE created_at BETWEEN CAST('$start' as DATE) AND CAST('$end' as DATE)
            ORDER BY id DESC
            "
        )->result_array();
        $query_bundling = $this->db->query(
            "SELECT * 
            FROM bundling 
            WHERE created_at BETWEEN CAST('$start' as DATE) AND CAST('$end' as DATE)
            ORDER BY id DESC
            "
        )->result_array();
        $to_json = array(
            'message' => "success",
            "sim_card" => array(
                "rows" => count($query_sim_card),
                "data" => $query_sim_card == null ? null : $query_sim_card
            ),
            "sim_card_plus" => array(
                "rows" => count($query_sim_card_plus),
                "data" => $query_sim_card_plus == null ? null : $query_sim_card_plus
            ),
            "bundling" => array(
                "rows" => count($query_bundling),
                "data" => $query_bundling == null ? null : $query_bundling
            )
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

    public function create_bundling()
    {
        $sim_card_1 = $this->input->post('sim_card_1');
        $sim_card_2 = $this->input->post('sim_card_2');
        $imei_1 = $this->input->post('imei_1');
        $imei_2 = $this->input->post('imei_2');
        $brand = $this->input->post('brand');

        $to_json = array();
        $query = $this->db->query(
            "SELECT * 
            FROM bundling 
            WHERE sim_card_1 = '$sim_card_1'
            AND sim_card_2 = '$sim_card_2'
            AND imei_1 = '$imei_1'
            AND imei_2 = '$imei_2'
            AND brand = '$brand'
            "
        )->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "duplicate"
            );
        } else {
            $this->db->insert('bundling', array(
                'sim_card_1' => $sim_card_1,
                'sim_card_2' => $sim_card_2,
                'imei_1' => $imei_1,
                'imei_2' => $imei_2,
                'brand' => $brand,
            ));
            $to_json = array(
                'message' => "success"
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }

    public function check_whitelist()
    {
        $input_phone_number_or_imei = $this->input->post('input_phone_number_or_imei');
        $to_json = array();
        $query = $this->db->query(
            "SELECT * 
            FROM whitelist
            WHERE phone_number = '$input_phone_number_or_imei'
            OR imei = '$input_phone_number_or_imei' 
            "
        )->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "success"
            );
        } else {
            $to_json = array(
                'message' => "not_found"
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }

    public function check_blacklist()
    {
        $input_phone_number_or_imei = $this->input->post('input_phone_number_or_imei');
        $to_json = array();
        $query = $this->db->query(
            "SELECT * 
            FROM blacklist
            WHERE phone_number = '$input_phone_number_or_imei'
            OR imei = '$input_phone_number_or_imei' 
            "
        )->result_array();
        if ($query != null) {
            $to_json = array(
                'message' => "success"
            );
        } else {
            $to_json = array(
                'message' => "not_found"
            );
        }
        $this->output->set_content_type('application/json')
            ->set_output(json_encode($to_json));
    }
}
