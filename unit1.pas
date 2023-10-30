unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Calendar;

type
  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    Hitung: TButton;
    Panel1: TPanel;
    Ulang: TButton;
    Keluar: TButton;
    Cbkode: TComboBox;
    EDiskon: TEdit;
    ETotal: TEdit;
    ESubTotal: TEdit;
    EHarga: TEdit;
    ENama: TEdit;
    ENTY: TEdit;
    KodeBarang: TLabel;
    Quantity: TLabel;
    NamaBarang: TLabel;
    HargaSatuan: TLabel;
    SubTotal: TLabel;
    Diskon: TLabel;
    TotalBayar: Label;
    StaticText1: TStaticText;
    procedure btnHitungClick(Sender: TObject);
    procedure UlangClick(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  KodeBarang: string;
  NamaBarang: string;
  HargaSatuan, Quantity, SubTotal, Diskon, TotalBayar: Double;

begin
  KodeBarang := Cbkode.Text;
  case KodeBarang of
    'A01':
    begin
      NamaBarang := 'Speaker';
      HargaSatuan := 50000;
    end;
    'B02':
    begin
      NamaBarang := 'Mouse';
      HargaSatuan := 25000;
    end;
    'C03':
    begin
      NamaBarang := 'Harddisk';
      HargaSatuan := 750000;
    end;
    'D04':
    begin
      NamaBarang := 'Mouse Pad';
      HargaSatuan := 5000;
    end;
    else
    begin
      ShowMessage('Kode barang tidak valid');
      Exit;
    end;
  end;

  if TryStrToFloat(ENTY.Text, Quantity) then
  begin
    if (Quantity >= 1) and (Quantity <= 10) then
    begin
      SubTotal := HargaSatuan * Quantity;
      ESubTotal.Text := FloatToStr(SubTotal);

      case KodeBarang of
        'A01':
        begin
          if SubTotal >= 1000000 then
            Diskon := 0.15; // 15% diskon
          else if SubTotal >= 500000 then
            Diskon := 0.1; // 10% diskon
          else if SubTotal >= 25000 then
            Diskon := 0.05; // 5% diskon
          else
            Diskon := 0; // Tidak ada diskon
        end;
        'B02':
        begin
          if SubTotal >= 1000000 then
            Diskon := 0.1; // 10% diskon
          else if SubTotal >= 500000 then
            Diskon := 0.05; // 5% diskon
          else if SubTotal >= 25000 then
            Diskon := 0.02; // 2% diskon
          else
            Diskon := 0; // Tidak ada diskon
        end;
        'C03':
        begin
          if SubTotal >= 1000000 then
            Diskon := 0.05; // 5% diskon
          else if SubTotal >= 500000 then
            Diskon := 0.03; // 3% diskon
          else if SubTotal >= 25000 then
            Diskon := 0.01; // 1% diskon
          else
            Diskon := 0; // Tidak ada diskon
        end;
        'D04':
        begin
          if SubTotal >= 25000 then
            Diskon := 0.05; // 5% diskon
          else
            Diskon := 0; // Tidak ada diskon
        end;
      end;

      EDiskon.Text := FloatToStr(Diskon * 100) + '%'; // Menampilkan diskon dalam persen
      TotalBayar := SubTotal - (SubTotal * Diskon);
      ETotal.Text := FloatToStr(TotalBayar);
    end
    else
      ShowMessage('Quantity harus antara 1 dan 10');
  end
  else
    ShowMessage('Quantity tidak valid. Harap masukkan angka yang benar.');
end;

procedure TForm1.UlangClick(Sender: TObject);
begin
  Cbkode.ItemIndex := -1;
  ENama.Clear;
  EHarga.Clear;
  ENTY.Clear;
  ESubTotal.Clear;
  EDiskon.Clear;
  ETotal.Clear;
end;

procedure TForm1.KeluarClick(Sender: TObject);
begin
  Close;
end;

end.

