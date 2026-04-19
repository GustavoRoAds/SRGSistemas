unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TfMensagem = class(TForm)
    img: TImage;
    mTitulo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    mTexto: TLabel;
    pnOk: TPanel;
    btnOk: TSpeedButton;
    pnNao: TPanel;
    pnSim: TPanel;
    btnSim: TSpeedButton;
    btnNao: TSpeedButton;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    
    { Private declarations }
  public
    { Public declarations }
     procedure Mensagem(texto:string; titulo:string; tipoImg:string; btOk:boolean; btSim:boolean; btNao:boolean);
  end;

var
  fMensagem: TfMensagem;

implementation

uses BaseModule;

procedure TfMensagem.btnCancelarClick(Sender: TObject);
begin
  fMensagem.ModalResult := mrCancel;
  fMensagem.Close;
end;

procedure TfMensagem.btnSimClick(Sender: TObject);
begin
fMensagem.ModalResult := mrAbort;
  fMensagem.Close;
end;

procedure TfMensagem.btnNaoClick(Sender: TObject);
begin
  fMensagem.ModalResult := mrOk;
  fMensagem.Close;
end;

procedure TfMensagem.Mensagem(texto:string; titulo:string; tipoImg:string; btOk:boolean; btSim:boolean; btNao:boolean);
begin

  mTexto.Caption := texto;
  mTitulo.Caption := titulo;

  if tipoImg = 'S' then
  begin
    img.Picture.LoadFromFile(BaseModule.BasePath+'imagem\sucesso.png');
  end
  else if tipoImg = 'E' then
  begin
    img.Picture.LoadFromFile(BaseModule.BasePath+'imagem\erro.png');
  end
  else if tipoImg = 'A' then
  begin
    img.Picture.LoadFromFile(BaseModule.BasePath+'imagem\atencao.png');
  end;

  if btok = true then
  begin
    pnOk.Visible := true;
    btnOk.Visible := true;
  end
  else
  begin
    pnOk.Visible := false;
    btnOk.Visible := false;
  end;

  if btSim = true then
  begin
    pnSim.Visible := true;
    btnSim.Visible := true;
  end
  else
  begin
    pnSim.Visible := false;
    btnSim.Visible := false;
  end;

  if btNao = true then
  begin
    pnNao.Visible := true;
    btnNao.Visible := true;
  end
  else
  begin
    pnNao.Visible := false;
    btnNao.Visible := false;
  end;

  Self.ShowModal;
    
end;


{$R *.dfm}

end.
