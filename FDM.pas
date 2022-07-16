unit FDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFSNDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryGruppa: TADOQuery;
    ADOStoredProcGruppa: TADOStoredProc;
    DataSourceGruppa: TDataSource;
    ADOQueryOcenka: TADOQuery;
    DataSourceOcenka: TDataSource;
    ADOStoredProcOcenka: TADOStoredProc;
    DataSourcePolzovat: TDataSource;
    ADOQueryPolzovat: TADOQuery;
    ADOStoredProcPolzovat: TADOStoredProc;
    ADOStoredProcDocum: TADOStoredProc;
    ADOQueryDocum: TADOQuery;
    DataSourceDocum: TDataSource;
    DataSourceDiscipl: TDataSource;
    ADOStoredProcDiscipl: TADOStoredProc;
    ADOQueryDiscipl: TADOQuery;
    ADOQueryOtcStud1: TADOQuery;
    ADOQueryOtcStud2: TADOQuery;
    ADOQueryOtcStud1a: TADOQuery;
    ADOQueryStud2: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOStoredProcDoc1: TADOStoredProc;
    DataSourceStud1: TDataSource;
    DataSourceStud2: TDataSource;
    DataSourceVo: TDataSource;
    ADOQueryVo: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNDM: TFSNDM;

implementation

uses FMenu, FOtchPrepod1, FOtchPrepod2, FOtchPrepod3, FPolzovat, FPrepod,
  FStudent;

{$R *.dfm}

end.
