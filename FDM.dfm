object FSNDM: TFSNDM
  OldCreateOrder = False
  Height = 592
  Width = 772
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=PP_Roman_Andrey;Data Source=127.0.0.1;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Workstation ID=DESKTOP-9VBOF0G;Use Encryption for Data=False;Tag' +
      ' with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADOQueryGruppa: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Gruppa')
    Left = 144
    Top = 32
  end
  object ADOStoredProcGruppa: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodGrupp;1'
    Parameters = <>
    Left = 144
    Top = 160
  end
  object DataSourceGruppa: TDataSource
    DataSet = ADOQueryGruppa
    Left = 144
    Top = 88
  end
  object ADOQueryOcenka: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Ocenki'
      '')
    Left = 280
    Top = 32
  end
  object DataSourceOcenka: TDataSource
    DataSet = ADOQueryOcenka
    Left = 280
    Top = 88
  end
  object ADOStoredProcOcenka: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodOcen;1'
    Parameters = <>
    Left = 280
    Top = 160
  end
  object DataSourcePolzovat: TDataSource
    DataSet = ADOQueryPolzovat
    Left = 416
    Top = 88
  end
  object ADOQueryPolzovat: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Polzovatel')
    Left = 416
    Top = 32
  end
  object ADOStoredProcPolzovat: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodDiscipl;1'
    Parameters = <>
    Left = 416
    Top = 160
  end
  object ADOStoredProcDocum: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodDoc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NazvDoc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@KodDiscipl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@KodUsar'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Data'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@SamoOcen'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DocFile'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 1073741823
        Value = Null
      end
      item
        Name = '@KodDocum'
        Size = -1
        Value = Null
      end>
    Left = 560
    Top = 160
  end
  object ADOQueryDocum: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select KodDoc, NazvDiscipl, FIO, NazvDoc, Data, SamoOcen, DocFil' +
        'e from Doc, Discipl, Polzovatel where Doc.KodDoc=KodDoc and Disc' +
        'ipl.NazvDiscipl=NazvDiscipl and Polzovatel.FIO=FIO and Doc.NazvD' +
        'oc=NazvDoc ')
    Left = 554
    Top = 32
  end
  object DataSourceDocum: TDataSource
    DataSet = ADOQueryDocum
    Left = 560
    Top = 96
  end
  object DataSourceDiscipl: TDataSource
    DataSet = ADOQueryDiscipl
    Left = 680
    Top = 96
  end
  object ADOStoredProcDiscipl: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodDiscipl;1'
    Parameters = <>
    Left = 680
    Top = 168
  end
  object ADOQueryDiscipl: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Discipl'
      '')
    Left = 680
    Top = 32
  end
  object ADOQueryOtcStud1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select FIO, Ocenki.Data, Ocenka , Komment '
      'from Polzovatel, Ocenki'
      'where Polzovatel.KodUsar=Ocenki.KodUsar and Ocenki.KodDoc=KodDoc')
    Left = 416
    Top = 232
  end
  object ADOQueryOtcStud2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select NazvDiscipl, NazvDoc, SamoOcen, FIO, Ocenka, Komment '
      'from Discipl, Doc, Ocenki, Polzovatel'
      
        'where Discipl.KodDiscipl=Doc.KodDiscipl and Polzovatel.KodUsar=D' +
        'oc.KodUsar and Ocenki.KodOcen=Doc.KodDiscipl')
    Left = 136
    Top = 504
  end
  object ADOQueryOtcStud1a: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select avg(Ocenka) from Ocenki where Ocenki.KodDoc=KodDoc')
    Left = 559
    Top = 232
  end
  object ADOQueryStud2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select avg(Ocenka) from Ocenki where Ocenki.KodUsar=KodUsar')
    Left = 266
    Top = 504
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 144
    Top = 232
  end
  object ADOStoredProcDoc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'vdoc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@KodDiscipl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@KodUsar'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NazvDoc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@Data'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@SamOcen'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Rash'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@kodDoc'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 280
    Top = 232
  end
  object DataSourceStud1: TDataSource
    DataSet = ADOQueryOtcStud1
    Left = 402
    Top = 504
  end
  object DataSourceStud2: TDataSource
    DataSet = ADOQueryOtcStud2
    Left = 530
    Top = 504
  end
  object DataSourceVo: TDataSource
    Left = 280
    Top = 320
  end
  object ADOQueryVo: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'insert into Ocenki(KodDoc,KodUsar,Ocenka,Data,Komment) values (@' +
        'KodDoc,@KodUsar,@Ocenka,@Data,@Komment)')
    Left = 152
    Top = 320
  end
end
