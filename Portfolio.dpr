program Portfolio;

uses
  Forms,
  FMenu in 'FMenu.pas' {FSNMenu},
  FStudent in 'FStudent.pas' {FSNStudent},
  FPrepod in 'FPrepod.pas' {FSNPrepod},
  FPolzovat in 'FPolzovat.pas' {FSNPolzovat},
  FOtchPrepod1 in 'FOtchPrepod1.pas' {FSNOtchPrepod1},
  FOtchPrepod2 in 'FOtchPrepod2.pas' {FSNOtchPrepod2},
  FOtchPrepod3 in 'FOtchPrepod3.pas' {FSNFSNOtchPrepod3},
  FDM in 'FDM.pas' {FSNDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSNMenu, FSNMenu);
  Application.CreateForm(TFSNStudent, FSNStudent);
  Application.CreateForm(TFSNPrepod, FSNPrepod);
  Application.CreateForm(TFSNPolzovat, FSNPolzovat);
  Application.CreateForm(TFSNOtchPrepod1, FSNOtchPrepod1);
  Application.CreateForm(TFSNOtchPrepod2, FSNOtchPrepod2);
  Application.CreateForm(TFSNFSNOtchPrepod3, FSNFSNOtchPrepod3);
  Application.CreateForm(TFSNDM, FSNDM);
  Application.Run;
end.
