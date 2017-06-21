unit unEstadoModel;
interface
uses unCidadeModel;
type TEstadoModel = class
  private
    FIdEstado: Integer;
    FSigla: String;
    FNome: String;
    FCidades: TListaCidade;
    procedure SetIdEstado(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSigla(const Value: String);
    procedure SetCidades(const Value: TListaCidade);
  published
    property IdEstado : Integer read FIdEstado write SetIdEstado;
    property Nome : String read FNome write SetNome;
    property Sigla : String read FSigla write SetSigla;
    property Cidades : TListaCidade read FCidades write SetCidades;
end;
{  criei um tipo de array, pois não é possível transformar um array em JsonObject pela
  funcao TObjectToJson.
    Poderia ter usado o TObjectList<T>, mas retorna muita sujeira no Json }
type TArrayEstadoModel = array of TEstadoModel;
type TListaEstadoModel = class
private
  mEstados : TArrayEstadoModel;
public
  procedure Add(VEstadoModel : TEstadoModel);
  function GetLength : Integer;
published
  property Estados : TArrayEstadoModel read mEstados write mEstados;
end;
implementation

{ TEstadoModel }

procedure TEstadoModel.SetCidades(const Value: TListaCidade);
begin
  FCidades := Value;
end;

procedure TEstadoModel.SetIdEstado(const Value: Integer);
begin
  FIdEstado := Value;
end;

procedure TEstadoModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TEstadoModel.SetSigla(const Value: String);
begin
  FSigla := Value;
end;
{ TListaEstadoModel }
procedure TListaEstadoModel.Add(VEstadoModel: TEstadoModel);
begin
  SetLength(mEstados,GetLength + 1);//seta o tamanho da array pegando seu tamanho atual e incrementando 1
  mEstados[High(mEstados)] := VEstadoModel;//adiciona um TEstadoModel na ultima posição da array
end;
function TListaEstadoModel.GetLength: Integer;
begin
  Result := Length(mEstados);//retorna o tamanha da array
end;
end.
