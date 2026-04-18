unit estrutura_banco;

interface
  procedure criaTabela1;
  procedure criaTabela2;
  procedure criaTabela3;
  procedure criaTabela4;

  procedure criaTodasTabelas();
implementation


uses uDM;

procedure criaTodasTabelas();
begin
  criaTabela1;
  criaTabela2;
  criaTabela3;
  criaTabela4;
end;

procedure criaTabela1;
var
  cQry:string;
begin
//  DM.oQry.Connection := DM.oCon;

  cQry := ' CREATE TABLE IF NOT EXISTS cliente( ';
  cQry := cQry + ' codigo INTEGER PRIMARY KEY AUTOINCREMENT, ';
  cQry := cQry + ' nome VARCHAR(100) NOT NULL, ';
  cQry := cQry + ' cgc VARCHAR(20) NOT NULL, ';
  cQry := cQry + ' rg VARCHAR(20), ';
  cQry := cQry + ' cep VARCHAR(10), ';
  cQry := cQry + ' endereco VARCHAR(200), ';
  cQry := cQry + ' numero VARCHAR(10), ';
  cQry := cQry + ' bairro VARCHAR(100), ';
  cQry := cQry + ' uf VARCHAR(2), ';
  cQry := cQry + ' cidade VARCHAR(100), ';
  cQry := cQry + ' telefone VARCHAR(20), ';
  cQry := cQry + ' celular VARCHAR(20), ';
  cQry := cQry + ' observacao VARCHAR(300), ';
  cQry := cQry + ' empresa INTEGER ';
  cQry := cQry + ');';


  DM.oQry.SQL.Clear;
  DM.oQry.SQL.Add(cQry);
  DM.oQry.ExecSQL();
end;

procedure criaTabela2;
var
  cQry:string;
begin
//  DM.oQry.Connection := DM.oCon;

  cQry := 'CREATE TABLE IF NOT EXISTS usuario (';
  cQry := cQry + ' codigo INTEGER PRIMARY KEY AUTOINCREMENT, ';
  cQry := cQry + ' nome VARCHAR(100), ';
  cQry := cQry + ' senha VARCHAR(100), ';
  cQry := cQry + ' admin VARCHAR(10) ';
  cQry := cQry + ');';

  DM.oQry.SQL.Clear;
  DM.oQry.SQL.Add(cQry);
  DM.oQry.ExecSQL();
end;

procedure criaTabela3;
var
  cQry:string;
begin
//  DM.oQry.Connection := DM.oCon;

  cQry := 'CREATE TABLE IF NOT EXISTS empresa (';
  cQry := cQry + ' codigo INTEGER PRIMARY KEY AUTOINCREMENT, ';
  cQry := cQry + ' cgc VARCHAR(18), ';
  cQry := cQry + ' nome VARCHAR(150), ';
  cQry := cQry + ' fantasia VARCHAR(150), ';
  cQry := cQry + ' endereco VARCHAR(200), ';
  cQry := cQry + ' bairro VARCHAR(100), ';
  cQry := cQry + ' numero VARCHAR(10), ';
  cQry := cQry + ' cep VARCHAR(10), ';
  cQry := cQry + ' telefone VARCHAR(20) ';
  cQry := cQry + ');';

  DM.oQry.SQL.Clear;
  DM.oQry.SQL.Add(cQry);
  DM.oQry.ExecSQL();
end;

procedure criaTabela4;
var
  cQry:string;
begin
//  DM.oQry.Connection := DM.oCon;

//  cQry := ' CREATE TABLE IF NOT EXISTS lembrasenha( ';
//  cQry := cQry + ' codigo INTEGER PRIMARY KEY AUTOINCREMENT, ';
//  cQry := cQry + ' id_usuario INTEGER, ';
//  cQry := cQry + ' usuariolembrar TEXT, ';
//  cQry := cQry + ' FOREIGN KEY (id_usuario) REFERENCES usuario(codigo) ';
//  cQry := cQry+  ');';

//  DM.oQry.SQL.Clear;
//  DM.oQry.SQL.Add(cQry);
//  DM.oQry.ExecSQL();
end;

end.

