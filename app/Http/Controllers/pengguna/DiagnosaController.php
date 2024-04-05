<?php

namespace App\Http\Controllers\pengguna;

use App\Http\Controllers\pengguna\PenggunaController;
use App\Models\Diagnosa;
use Illuminate\Http\Request;
use App\Models\Gejala;
use App\Models\Penyakit;
use App\Models\BasisPengetahuan;

class DiagnosaController extends PenggunaController
{
    public $title = "Diagnosa";

    public function index()
    {
        $title = $this->title;
        $bcrum = $this->bcrum('Diagnosa');
        $gejalas = Gejala::all();
        return view('pengguna.diagnosa.index', compact('title', 'bcrum', 'gejalas'));
    }

    public function analisa(Request $request)
    {
        if(empty($request->kondisi) || count($request->kondisi) < 2){
            $this->notification('success', 'Sehat', 'Kucing sehat tanpa gejala');
            return redirect(route('pengguna.diagnosa.index'));
        }
        $arbobot = [0, 0.25];
        $argejala = [];
        $arrnbKombine = [];
        $kepastian = [];
        for ($i = 0; $i < count($request->kondisi); $i++) {
            $arkondisi = explode("_", $request->kondisi[$i]);
            if($arkondisi[1] == '1'||$arkondisi[1] == '2') {
                $kondisi[] = $arkondisi[0];
                $kepastian[$arkondisi[0]] = $arkondisi[1];
            }
            if (strlen($request->kondisi[$i]) > 1) {
                $argejala += [$arkondisi[0] => $arkondisi[1]];
                $penyakits = Penyakit::with(['basis_pengetahuans' => function ($result) use ($kepastian) {
                    $result->with('gejala')->whereIn('gejala_id', array_keys($kepastian));
                }])->whereHas('basis_pengetahuans', function ($result) use ($kepastian) {
                    $result->with('gejala')->whereIn('gejala_id', array_keys($kepastian));
                })->groupBy('id')->orderBy('id')->get();  
            }
        }
        //Array untuk penyakit adalah $penyakits
        //Array untuk nilai diagnosa gejala adalah $kepastian

        $pax = [];
        $pbax = [];
        $totalGejala = count($kondisi);
        $totalPenyakit= count($penyakits);

        foreach($penyakits as $penyakit) {
            $pbx=1; //probabilitas gejala muncul
            $paxv = $pbx / $totalGejala; //P(Ax) = Probabilitas Penyakit muncul
            $pax[$penyakit->id] = $paxv;
            foreach($kondisi as $k) {
                $bx=$penyakit->basis_pengetahuans()->where('gejala_id', $k)->count(); //probabilitas penyakit muncul akibat gejala
                
                $pbxax = $bx / $totalPenyakit; //P(Bx|Ax) = Probabilitas Gejala muncul oleh Rule Penyakit
                $pbax[$penyakit->id][$k] = $pbxax;
            }
        }

        $cal_penyakit = [];

        foreach ($pax as $penyakit => $paxv) {
            foreach ($pbax[$penyakit] as $gejala => $pbaxv) {
                $divider = 0;
                foreach ($penyakits as $p) {
                    $divider += $pbax[$p->id][$gejala] * $pax[$p->id];
                }
                $bp = BasisPengetahuan::where('gejala_id', $gejala)->where('penyakit_id', $penyakit)->first();
                $bobot = $bp ? $bp->bobot : 0;
                $cal_penyakit[$penyakit][$gejala] = $divider == 0 ? 0 : (($pbaxv * $paxv) / $divider) * $bobot;
            }
        }
        
        $total_keseluruhan = 0;
        foreach ($cal_penyakit as $cal) {
            foreach($cal as $nilai) {
                $total_keseluruhan += $nilai;
            }
        }

        $hasil_akhir = [];
        foreach($cal_penyakit as $penyakit => $kal) {
            $hasil_akhir[$penyakit] = round(array_sum($kal) / $total_keseluruhan,2);
        }
        arsort(($hasil_akhir));
        Diagnosa::create([
            'nik' => session('biodata')['nik'],
            'nama_pemilik' => session('biodata')['nama_pemilik'],
            'no_hp' => session('biodata')['no_hp'],
            'alamat' => session('biodata')['alamat'],
            'nama_peliharaan' => session('biodata')['nama_peliharaan'],
            'jekel' => session('biodata')['jekel'],
            'umur' => (session('biodata')['umur']) > 0 ? (session('biodata')['umur']) : null,
            'berat' => (session('biodata')['berat']) > 0 ? (session('biodata')['berat']) : null,
            'suhu' => (session('biodata')['suhu']) > 0 ? (session('biodata')['suhu']) : null,
            'penyakit_id' => array_key_first($hasil_akhir),
            'presentase' => $hasil_akhir[array_key_first($hasil_akhir)]
        ]);
        $title = $this->title;
        $bcrum = $this->bcrum('Hasil', route('pengguna.diagnosa.index'), $title);
        $gejalas = Gejala::all();
        return view('pengguna.diagnosa.analisa', compact('hasil_akhir', 'penyakits', 'kepastian', 'gejalas', 'title', 'bcrum'));
    }

    public function reset(Request $request)
    {
        $request->session('biodata')->flush();
        return redirect()->route('pengguna.biodata.index');
    }
}
