unit FOtchPrepod3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, jpeg, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFSNFSNOtchPrepod3 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
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
  FSNFSNOtchPrepod3: TFSNFSNOtchPrepod3;

implementation

uses FDM, FMenu, FOtchPrepod1, FOtchPrepod2, FPolzovat, FPrepod, FStudent;

{$R *.dfm}

procedure TFSNFSNOtchPrepod3.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы  ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNFSNOtchPrepod3.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  FSNFSNOtchPrepod3.Close;
end;
end;

procedure TFSNFSNOtchPrepod3.DateTimePicker1Change(Sender: TObject);
begin
//FSNDM.ADOQueryOcenka.SQL.Text:= 'exec  ... ' + QuotedStr(DateToStr(DateTimePicker1.date));
  FSNDM.ADOQueryOcenka.Open;

  DBGrid1.Columns.Items[0].Title.Caption :='Код Оценки';
  DBGrid1.Columns.Items[1].Title.Caption :='Код документа';
  DBGrid1.Columns.Items[2].Title.Caption :='Оценка';
  DBGrid1.Columns.Items[3].Title.Caption :='Дата';
  DBGrid1.Columns.Items[4].Title.Caption :='Комментарии';
  DBGrid1.Columns.Items[5].Title.Caption :='Код Пользователя';
end;

procedure TFSNFSNOtchPrepod3.FormActivate(Sender: TObject);
begin
  FSNDM.ADOQueryOcenka.Open;
  DateTimePicker1.Date:=date();
  DateTimePicker1Change(self);
end;

end.
