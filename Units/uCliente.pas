unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TfCliente = class(TForm)
    pnBotao: TPanel;
    Panel1: TPanel;
    clSalvar: TSpeedButton;
    Panel2: TPanel;
    clLimpar: TSpeedButton;
    Panel3: TPanel;
    clExcluir: TSpeedButton;
    clCodigo: TEdit;
    clEdCpj: TEdit;
    clEdRg: TEdit;
    cllbCpj: TLabel;
    cllbRg: TLabel;
    clNome: TEdit;
    Label3: TLabel;
    clCep: TEdit;
    Label1: TLabel;
    clEndereco: TEdit;
    Label2: TLabel;
    clNumeroEnd: TEdit;
    Label4: TLabel;
    clBairro: TEdit;
    Label5: TLabel;
    clTelefone: TEdit;
    Label6: TLabel;
    clCelular: TEdit;
    Label7: TLabel;
    clEdFantasia: TEdit;
    cllbFantasia: TLabel;
    clObs: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}

procedure TfCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    fCliente.close;
end;

end.
