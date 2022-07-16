unit FPrepod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ComCtrls;

type
  TFSNPrepod = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNPrepod: TFSNPrepod;

implementation

uses FDM, FMenu, FOtchPrepod1, FOtchPrepod2, FOtchPrepod3, FPolzovat, FStudent;

{$R *.dfm}

procedure TFSNPrepod.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNPrepod.BitBtn3Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNPrepod.Close;
end;
end;

procedure TFSNPrepod.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;

  DBGrid1.Columns.Items[0].Title.Caption :='КодПользователя';
  DBGrid1.Columns.Items[1].Title.Caption :='ФИО';
  DBGrid1.Columns.Items[2].Title.Caption :='Должность';
  DBGrid1.Columns.Items[3].Title.Caption :='Пароль';
  DBGrid1.Columns.Items[4].Title.Caption :='КодГруппы';

  DBGrid2.Columns.Items[0].Title.Caption :='ФИО';
  DBGrid2.Columns.Items[1].Title.Caption :='Дата';
  DBGrid2.Columns.Items[2].Title.Caption :='Оценка';
  DBGrid2.Columns.Items[3].Title.Caption :='Комментарий';
end;

end.
