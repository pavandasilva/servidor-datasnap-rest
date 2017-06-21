unit SrvM;
interface
uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  REST.Json, System.JSON, unRestDM, unEstadoModel, System.Generics.Collections,
  unCidadeModel;
type
{$METHODINFO ON}
  TSrvM = class(TComponent)
  private
    { Private declarations }
  public
    function Estados(VSigla_id : String) : TJsonValue;
    function Cidades(VFiltro : String) : TJsonValue;
  end;
{$METHODINFO OFF}
implementation
uses System.StrUtils;
function TSrvM.Cidades(VFiltro: String): TJsonValue;
var
  mCidade : TCidadeModel;
  mListaCidade : TListaCidade;
begin
  {  traz as cidades filtradas pelo nome da cidade passada pelo VFiltro }
  mListaCidade := TListaCidade.Create;
  with RestDM do
  begin
    try
      qryCidades.Close;
      qryCidades.Params.ParamByName('nome').AsString := VFiltro;
      qryCidades.Open;
      qryCidades.First;
      while not qryCidades.Eof do
      begin
        mListaCidade.Add(TCidadeModel.Create(qryCidadesid.AsInteger, qryCidadesNome.AsString,
        qryCidadescodigo_ibge.AsInteger, qryCidadesdensidade_demo.AsFloat,qryCidadesgentilico.AsString ,
        qryCidadesarea.AsFloat, qryCidadespopulacao_2010.AsInteger, qryCidadesestado_id.AsInteger));
        qryCidades.Next;
      end;
      Result := TJson.ObjectToJsonObject(mListaCidade);
    finally
      mListaCidade.Free;
      Con.Close;
    end;
  end;
end;
function TSrvM.Estados(VSigla_id : String): TJsonValue;
var
  mEstado : TEstadoModel;
  mListaEstado : TListaEstadoModel;
  mListaCidade : TListaCidade;
begin
 {  Retorna Estados com suas respectivas cidades
 Fluxo 1 : se VSigla_id vier vazio, retorna todos os estados com suas respectivas cidades
 FLuxo 2 : se Vsigla_id não vier vazio, busca o estado que tenha o id = VSigla_id ou
 a sigla do estado = VSigla_id   }
  mListaEstado := TListaEstadoModel.create;
  try
    with RestDM do
    begin
      qryEstado.Close;
      if VSigla_id <> '' then
      begin
        qryEstado.SQL.Clear;
        qryEstado.SQL.Append('select * from estados where sigla = :sigla_id or id = :sigla_id');
        qryEstado.ParamByName('sigla_id').AsString := VSigla_id;
      end;
      qryEstado.Open;
      qryCidadesEstados.Close;
      qryCidadesEstados.Open;
      qryEstado.First;
      //pega os estados
      while not qryEstado.Eof do
      begin
        mEstado := TEstadoModel.Create;
        mEstado.IdEstado := qryEstadoid.AsInteger;
        mEstado.Nome :=   qryEstadonome.AsString;
        mEstado.Sigla := qryEstadosigla.AsString;
        qryCidadesEstados.First;
        mListaCidade := TListaCidade.Create;
        //cria uma Lista com as cidades do estado atual
        //obs : qryEstado e qryEstadoCidade estão conectados por MasterDetail
        while not qryCidadesEstados.Eof do
        begin
          mListaCidade.Add(TCidadeModel.Create(qryCidadesEstadosid.AsInteger, qryCidadesEstadosNome.AsString,
            qryCidadesEstadoscodigo_ibge.AsInteger, qryCidadesEstadosdensidade_demo.AsFloat,qryCidadesEstadosgentilico.AsString ,
            qryCidadesEstadosarea.AsFloat, qryCidadesEstadospopulacao_2010.AsInteger, qryCidadesEstadosestado_id.AsInteger));
          qryCidadesEstados.Next;
        end;
        mEstado.Cidades := mListaCidade;
        mListaEstado.Add(mEstado);
        qryEstado.Next;
      end;
      Result := TJson.ObjectToJsonObject(mListaEstado);
    end;
  finally
    RestDM.Con.Close;
    mListaEstado.Free;
  end;
end;
end.

