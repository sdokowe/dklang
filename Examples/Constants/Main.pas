//**********************************************************************************************************************
//  $Id: Main.pas,v 1.2 2005-06-19 12:32:04 dale Exp $
//----------------------------------------------------------------------------------------------------------------------
//  DKLang Localization Package
//  Copyright 2002-2004 DK Software, http://www.dk-soft.org
//**********************************************************************************************************************
// This is a more advanced example on DKLang Package usage.
// When you click the 'Test' button, a message box is displayed, with the text
// taken from a constant. You can edit the project constants ONLY by using
// Project | Edit project constants... menu item. Don't edit the .dklang file
// directly as its contents is generated and updated automatically!
//
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DKLang;

type
  TfMain = class(TForm)
    bTest: TButton;
    lcMain: TDKLanguageController;
    lSampleMessage: TLabel;
    cbLanguage: TComboBox;
    procedure cbLanguageChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation
{$R *.dfm}

  procedure TfMain.bTestClick(Sender: TObject);
  begin
    Application.MessageBox(
      PChar(LangManager.ConstantValue['STestMessage']),
      PChar(LangManager.ConstantValue['SMessageCaption']),
      MB_ICONINFORMATION or MB_OK);
  end;

  procedure TfMain.cbLanguageChange(Sender: TObject);
  var iIndex: Integer;
  begin
    iIndex := cbLanguage.ItemIndex;
    if iIndex<0 then iIndex := 0; // When there's no valid selection in cbLanguage we use the default language (Index=0)
    LangManager.LanguageID := LangManager.LanguageIDs[iIndex];
  end;

  procedure TfMain.FormCreate(Sender: TObject);
  var i: Integer;
  begin
     // Scan for language files in the app directory and register them in the LangManager object
    LangManager.ScanForLangFiles(ExtractFileDir(ParamStr(0)), '*.lng', False);
     // Fill cbLanguage with available languages
    for i := 0 to LangManager.LanguageCount-1 do cbLanguage.Items.Add(LangManager.LanguageNames[i]);
     // Index=0 always means the default language
    cbLanguage.ItemIndex := 0; 
  end;

end.
