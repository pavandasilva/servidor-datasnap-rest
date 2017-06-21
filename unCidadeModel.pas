unit unCidadeModel;
interface
type
  TCidadeModel  = class
  private
    FCidadeID: Integer;
    FNome: String;
    FCodigo_ibge: Integer;
    FDensidade: Real;
    FGentilico: String;
    FArea: Real;
    FPopulacao: Integer;
    FEstadoID: Integer;
    procedure SetArea(const Value: Real);
    procedure SetCodigo_ibge(const Value: Integer);
    procedure SetDensidade(const Value: Real);
    procedure SetGentilico(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetPopulacao(const Value: Integer);
    procedure SetCidadeID(const Value: Integer);
    procedure SetEstadoID(const Value: Integer);
  public
    constructor Create(cCidadeId : Integer; cNome: String; cCodigo_ibge : Integer; cDensidade : Real; cGentilico : String; cArea : Real; cPopulacao : Integer; cEstadoId : Integer);
  published
    property CidadeID : Integer read FCidadeID write SetCidadeID;
    property Nome : String read FNome write SetNome;
    property Codigo_ibge : Integer read FCodigo_ibge write SetCodigo_ibge;
    property Populacao : Integer read FPopulacao write SetPopulacao;
    property Densidade : Real read FDensidade write SetDensidade;
    property Gentilico : String read FGentilico write SetGentilico;
    property Area : Real read FArea write SetArea;
    property EstadoID : Integer read FEstadoID write SetEstadoID;
  end;
  {  criei um tipo de array, pois não é possível transformar um array em JsonObject pela
  funcao TObjectToJson.
    Poderia ter usado o TObjectList<T>, mas retorna muita sujeira no Json }
type TArrayCidade = array of TCidadeModel;
type TListaCidade = class
  private
    mCidades : TArrayCidade;
    function GetLength : Integer;
  public
    procedure Add(VCidade: TCidadeModel);
  published
    property Cidades : TArrayCidade read mCidades write mCidades;
end;
implementation
{ TCidadeModel }
constructor TCidadeModel.Create(cCidadeId : Integer; cNome: String; cCodigo_ibge : Integer; cDensidade : Real; cGentilico : String ;cArea : Real; cPopulacao : Integer; cEstadoID : Integer);
begin
  FCidadeID := cCidadeId;
  FCodigo_ibge := cCodigo_ibge;
  FDensidade := cDensidade;
  FArea := cArea;
  FPopulacao := cPopulacao;
  FGentilico := cGentilico;
  FNome := cNome;
  FEstadoID := cEstadoId;
end;
procedure TCidadeModel.SetArea(const Value: Real);
begin
  FArea := Value;
end;
procedure TCidadeModel.SetCidadeID(const Value: Integer);
begin
  FCidadeID := Value;
end;
procedure TCidadeModel.SetCodigo_ibge(const Value: Integer);
begin
  FCodigo_ibge := Value;
end;
procedure TCidadeModel.SetDensidade(const Value: Real);
begin
  FDensidade := Value;
end;
procedure TCidadeModel.SetEstadoID(const Value: Integer);
begin
  FEstadoID := Value;
end;
procedure TCidadeModel.SetGentilico(const Value: String);
begin
  FGentilico := Value;
end;
procedure TCidadeModel.SetNome(const Value: String);
begin
  FNome := Value;
end;
procedure TCidadeModel.SetPopulacao(const Value: Integer);
begin
  FPopulacao := Value;
end;
{ TListaCidade }
procedure TListaCidade.Add(VCidade : TCidadeModel);
begin
  SetLength(mCidades,GetLength + 1);//muda o tamanho da array  pegando o tamanho atual dela e incrementando 1.
  mCidades[High(mCidades)] := VCidade;// adiciona um TCidades na ultima posição da array
end;

function TListaCidade.GetLength: Integer;
begin
  Result := Length(mCidades); //retorna o tamanha da array
end;

end.
