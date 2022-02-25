unit uReage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxNavigator, cxDBNavigator,
  ExtCtrls, cxCalendar, ADODB, cxDropDownEdit, StdCtrls, Buttons,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, cxButtons, cxContainer,
  cxTextEdit, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass, ppReport,
  dxGDIPlusClasses, ppPrnabl, ppCtrls, ppBands, ppCache, ppParameter, ppVar,
  cxMaskEdit, cxGroupBox;

type
  TForm1 = class(TForm)
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    Panel1: TPanel;
    dbNavi: TcxDBNavigator;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    edBus: TcxTextEdit;
    btnBus: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ppDBPipeline1: TppDBPipeline;
    rel1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    d1: TcxDateEdit;
    d2: TcxDateEdit;
    btnDate: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxButton3: TcxButton;
    cbTipoBusca: TcxComboBox;
    cxGroupBox5: TcxGroupBox;
    cbBusRe: TcxComboBox;
    date1: TcxDateEdit;
    date2: TcxDateEdit;
    cxButton4: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure cxButton2Click(Sender: TObject);
    procedure btnBusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edBusKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses uConRe;

{$R *.dfm}


procedure TForm1.cxButton2Click(Sender: TObject);
begin
    close;
end;
//Busca por registro do lote
procedure TForm1.btnBusClick(Sender: TObject);
begin
    dmrec.adoBusca.Close;
    dmrec.adoBusca.Parameters[1].Value := '2';
    dmrec.adoBusca.Parameters[2].Value := '%'+edbus.text+'%';
    dmrec.adoBusca.Open;
    edbus.Clear;
  IF edbus.Text = '' then
begin
  edbus.SetFocus;
end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
    dmrec.adoBusca.Open;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
    rel1.Print;
end;
//Busca por data
procedure TForm1.btnDateClick(Sender: TObject);
begin
    dmrec.adoBusca.Close;
    dmrec.adoBusca.Parameters[1].Value := '3';
    dmrec.adoBusca.Parameters[4].Value := d1.Date;
    dmrec.adoBusca.Parameters[5].Value := d2.Date;
    dmrec.adoBusca.Open;

    d1.Clear;
    d2.Clear;
end;

procedure TForm1.edBusKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  btnbus.Click;
end;
//Seleciona tipo de busca por data, lote ou tipo de reagente
procedure TForm1.cxButton3Click(Sender: TObject);
begin
       if cbtipobusca.ItemIndex = 0 then
  begin
    cxgroupbox1.Visible := false;
    cxgroupbox2.Visible := true;
    cxgroupbox5.Visible := false
  end else
     if  cbtipobusca.ItemIndex = 1 then
  begin
    cxgroupbox1.Visible := true;
    cxgroupbox2.Visible := false;
    cxgroupbox5.Visible := false
  end else
     if  cbtipobusca.ItemIndex = 2 then
  begin
    cxgroupbox1.Visible := false;
    cxgroupbox2.Visible := false;
    cxgroupbox5.Visible := true
  end else
     if  cbtipobusca.ItemIndex = 3 then
  begin
    dmrec.adoBusca.Close;
    dmrec.adoBusca.Parameters[1].Value := '1';
    dmrec.adoBusca.Open;
end;
end;
//Busca por data e tipo de reagente
procedure TForm1.cxButton4Click(Sender: TObject);
begin
    dmrec.adoBusca.Close;
    dmrec.adoBusca.Parameters[1].Value := '4';
    dmrec.adoBusca.Parameters[3].Value := cbbusre.Text;
    dmrec.adoBusca.Parameters[4].Value := date1.Date;
    dmrec.adoBusca.Parameters[5].Value := date2.Date;
    dmrec.adoBusca.Open;

    date1.Clear;
    date2.Clear;
    cbbusre.Clear;
end;

end.
