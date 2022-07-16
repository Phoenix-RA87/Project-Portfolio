unit FOtchPrepod1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, jpeg, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFSNOtchPrepod1 = class(TForm)
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    v: TImage;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNOtchPrepod1: TFSNOtchPrepod1;

implementation

uses FDM, FMenu, FOtchPrepod2, FOtchPrepod3, FPolzovat, FPrepod, FStudent;

{$R *.dfm}

procedure TFSNOtchPrepod1.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNOtchPrepod1.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNOtchPrepod1.Close;
end;
end;

procedure TFSNOtchPrepod1.DateTimePicker1Change(Sender: TObject);
begin
//FSNDM.ADOQueryPolzovat.SQL.Text:= 'exec  ... ' + QuotedStr(DateToStr(DateTimePicker1.date));
FSNDM.ADOQueryPolzovat.Open;

  DBGrid1.Columns.Items[0].Title.Caption :='КодПользователя';
   DBGrid1.Columns.Items[1].Title.Caption :='ФИО';
    DBGrid1.Columns.Items[2].Title.Caption :='Должность';
     DBGrid1.Columns.Items[3].Title.Caption :='Пароль';
      DBGrid1.Columns.Items[4].Title.Caption :='КодГруппы';
end;

procedure TFSNOtchPrepod1.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date:=date();
  DateTimePicker1Change(self);
end;

end.
