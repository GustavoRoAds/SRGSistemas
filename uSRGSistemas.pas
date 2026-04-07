unit uSRGSistemas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfSRGSistemas = class(TForm)
    Panel2: TPanel;
    pnMenu: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Panel4: TPanel;
    srCliente: TImage;
    procedure srClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSRGSistemas: TfSRGSistemas;

implementation

{$R *.dfm}

uses uCliente;

procedure TfSRGSistemas.srClienteClick(Sender: TObject);
begin
  fCliente.ShowModal;
end;

end.
