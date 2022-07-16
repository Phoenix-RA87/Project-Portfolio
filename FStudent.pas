unit FStudent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, jpeg,
  Grids, DBGrids, Menus;

type
  TFSNStudent = class(TForm)
    DBGrid3: TDBGrid;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBGrid4: TDBGrid;
    DBLookupComboBox3: TDBLookupComboBox;
    RadioGroup2: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNStudent: TFSNStudent;
  KodD: integer;
  put,dir,sto,ExtD, NameOfFile,PathD:string;
  IniF:TINIFILE;
  OE1,OList :Variant;
  istr:string;

implementation

uses FDM, FMenu, FOtchPrepod1, FOtchPrepod2, FOtchPrepod3, FPolzovat, FPrepod;

{$R *.dfm}

procedure TFSNStudent.RadioGroup2Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
Begin
FSNDM.ADOQueryOtcStud1a.SQL.Text:='Exec SV '+ FSNDM.ADOQueryDocum.FieldByName('KodDoc').AsString;
FSNDM.ADOQueryOtcStud1a.Open;
End;

if RadioGroup1.ItemIndex=1 then
Begin
FSNDM.ADOQueryOtcStud1.SQL.Text:='Exec OtchSvedOtdDoc '+ FSNDM.ADOQueryDocum.FieldByName('KodDoc').AsString;
FSNDM.ADOQueryOtcStud1.Open;
end;

if RadioGroup1.ItemIndex=2 then
Begin
FSNDM.ADOQueryOtcStud2.SQL.Text:='Exec SvedRabotStud '+ FSNDM.ADOQueryPolzovat.FieldByName('KodUsar').AsString;
FSNDM.ADOQueryOtcStud2.Open;
end;
end;


procedure TFSNStudent.BitBtn1Click(Sender: TObject);
begin
// Добавление записи в таблицу документ
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@NazvDoc').Value:=(LabeledEdit1.Text);
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@KodUsar').Value:=FSNDM.ADOQueryPolzovat.FieldByName('KodUsar').AsString;
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@KodDiscipl').Value:=FSNDM.ADOQueryDiscipl.FieldByName('KodDiscipl').AsString;
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@Data').Value:=DateToStr(DateTimePicker1.Date);
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@SamoOcen').Value:=(RadioGroup1.ItemIndex+0);
 if OpenDialog1.Execute then
        //определяем расширение документаDoc
ExtD:=ExtractFileExt(OpenDialog1.FileName);
FSNDM.ADOStoredProcDocum.Parameters.ParamByName('@DocFile').Value:=ExtD;
FSNDM.ADOStoredProcDocum.ExecProc;
KodD:=FSNDM.AdoStoredProcDocum.Parameters.ParamByName('@KodDoc').Value;
Edit1.Text:=IntToStr(KodD);
       //Формируем имя файла
NameOfFile:=PathD+'Doc'+IntToStr(KodD)+ExtD;
    //если копирование файла не выполнено
     if not CopyFile(PChar(OpenDialog1.FileName),Pchar(NameOfFile),true) then
        begin
          MessageDlg('Копирование не выполнено',mtError,[mbOk],0);
          FSNDM.ADOQuery1.SQL.Text:='delete from Doc where KodDoc='+IntToStr(KodD);
          FSNDM.ADOQuery1.ExecSQL;
          MessageDlg('Копирование не выполнено',mtError,[mbOk],0);
          end;
//        else
//       ShowMessage('документ добавлен!');
//       FSNDM.AdoStoredProcDoc1.Parameters.ParamByName('@KodDoc').Value:=KodD;
// FSNDM.AdoStoredProcDoc1.Parameters.ParamByName('@DocFail').Value:=NameofFile;
// FSNDM.AdoStoredProcDoc1.ExecProc;

FSNDM.ADOQueryDocum.Close;
FSNDM.ADOQueryDocum.Open;

end;

procedure TFSNStudent.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы  ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNStudent.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  FSNStudent.Close;
end;
end;

procedure TFSNStudent.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;
DateTimePicker2.Date:=now;

FSNDM.ADOQueryDiscipl.Open;
IniF:=TINIFILE.Create(ChangeFileExt(Application.ExeName,'.ini'));
PathD:=IniF.ReadString('Document', 'Put', 'C:');
   FSNDM.ADOQueryDocum.SQL.Text:='select * from Doc where KodUsar='+
   FSNDM.ADOQueryPolzovat.FieldByName('KodUsar').AsString;
   FSNDM.ADOQueryDocum.Open;

//  DBGrid3.Columns.Items[0].Title.Caption :='Код документа';
//  DBGrid3.Columns.Items[1].Title.Caption :='Код дисциплины';
//  DBGrid3.Columns.Items[2].Title.Caption :='Код пользователя';
//  DBGrid3.Columns.Items[3].Title.Caption :='Название документа';
//  DBGrid3.Columns.Items[4].Title.Caption :='Дата';
//  DBGrid3.Columns.Items[5].Title.Caption :='Самооценка';
//  DBGrid3.Columns.Items[6].Title.Caption :='Расширение';
//
//  DBGrid4.Columns.Items[0].Title.Caption :='Название дисциплины';
//  DBGrid4.Columns.Items[1].Title.Caption :='Название документа';
//  DBGrid4.Columns.Items[2].Title.Caption :='Самооценка';
//  DBGrid4.Columns.Items[3].Title.Caption :='ФИО';
//  DBGrid4.Columns.Items[4].Title.Caption :='Оценка';
//  DBGrid4.Columns.Items[5].Title.Caption :='Комментарий';
//
//  DBGrid1.Columns.Items[0].Title.Caption :='ФИО';
//  DBGrid1.Columns.Items[1].Title.Caption :='Дата';
//  DBGrid1.Columns.Items[2].Title.Caption :='Оценка';
//  DBGrid1.Columns.Items[3].Title.Caption :='Комментарий';
end;

end.
