program FrmReage;

uses
  Forms,
  uReage in 'uReage.pas' {Form1},
  uConRe in 'uConRe.pas' {dmReC: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmReC, dmReC);
  Application.Run;
end.
