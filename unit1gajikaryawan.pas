unit unit1GajiKaryawan;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
  { TPTCintaSejati }

  TPTCintaSejati = class(TForm)
    Hitung: TButton;
    Clear: TButton;
    Kluar: TButton;
    cbJabatan: TComboBox;
    EdtTotalGaji: TEdit;
    EdtTunjangan: TEdit;
    EdtGapok: TEdit;
    edtNama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgStatus: TRadioGroup;
    procedure btnHitungClick(Sender: TObject);
    procedure btnClearClick (Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PTCintaSejati: TPTCintaSejati;

implementation

{$R *.lfm}

procedure TPTCintaSejati.btnHitungClick(Sender: TObject);
var
  Gapok, Tunjangan, TotalGaji: Double;
begin
  // Mengambil data dari komponen input
  Gapok := StrToFloatDef(edtGapok.Text, 0); // Menggunakan nilai default 0 jika tidak ada input
  Tunjangan := 0; // Inisialisasi tunjangan dengan 0

  // Menghitung tunjangan berdasarkan jabatan
  if cbJabatan.ItemIndex = 0 then
  begin
    // Direktur
    Gapok := 5000000;
    Tunjangan := 1500000;
  end
  else if cbJabatan.ItemIndex = 1 then
  begin
    // Manager
    Gapok := 3000000;
    Tunjangan := 1500000;
  end
  else if cbJabatan.ItemIndex = 2 then
  begin
    // Karyawan
    Gapok := 1000000;
    Tunjangan := 500000;
  end;

  // Menghitung total gaji
  TotalGaji := Gapok + Tunjangan;

  // Menampilkan gaji pokok dan tunjangan pada komponen output
  edtGapok.Text := FloatToStr(Gapok);
  edtTunjangan.Text := FloatToStr(Tunjangan);

  // Menampilkan total gaji pada komponen output
  edtTotalGaji.Text := FloatToStr(TotalGaji);
end;


procedure TPTCintaSejati.btnClearClick(Sender: TObject);
begin
  // Mengosongkan semua komponen input
  edtNama.Clear;
  cbJabatan.ItemIndex := -1;
  edtGapok.Clear;
  edtTunjangan.Clear;
  rgStatus.ItemIndex := -1;

  // Mengosongkan dan menyembunyikan komponen output TotalGaji
  edtTotalGaji.Clear;
  edtTotalGaji.Visible := False;
end;
procedure TPTCintaSejati.btnCloseClick(Sender: TObject);
begin
  // Menutup aplikasi
  Application.Terminate;
end;

end.

