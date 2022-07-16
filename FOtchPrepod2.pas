unit FOtchPrepod2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls, StdCtrls, jpeg, Buttons;

type
  TFSNOtchPrepod2 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNOtchPrepod2: TFSNOtchPrepod2;

implementation

uses FDM, FMenu, FOtchPrepod1, FOtchPrepod3, FPolzovat, FPrepod, FStudent;

{$R *.dfm}

procedure TFSNOtchPrepod2.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы  ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNOtchPrepod2.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  FSNOtchPrepod2.Close;
end;
end;

procedure TFSNOtchPrepod2.DateTimePicker1Change(Sender: TObject);
begin
//FSNDM.ADOQueryOcenka.SQL.Text:= 'exec  ... ' + QuotedStr(DateToStr(DateTimePicker1.date));
FSNDM.ADOQueryOcenka.Open;

  DBGrid1.Columns.Items[0].Title.Caption :='КодОцен';
   DBGrid1.Columns.Items[1].Title.Caption :='КодДок';
    DBGrid1.Columns.Items[2].Title.Caption :='Оценка';
     DBGrid1.Columns.Items[3].Title.Caption :='Дата';
      DBGrid1.Columns.Items[4].Title.Caption :='Комментарии';
       DBGrid1.Columns.Items[5].Title.Caption :='КодПользователя';
end;

procedure TFSNOtchPrepod2.FormActivate(Sender: TObject);
begin
  FSNDM.ADOQueryOcenka.Open;
  DateTimePicker1.Date:=date();
  DateTimePicker1Change(self);
end;

end.
