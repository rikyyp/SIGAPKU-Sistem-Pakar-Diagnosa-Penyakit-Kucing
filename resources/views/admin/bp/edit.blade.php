@extends('layouts.admin.main')

@section('title')
    {{ $title }}
@endsection

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ $title }}</h1>
        </div>

        <div class="section-body">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>Edit {{ $title }}</h4>
                </div>
                <form action="{{ route('admin.bp.update', $bp->id) }}" method="post">
                    @method('PUT')
                    @csrf
                    <div class="card-body">
                        <div class="form-group">
                            <label for="gejala">Nama Gejala</label>
                            <select class="form-control cb @error('gejala_id') is-invalid @enderror" id="gejala"
                                name="gejala_id">
                                <option disabled>-- Pilih Gejala --</option>
                                @foreach ($gejalas as $gejala)
                                    <option value="{{ $gejala->id }}" {{ $bp->gejala_id == $gejala->id ? 'selected' : null }}>
                                        {{ $gejala->nama }}
                                    </option>
                                @endforeach
                            </select>
                            @error('gejala_id')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="penyakit">Nama Penyakit</label>
                            <select class="form-control cb @error('gejala_id') is-invalid @enderror" id="penyakit"
                                name="penyakit_id">
                                <option disabled>-- Pilih Penyakit --</option>
                                @foreach ($penyakits as $penyakit)
                                    <option value="{{ $penyakit->id }}" {{ $bp->penyakit_id == $penyakit->id ?? null }}>
                                        {{ $penyakit->nama }}</option>
                                @endforeach
                            </select>
                            @error('penyakit_id')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="bobot">Bobot nilai</label>
                            <small>*Pengaruh gejala terhadap munculnya penyakit</small>
                            <select name="bobot" id="bobot" class="form-control">
                                <option value="" selected readonly>-- Pilih --</option>
                                <option value="4">Sangat berpengaruh (4)</option>
                                <option value="3">Berpengaruh (3)</option>
                                <option value="2">Cukup berpengaruh (2)</option>
                                <option value="1">Kurang berpengaruh (1)</option>
                            </select>
                            @error('bobot')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        
                    </div>
                    <div class="card-footer text-right">
                        <a href="{{ route('admin.bp.index') }}" class="btn btn-danger"><i class="fas fa-arrow-left"></i>
                            Kembali</a>
                        <button type="submit" class="btn btn-success"><i class="fa fa-plus"></i> Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection

@push('css')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
@endpush

@push('js')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
@endpush

@push('script')
    <script>
        $(document).ready(() => {
            $(".cb").select2();
        });
    </script>
@endpush
