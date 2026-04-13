object DM: TDM
  Height = 480
  Width = 640
  object oQry: TFDQuery
    Connection = oCon
    SQL.Strings = (
      '')
    Left = 304
    Top = 224
  end
  object oCon: TFDConnection
    Params.Strings = (
      'Database=C:\SRGSistemas\SRGSQLite\srgsistemas.db'
      'DriverID=SQLite')
    Connected = True
    Left = 368
    Top = 216
  end
end
