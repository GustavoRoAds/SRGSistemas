program SRGSistemas;

uses
  Vcl.Forms,
  uSRGSistemas in 'uSRGSistemas.pas' {fSRGSistemas},
  uCliente in 'Units\uCliente.pas' {fCliente},
  uPadrao in 'Units\uPadrao.pas' {fPadrao},
  uDM in 'Units\uDM.pas' {DM: TDataModule},
  estrutura_banco in 'Units\estrutura_banco.pas',
  uLogin in 'Units\uLogin.pas' {fLogin},
  BaseModule in 'BaseModule.pas',
  uMensagem in 'Units\uMensagem.pas' {fMensagem},
  uLocal in 'Units\uLocal.pas' {fPadrao1},
  uCarregaLocal in 'Units\uCarregaLocal.pas',
  uConsulta in 'Units\uConsulta.pas' {fConsulta},
  uUtils in 'Units\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfMensagem, fMensagem);
  Application.CreateForm(TfPadrao1, fPadrao1);
  Application.CreateForm(TfConsulta, fConsulta);
  Application.Run;
end.
