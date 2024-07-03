<?php

class Admin extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $role = $this->session->userdata('role');
        if ($role <> 2) {
            redirect(site_url('site'));
        }
    }

    public function uploadFile()
    {
        $config['encrypt_name'] = TRUE;
        $config['upload_path'] = 'upload';
        $config['allowed_types'] = 'jpg|png|jpeg|pdf';
        $config['overwrite'] = false;
        $config['max_size'] = 3000;


        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if ($this->upload->do_upload('file')) {
            return $this->upload->data("file_name");
        }
        $error = $this->upload->display_errors();
        echo $error;
        exit;
    }
    public function uploadBukti()
    {
        $config['encrypt_name'] = TRUE;
        $config['upload_path'] = 'upload';
        $config['allowed_types'] = 'jpg|png|jpeg|pdf';
        $config['overwrite'] = false;
        $config['max_size'] = 3000;


        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if ($this->upload->do_upload('bukti')) {
            return $this->upload->data("file_name");
        }
        $error = $this->upload->display_errors();
        echo $error;
        exit;
    }
    function index()
    {

        $data = array(
            'judul' => 'Dashboard',
            'konfirmasi' => $this->m_umum->hitung_service('transaksi', 'status', '0'),
            'pembayaran' => $this->m_umum->hitung_service('transaksi', 'status', '1'),
            'kedatangan' => $this->m_umum->hitung_service('transaksi', 'status', '2'),
            'dikerjakan' => $this->m_umum->hitung_service('transaksi', 'status', '3'),
            'selesai' => $this->m_umum->hitung_service('transaksi', 'status', '4'),
        );
        $this->template->load('admin/template', 'admin/home', $data);
    }
    function transaksi()
    {

        $data = array(
            'judul' => 'Transaksi',
            'dt_transaksi' => $this->m_umum->get_transaksi(),
            'dt_pelanggan' => $this->m_umum->get_data('pelanggan'),
            'dt_service' => $this->m_umum->get_data('service'),
        );
        $this->template->load('admin/template', 'admin/transaksi', $data);
    }
    function simpan_transaksi()
    {
        $tgl_booking = $this->input->post('tgl_booking');

        $kode_unik = substr(str_shuffle("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 5);
        $tgl = date('d');
        $bln = date('m');
        $thn = date('Y');
        $jam = date('h');
        $hariini = date('Y-m-d');
        $menitdetik = date('is');

        $no_transaksi = 'BS' . $tgl . $jam . $kode_unik . $thn . $menitdetik . $bln;
        $detail = $this->m_umum->get_booking($tgl_booking);
        if ($detail->num_rows() >= 20) {
            $notif = "Penuh di hari tersebut";
            $this->session->set_flashdata('delete', $notif);
            redirect('admin/transaksi');
        } else {
            $this->db->set('id_transaksi', 'UUID()', FALSE);
            $this->db->set('no_transaksi', $no_transaksi);
            $this->db->set('tgl_transaksi', $hariini);
            $this->db->set('status', 1);
            $this->form_validation->set_rules('tgl_booking', 'tgl_booking', 'required');
            if ($this->form_validation->run() === FALSE)
                redirect('admin/transaksi');
            else {

                $this->m_umum->set_data("transaksi");
                $notif = "Tambah Data Berhasil";
                $this->session->set_flashdata('success', $notif);
                redirect('admin/transaksi');
            }
        }
    }
    function bayar()
    {
        $id_transaksi = $this->input->post('id_transaksi');

        $file = $this->uploadBukti();

        $data_update = array(
            'bukti' => $file
        );
        $where = array('id_transaksi' => $id_transaksi);
        $res = $this->m_umum->UpdateData('transaksi', $data_update, $where);
        $notif = "Bukti Pembayaran berhasil di upload";
        $this->session->set_flashdata('success', $notif);
        redirect('admin/transaksi');
    }
    function update_transaksi()
    {

        $this->form_validation->set_rules('id_transaksi', 'id_transaksi', 'required');
        $this->form_validation->set_rules('status', 'status', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/transaksi');
        else {
            $this->m_umum->update_data("transaksi");
            $notif = " Update Data Berhasil";
            $this->session->set_flashdata('update', $notif);
            redirect('admin/transaksi');
        }
    }
    function delete_transaksi($id)
    {

        $this->m_umum->hapus('transaksi', 'id_transaksi', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/transaksi');
    }
    function pesan()
    {

        $data = array(
            'judul' => 'Pesan',
            'dt_kontak' => $this->m_umum->get_data('kontak'),
        );
        $this->template->load('admin/template', 'admin/pesan', $data);
    }

    function delete_pesan($id)
    {

        $this->m_umum->hapus('kontak', 'id_kontak', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/pesan');
    }
    function kategori()
    {

        $data = array(
            'judul' => 'Kategori',
            'dt_kategori' => $this->m_umum->get_data('kategori'),
        );
        $this->template->load('admin/template', 'admin/kategori', $data);
    }
    function simpan_kategori()
    {

        $this->db->set('id_kategori', 'UUID()', FALSE);
        $this->form_validation->set_rules('nama_kategori', 'nama_kategori', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/kategori');
        else {

            $this->m_umum->set_data("kategori");
            $notif = "Tambah Data Berhasil";
            $this->session->set_flashdata('success', $notif);
            redirect('admin/kategori');
        }
    }
    function update_kategori()
    {

        $this->form_validation->set_rules('id_kategori', 'id_kategori', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/kategori');
        else {
            $this->m_umum->update_data("kategori");
            $notif = " Update Data Berhasil";
            $this->session->set_flashdata('update', $notif);
            redirect('admin/kategori');
        }
    }
    function delete_kategori($id)
    {

        $this->m_umum->hapus('kategori', 'id_kategori', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/kategori');
    }

    function testimoni()
    {

        $data = array(
            'judul' => 'Testimoni',
            'dt_testimoni' => $this->m_umum->get_testimoni(),
        );
        $this->template->load('admin/template', 'admin/testimoni', $data);
    }
    function simpan_testimoni()
    {

        $this->db->set('id_testimoni', 'UUID()', FALSE);
        $this->form_validation->set_rules('nama_testimoni', 'nama_testimoni', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/testimoni');
        else {

            $this->m_umum->set_data("testimoni");
            $notif = "Tambah Data Berhasil";
            $this->session->set_flashdata('success', $notif);
            redirect('admin/testimoni');
        }
    }
    function update_testimoni()
    {

        $this->form_validation->set_rules('id_testimoni', 'id_testimoni', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/testimoni');
        else {
            $this->m_umum->update_data("testimoni");
            $notif = " Update Data Berhasil";
            $this->session->set_flashdata('update', $notif);
            redirect('admin/testimoni');
        }
    }
    function delete_testimoni($id)
    {

        $this->m_umum->hapus('testimoni', 'id_testimoni', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/testimoni');
    }
    function service()
    {

        $data = array(
            'judul' => 'Service',
            'dt_service' => $this->m_umum->get_service(),
            'dt_kategori' => $this->m_umum->get_data('kategori'),
        );
        $this->template->load('admin/template', 'admin/service', $data);
    }
    function simpan_service()
    {
        $this->db->set('id_service', 'UUID()', FALSE);
        $nama_service = $this->input->post('nama_service');
        $id_kategori = $this->input->post('id_kategori');
        $biaya = $this->input->post('biaya');
        $durasi = $this->input->post('durasi');
        $file = $this->uploadFile();

        $data = array(

            'nama_service' => $nama_service,
            'id_kategori' => $id_kategori,
            'biaya' => $biaya,
            'durasi' => $durasi,
            'file' => $file
        );

        $this->m_umum->input_data($data, 'service');
        $notif = "Tambah Data Berhasil";
        $this->session->set_flashdata('success', $notif);
        redirect('admin/service');
    }


    function update_service()
    {
        $id_service = $this->input->post('id_service');
        $nama_service = $this->input->post('nama_service');
        $id_kategori = $this->input->post('id_kategori');
        $biaya = $this->input->post('biaya');
        $durasi = $this->input->post('durasi');
        $old_file = $this->input->post('old_file');

        if (!empty($_FILES["file"]["name"])) {
            $file = $this->uploadFile();
        } else {
            $file = $old_file;
        }
        $data_update = array(
            'nama_service' => $nama_service,
            'id_kategori' => $id_kategori,
            'biaya' => $biaya,
            'durasi' => $durasi,
            'file' => $file
        );
        $where = array('id_service' => $id_service);
        $res = $this->m_umum->UpdateData('service', $data_update, $where);
        $notif = "Update Data Berhasil";
        $this->session->set_flashdata('success', $notif);
        redirect('admin/service');
    }
    function delete_service($id)
    {

        $this->m_umum->hapus('service', 'id_service', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/service');
    }

    function gallery()
    {

        $data = array(
            'judul' => 'Gallery',
            'dt_gallery' => $this->m_umum->get_data('gallery'),

        );
        $this->template->load('admin/template', 'admin/gallery', $data);
    }
    function simpan_gallery()
    {
        $this->db->set('id_gallery', 'UUID()', FALSE);
        $nama_gallery = $this->input->post('nama_gallery');
        $ket = $this->input->post('ket');
        $file = $this->uploadFile();

        $data = array(

            'nama_gallery' => $nama_gallery,
            'ket' => $ket,
            'file' => $file
        );

        $this->m_umum->input_data($data, 'gallery');
        $notif = "Tambah Data Berhasil";
        $this->session->set_flashdata('success', $notif);
        redirect('admin/gallery');
    }


    function update_gallery()
    {
        $id_gallery = $this->input->post('id_gallery');
        $nama_gallery = $this->input->post('nama_gallery');
        $ket = $this->input->post('ket');

        $old_file = $this->input->post('old_file');

        if (!empty($_FILES["file"]["name"])) {
            $file = $this->uploadFile();
        } else {
            $file = $old_file;
        }
        $data_update = array(
            'nama_gallery' => $nama_gallery,
            'ket' => $ket,
            'file' => $file
        );
        $where = array('id_gallery' => $id_gallery);
        $res = $this->m_umum->UpdateData('gallery', $data_update, $where);
        $notif = "Update Data Berhasil";
        $this->session->set_flashdata('success', $notif);
        redirect('admin/gallery');
    }
    function delete_gallery($id)
    {

        $this->m_umum->hapus('gallery', 'id_gallery', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/gallery');
    }

    function pelanggan()
    {

        $data = array(
            'judul' => 'pelanggan',
            'dt_pelanggan' => $this->m_umum->get_data('pelanggan'),
        );
        $this->template->load('admin/template', 'admin/pelanggan', $data);
    }
    function simpan_pelanggan()
    {

        $this->db->set('id_pelanggan', 'UUID()', FALSE);
        $this->form_validation->set_rules('nama_pelanggan', 'nama_pelanggan', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/pelanggan');
        else {

            $this->m_umum->set_data("pelanggan");
            $notif = "Tambah Data Berhasil";
            $this->session->set_flashdata('success', $notif);
            redirect('admin/pelanggan');
        }
    }
    function update_pelanggan()
    {

        $this->form_validation->set_rules('id_pelanggan', 'id_pelanggan', 'required');
        if ($this->form_validation->run() === FALSE)
            redirect('admin/pelanggan');
        else {
            $this->m_umum->update_data("pelanggan");
            $notif = " Update Data Berhasil";
            $this->session->set_flashdata('update', $notif);
            redirect('admin/pelanggan');
        }
    }
    function delete_pelanggan($id)
    {

        $this->m_umum->hapus('pelanggan', 'id_pelanggan', $id);
        $notif = " Data Berhasil dihapuskan";
        $this->session->set_flashdata('delete', $notif);
        redirect('admin/pelanggan');
    }
    function laporan_pelanggan()
    {

        $data = array(
            'judul' => 'Data Pelanggan',
            'dt_pelanggan' => $this->m_umum->get_data('pelanggan')
        );
        $this->load->view('laporan/pelanggan', $data);
    }
    function laporan_keuangan()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');

        $data = array(
            'judul' => 'Data Transaksi Keuangan',
            'dt_transaksi' => $this->m_umum->get_transaksi_keuangan($dari, $sampai)
        );
        $this->load->view('laporan/transaksi', $data);
    }
    function laporan_karyawan()
    {

        $data = array(
            'judul' => 'Data Karyawan',
            'dt_karyawan' => $this->m_umum->get_data('karyawan')
        );
        $this->load->view('laporan/karyawan', $data);
    }
    function laporan_service()
    {

        $data = array(
            'judul' => 'Data service',
            'dt_service' => $this->m_umum->get_service()
        );
        $this->load->view('laporan/service', $data);
    }


    // check slot
    public function check_slot()
    {
        if ($this->input->is_ajax_request()) {
            $tanggal = $this->input->post('tanggal');
            $jam = $this->input->post('jam');
            $id_service = $this->input->post('id_service');
            // var_dump($tanggal);
            $detail = $this->m_umum->get_booking_slot($tanggal, $jam, $id_service);
            $data = array();
            if ($jam == '17') {
                if ($detail->num_rows() >= 2) {
                    $tersedia = false;
                    $batas_slot = 2;
                    $slot_tersedia = 0;
                    $keterangan = 'Slot sudah  penuh';
                } else {
                    $tersedia = true;
                    $batas_slot = 2;
                    $slot_tersedia = 2 - $detail->num_rows();
                    $keterangan = 'Slot tersedia. sisa slot ' . $slot_tersedia;
                }
            } else {
                if ($detail->num_rows() >= 3) {
                    $tersedia = false;
                    $batas_slot = 3;
                    $slot_tersedia = 0;
                    $keterangan = 'Slot sudah  penuh';
                } else {
                    $batas_slot = 3;
                    $tersedia = true;
                    $slot_tersedia = 3 - $detail->num_rows();
                    $keterangan = 'Slot tersedia. sisa slot ' . $slot_tersedia;
                }
            }
            $data = array(
                'tersedia' => $tersedia,
                'batas_slot' => $batas_slot,
                'slot_tersedia' => $slot_tersedia,
                'keterangan' => $keterangan,
            );

            echo json_encode($data);
        } else {
            show_404(); // Tampilkan error 404 jika bukan permintaan AJAX
        }
    }
}
