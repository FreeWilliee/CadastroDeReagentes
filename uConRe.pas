unit uConRe;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmReC = class(TDataModule)
    ADORe: TADOConnection;
    adoResp: TADOQuery;
    dsResp: TDataSource;
    adoBusca: TADOStoredProc;
    dsBusca: TDataSource;
    adoLog: TADOStoredProc;
    mod_dad: TADOConnection;
    procedure adoBuscaAfterDelete(DataSet: TDataSet);
    procedure adoBuscaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReC: TdmReC;

implementation

uses uReage, cxGridCustomTableView;

{$R *.dfm}
//cria log de exclusão
procedure TdmReC.adoBuscaAfterDelete(DataSet: TDataSet);
begin
       //adoLog.Parameters[2].Value := matricula;
       adoLog.parameters[3].Value := 'REAGENTE';
       adoLog.parameters[1].Value := 'Deletou um registro.';
       adoLog.ExecProc;
end;
//cria log de inserção
procedure TdmReC.adoBuscaAfterPost(DataSet: TDataSet);
begin
     //adoLog.Parameters[2].Value := matricula;
     adoLog.parameters[3].Value := 'REAGENTE';
     adoLog.parameters[1].Value := 'Inseriu o lote '+ adobusca.fieldbyname('lote').AsString + '.';
     adoLog.ExecProc;
end;

end.
