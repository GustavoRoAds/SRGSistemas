program SRGSistemas;

uses
  Vcl.Forms,
  uSRGSistemas in 'uSRGSistemas.pas' {fSRGSistemas},
  uCliente in 'Units\uCliente.pas' {fCliente},
  uPadrao in 'Units\uPadrao.pas' {fPadrao},
  uDM in 'Units\uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfSRGSistemas, fSRGSistemas);
  Application.CreateForm(TfCliente, fCliente);
  Application.CreateForm(TfPadrao, fPadrao);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
