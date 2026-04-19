unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Datasnap.DBClient;

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
    clEdCnpj: TEdit;
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
    Label10: TLabel;
    cledCidade: TEdit;
    Label11: TLabel;
    cledUf: TEdit;
    SpeedButton1: TSpeedButton;
    CDSCliente: TClientDataSet;
    DTSCliente: TDataSource;
    CDSClienteid: TStringField;
    CDSClientenome: TStringField;
    CDSClientecnpj: TStringField;
    CDSClientetelefone: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clCodigoExit(Sender: TObject);
    procedure clCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure salvar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}

uses uDM, BaseModule, uMensagem, uUtils;

procedure TfCliente.clCodigoExit(Sender: TObject);
var
  cQry:string;
begin
  DM.oQry.Connection := DM.oCon;
  DM.oQry.Close;
  DM.oQry.SQL.Clear;

  DM.oQry.SQL.Add('SELECT nome, cgc, rg, telefone, celular, cep, ');
  DM.oQry.SQL.Add('cidade, endereco, numero, bairro, uf, observacao ');
  DM.oQry.SQL.Add('FROM cliente WHERE codigo = :codigo');
  DM.oQry.ParamByName('codigo').AsString := clCodigo.Text;
  DM.oQry.Open();

  if DM.oQry.RecordCount > 0 then
  begin
    clNome.text := DM.oQry.FieldByName('nome').AsString;
    clEdCnpj.text := DM.oQry.FieldByName('cgc').AsString;
    clEdRg.text := DM.oQry.FieldByName('rg').AsString;
    clCep.text := DM.oQry.FieldByName('cep').AsString;

    clEndereco.text := DM.oQry.FieldByName('endereco').AsString;
    clNumeroEnd.text := DM.oQry.FieldByName('numero').AsString;
    clBairro.text := DM.oQry.FieldByName('bairro').AsString;
    cledUf.text := DM.oQry.FieldByName('uf').AsString;
    cledCidade.text := DM.oQry.FieldByName('cidade').AsString;
    clTelefone.text := DM.oQry.FieldByName('telefone').AsString;

    clCelular.text := DM.oQry.FieldByName('celular').AsString;
    clObs.text := DM.oQry.FieldByName('observacao').AsString;
  end
  else
  fMensagem.Mensagem('Registro não Localizado!', 'Atenção','E', true,false, false);
end;

procedure TfCliente.clCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    clCodigoExit(Sender);
end;

procedure TfCliente.clSalvarClick(Sender: TObject);
var
  cTexto: string;
  validaFormulario :boolean;
begin
  validaFormulario := true;

  cTexto := 'Esta faltando Preencher esses campos: '+chr(13)+chr(13);
  if clEdCnpj.Text = '' then
  begin
    cTexto := cTexto +'CNPJ Inválido! '+chr(13);
    validaFormulario := false;
  end;

  if clNome.Text = '' then
  begin
    cTexto := cTexto +'Nome Inválido! '+chr(13);
    validaFormulario := false;
  end;

  if clEdFantasia.Text = '' then
  begin
    cTexto := cTexto +'Nome Fantasia Inválido! '+chr(13);
    validaFormulario := false;
  end;

  if cledCidade.Text = '' then
  begin
    cTexto := cTexto +'Cidade Inválido! '+chr(13);
    validaFormulario := false;
  end;

  if validaFormulario then
  begin
    salvar();
  end
  else
  begin
    fMensagem.Mensagem(cTexto, 'Atenção', 'A', true, false, false);
  end;
    
end;

procedure TfCliente.salvar();
var
  cQry:string;
  cTexto:string;
begin
  try
    DM.oQry.Connection := DM.oCon;
    DM.oQry.Close;
    DM.oQry.SQL.Clear;

    if clCodigo.Text <> '' then
    begin
      cQry := 'UPDATE cliente SET nome = :nome, cgc = :cgc, rg = :rg, cep = :cep, ';
      cQry := cQry + ' endereco = :endereco, numero = :numero, bairro = :bairro, uf := :uf, cidade = :cidade, telefone = :telefone, ';
      cQry := cQry + ' celular = :celular, observacao = :observacao WHERE empresa = :empresa';
      cTexto := 'Alterado com Sucesso!';
    end
    else
    begin
      cQry := 'INSERT INTO cliente (nome, cgc, rg, cep, ';
      cQry := cQry + 'endereco, numero, bairro, uf, cidade, telefone, ';
      cQry := cQry + 'celular, observacao, empresa) ';
      cQry := cQry + 'VALUES (';
      cQry := cQry + ':nome, :cgc, :rg, :cep, ';
      cQry := cQry + ':endereco, :numero, :bairro, :uf, :cidade, :telefone, ';
      cQry := cQry + ':celular, :observacao, :empresa)';
      cTexto := 'Inserido com Sucesso!';
    end;
    DM.oQry.SQL.Add(cQry);

    DM.oQry.ParamByName('nome').AsString := clNome.text;
    DM.oQry.ParamByName('cgc').AsString := clEdCnpj.text;
    DM.oQry.ParamByName('rg').AsString := clEdRg.text;
    DM.oQry.ParamByName('cep').AsString := clCep.text;

    DM.oQry.ParamByName('endereco').AsString := clEndereco.text;
    DM.oQry.ParamByName('numero').AsString := clNumeroEnd.text;
    DM.oQry.ParamByName('bairro').AsString := clBairro.text;
    DM.oQry.ParamByName('uf').AsString := cledUf.text;
    DM.oQry.ParamByName('cidade').AsString := cledCidade.text;
    DM.oQry.ParamByName('telefone').AsString := clTelefone.text;

    DM.oQry.ParamByName('celular').AsString := clCelular.text;
    DM.oQry.ParamByName('observacao').AsString := clObs.text;
    DM.oQry.ParamByName('empresa').AsInteger := BaseModule.codEmpresa;
  

  
    DM.oQry.ExecSQL();

  
    fMensagem.Mensagem(cTexto, 'Sucesso', 'S', true, false, false);

  except
    on e:Exception do
    begin
      fMensagem.Mensagem(e.Message, 'Falha!', 'E',true, false, false);
    end;
  end;
end;

procedure TfCliente.SpeedButton1Click(Sender: TObject);
begin
  abreMenu('Consulta',1);

  if BaseModule.nRetConsulta > 0 then
  begin
    clCodigo.Text := IntToStr(BaseModule.nRetConsulta);
    clCodigoExit(Sender);
  end;
  BaseModule.nRetConsulta := 0;
end;

procedure TfCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    fCliente.close;
end;

procedure TfCliente.FormShow(Sender: TObject);
begin
  CDSCliente.CreateDataSet;
end;

end.
