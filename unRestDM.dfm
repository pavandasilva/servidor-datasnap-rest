object RestDM: TRestDM
  OldCreateOrder = False
  Height = 188
  Width = 281
  object Con: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'DriverID=MySQL'
      'Database=rest_cidades_estados')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object qryEstado: TFDQuery
    Connection = Con
    SQL.Strings = (
      'select * from estados ')
    Left = 56
    Top = 8
    object qryEstadoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryEstadonome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
    object qryEstadosigla: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sigla'
      Origin = 'sigla'
      Size = 2
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\roger\Documents\desenvolvimento\delphi\mobile\appOrdemS' +
      'ervicoRestServer\libmySQL.dll'
    Left = 192
    Top = 8
  end
  object qryCidadesEstados: TFDQuery
    IndexFieldNames = 'estado_id'
    MasterSource = dsEstados
    MasterFields = 'id'
    Connection = Con
    SQL.Strings = (
      'select * from cidades where estado_id = :id')
    Left = 56
    Top = 56
    ParamData = <
      item
        Name = 'ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 1
      end>
    object qryCidadesEstadosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryCidadesEstadosnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
    object qryCidadesEstadoscodigo_ibge: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_ibge'
      Origin = 'codigo_ibge'
    end
    object qryCidadesEstadosestado_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estado_id'
      Origin = 'estado_id'
    end
    object qryCidadesEstadospopulacao_2010: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'populacao_2010'
      Origin = 'populacao_2010'
    end
    object qryCidadesEstadosdensidade_demo: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'densidade_demo'
      Origin = 'densidade_demo'
    end
    object qryCidadesEstadosgentilico: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gentilico'
      Origin = 'gentilico'
      Size = 255
    end
    object qryCidadesEstadosarea: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'area'
      Origin = 'area'
    end
  end
  object dsEstados: TDataSource
    DataSet = qryEstado
    Left = 107
    Top = 8
  end
  object qryCidades: TFDQuery
    Connection = Con
    SQL.Strings = (
      'select * from cidades where nome = :nome')
    Left = 56
    Top = 112
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryCidadesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryCidadesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
    object qryCidadescodigo_ibge: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_ibge'
      Origin = 'codigo_ibge'
    end
    object qryCidadesestado_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estado_id'
      Origin = 'estado_id'
    end
    object qryCidadespopulacao_2010: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'populacao_2010'
      Origin = 'populacao_2010'
    end
    object qryCidadesdensidade_demo: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'densidade_demo'
      Origin = 'densidade_demo'
    end
    object qryCidadesgentilico: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'gentilico'
      Origin = 'gentilico'
      Size = 255
    end
    object qryCidadesarea: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'area'
      Origin = 'area'
    end
  end
end
