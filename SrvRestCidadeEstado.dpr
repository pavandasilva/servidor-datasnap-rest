program SrvRestCidadeEstado;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  SrvM in 'SrvM.pas',
  SrvC in 'SrvC.pas' {ServerContainer1: TDataModule},
  WebM in 'WebM.pas' {WebModule1: TWebModule},
  unRestDM in 'unRestDM.pas' {RestDM: TDataModule},
  unCidadeModel in 'unCidadeModel.pas',
  unEstadoModel in 'unEstadoModel.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TRestDM, RestDM);
  Application.Run;
end.
