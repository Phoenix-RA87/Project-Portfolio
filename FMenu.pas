unit FMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, DBCtrls, Buttons, Menus;

type
  TFSNMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label1: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N10: TMenuItem;
    Jnxtns1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNMenu: TFSNMenu;

implementation

uses FDM, FOtchPrepod1, FOtchPrepod2, FOtchPrepod3, FPolzovat, FPrepod,
  FStudent;

{$R *.dfm}

procedure TFSNMenu.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNMenu.Button1Click(Sender: TObject);
begin
 if FSNDM.ADOQueryGruppa.FieldByName('KodGrupp').Value=14 then
 FSNPolzovat.ShowModal
 else
 FSNMenu.MainMenu1.Items[0].Enabled:=true;
 FSNMenu.MainMenu1.Items[1].Enabled:=true;
end;

procedure TFSNMenu.DBLookupComboBox1Click(Sender: TObject);
begin
  FSNDM.ADOQueryPolzovat.SQL.Text:='select * from Polzovatel where KodGrupp='
  +FSNDM.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
  FSNDM.ADOQueryPolzovat.Open;
end;

procedure TFSNMenu.FormActivate(Sender: TObject);
begin
try
  FSNDM.ADOConnection1.Connected:=True;
except
  OpenDialog1.Execute();
  FSNDM.ADOConnection1.ConnectionString:='FILE NAME='+OpenDialog1.FileName;
  FSNDM.ADOConnection1.Connected:=True;
end;
  FSNDM.ADOQueryGruppa.Open;
end;

procedure TFSNMenu.N10Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNMenu.N2Click(Sender: TObject);
begin
FSNStudent.ShowModal();
end;

procedure TFSNMenu.N3Click(Sender: TObject);
begin
FSNPrepod.ShowModal();
end;

procedure TFSNMenu.N4Click(Sender: TObject);
begin
FSNPolzovat.ShowModal();
end;

procedure TFSNMenu.N7Click(Sender: TObject);
begin
FSNOtchPrepod1.ShowModal();
end;

procedure TFSNMenu.N8Click(Sender: TObject);
begin
FSNOtchPrepod2.ShowModal();
end;

procedure TFSNMenu.N9Click(Sender: TObject);
begin
FSNFSNOtchPrepod3.ShowModal();
end;

end.
