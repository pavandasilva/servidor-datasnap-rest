unit unRestDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TRestDM = class(TDataModule)
    Con: TFDConnection;
    qryEstado: TFDQuery;
    qryEstadoid: TFDAutoIncField;
    qryEstadonome: TStringField;
    qryEstadosigla: TStringField;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryCidadesEstados: TFDQuery;
    dsEstados: TDataSource;
    qryCidades: TFDQuery;
    qryCidadesid: TFDAutoIncField;
    qryCidadesnome: TStringField;
    qryCidadescodigo_ibge: TIntegerField;
    qryCidadesestado_id: TIntegerField;
    qryCidadespopulacao_2010: TIntegerField;
    qryCidadesdensidade_demo: TSingleField;
    qryCidadesgentilico: TStringField;
    qryCidadesarea: TSingleField;
    qryCidadesEstadosid: TFDAutoIncField;
    qryCidadesEstadosnome: TStringField;
    qryCidadesEstadoscodigo_ibge: TIntegerField;
    qryCidadesEstadosestado_id: TIntegerField;
    qryCidadesEstadospopulacao_2010: TIntegerField;
    qryCidadesEstadosdensidade_demo: TSingleField;
    qryCidadesEstadosgentilico: TStringField;
    qryCidadesEstadosarea: TSingleField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestDM: TRestDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
