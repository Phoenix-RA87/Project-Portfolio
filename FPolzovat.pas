unit FPolzovat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,ShellAPI, StdCtrls, Buttons, DBCtrls, ExtCtrls, ComCtrls,
  jpeg, Grids, DBGrids;

type
  TFSNPolzovat = class(TForm)
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    LabeledEdit1: TLabeledEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure VDOc(Sender: TObject);
    procedure VOcen(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNPolzovat: TFSNPolzovat;
  put,dir,sto,ExtD, NameOfFile,PathD:string;
  IniF:TINIFILE;
  OE1,OList :Variant;
  Ini_Name: String;
  istr:string;


implementation

uses FDM, FMenu, FOtchPrepod1, FOtchPrepod2, FOtchPrepod3, FPrepod, FStudent;

{$R *.dfm}

procedure TFSNPolzovat.VOcen(Sender: TObject);
begin
  if FSNDM.ADOQueryDocum.FieldByName('KodDoc').AsString='' then
  FSNDM.ADOQueryOcenka.SQL.Text:='Exec OtcSvedOtdDoc 0'
else
  FSNDM.ADOQueryOcenka.SQL.Text:='Exec OtcSvedOtdDoc '+
  FSNDM.ADOQueryDocum.FieldByName('KodDoc').AsString;
  FSNDM.ADOQueryOcenka.Open;
end;

 procedure TFSNPolzovat.VDOc(Sender: TObject);
  begin
  FSNDM.ADOQueryDocum.SQL.Text:='select KodDoc, NazvDiscipl, FIO, NazvDoc, Data, SamoOcen, DocFile from Doc, Discipl,  Polzovatel where'+
 'Polzovatel.KodUsar=Doc.KodUsar and Discipl.KodDiscipl=Doc.KodDiscipl';
  if CheckBox1.Checked then
  FSNDM.ADOQueryDocum.SQL.Add (' and Doc.KodDiscipl='+FSNDM.ADOQueryDiscipl.FieldByName('KodDiscipl').AsString);
  if CheckBox2.Checked then
  FSNDM.ADOQueryDocum.SQL.Add(' and Doc.KodUsar='+FSNDM.ADOQueryPolzovat.FieldByName('KodUsar').AsString);
  FSNDM.ADOQueryDocum.Open;

  DBGrid2.Columns.Items[0].Title.Caption :='Код документа';
  DBGrid2.Columns.Items[1].Title.Caption :='Название дисциплины';
  DBGrid2.Columns.Items[2].Title.Caption :='Фио пользователя';
  DBGrid2.Columns.Items[3].Title.Caption :='Название документа';
  DBGrid2.Columns.Items[4].Title.Caption :='Дата';
  DBGrid2.Columns.Items[5].Title.Caption :='СамоОценка';
  DBGrid2.Columns.Items[6].Title.Caption :='Расширение';

  Vocen(self);
end;


procedure TFSNPolzovat.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы  ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNPolzovat.BitBtn2Click(Sender: TObject);
begin
  FSNDM.ADOStoredProcOcenka.Parameters.ParamByName('@KodDoc').Value:=
  FSNDM.ADOQueryDocum.FieldByName('KodDoc').AsString;
  FSNDM.ADOStoredProcOcenka.Parameters.ParamByName('@Data').Value:=
  DateToStr(DateTimePicker1.Date);
  FSNDM.ADOStoredProcOcenka.Parameters.ParamByName('@Ocenka').Value:=(RadioGroup1.ItemIndex+2);
  FSNDM.ADOStoredProcOcenka.Parameters.ParamByName('@Komment').Value:=
  (LabeledEdit1.Text);
  FSNDM.ADOStoredProcOcenka.Parameters.ParamByName('@KodUsar').Value:=
  FSNDM.ADOQueryPolzovat.FieldByName('KodUsar').AsString;
  FSNDM.ADOStoredProcOcenka.ExecProc;

  MessageDlg('Новыая оценка успешно добавлена.', mtInformation,[mbOK],0); // Диалоговое окно.

  DBGrid2.Columns.Items[0].Title.Caption :='Код документа';
  DBGrid2.Columns.Items[1].Title.Caption :='Дата';
  DBGrid2.Columns.Items[2].Title.Caption :='СамоОценка';
  DBGrid2.Columns.Items[3].Title.Caption :='Комментарии';
  DBGrid2.Columns.Items[4].Title.Caption :='Код пользователя';

  FSNDM.ADOQueryOcenka.Close;
  FSNDM.ADOQueryOcenka.Open;
end;

procedure TFSNPolzovat.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  FSNPolzovat.Close;
end;
end;

procedure TFSNPolzovat.DBGrid1CellClick(Column: TColumn);
begin
  Vocen(self);
end;

procedure TFSNPolzovat.DBGrid2CellClick(Column: TColumn);
begin
  Vocen(self);
end;

procedure TFSNPolzovat.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  Vocen(self);
end;

procedure TFSNPolzovat.DBLookupComboBox1Click(Sender: TObject);
begin
  VDOc(Self);
end;

procedure TFSNPolzovat.DBLookupComboBox2Click(Sender: TObject);
begin
  FSNDM.ADOQueryPolzovat.SQL.Text:='select * from Polzovatel where KodGrupp='
  +FSNDM.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
  FSNDM.ADOQueryPolzovat.Open;
  VDOc(Self);
end;

procedure TFSNPolzovat.DBLookupComboBox3Click(Sender: TObject);
begin
 VDOc(Self);
end;

procedure TFSNPolzovat.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;
Ini_Name:=ChangeFileExt(Application.ExeName,'.ini');
IniF:=TINIFILE.Create(Ini_name);
PathD:=IniF.ReadString('Document', 'Put', 'C:');
FSNDM.ADOQueryDocum.Open;
FSNDM.ADOQueryDiscipl.Close;
FSNDM.ADOQueryGruppa.SQL.Text:='select * from Gruppa where KodGrupp>1';
FSNDM.ADOQueryGruppa.Open;
FSNDM.ADOQueryDiscipl.Open;
FSNDM.ADOQueryDocum.Open;
VDOc(Self);
end;

end.
