{*******************************************************}
{                                                       }
{       Pascal Script Source File                       }
{       Run by RemObjects Pascal Script in CnWizards    }
{                                                       }
{       Generated by CnPack IDE Wizards                 }
{                                                       }
{*******************************************************}

program ModExpTree;

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

var
  I: Integer;
  AForm: TCustomForm;
  TreeControl: TControl;
  Obj: TObject;
begin
  AForm := nil;
  for I := 0 to Screen.CustomFormCount - 1 do
  begin
    if Screen.CustomForms[I].ClassNameIs('TPasModExpForm')
      or Screen.CustomForms[I].ClassNameIs('TCppModExpForm') then
    begin
      AForm := Screen.CustomForms[I];
      Break;
    end;
  end;

  if AForm = nil then
  begin
    ErrorDlg('Can NOT Found Source Tree Form.');
    Exit;
  end;

  Writeln(AForm.ClassName + ' Found. Name ' + AForm.Name);
  TreeControl := AForm.FindChildControl('Explorer');
  if TreeControl = nil then
  begin
    ErrorDlg('Can NOT Found TreeControl.');
    Exit;
  end;
  Writeln('TreeControl Explorer Found.');

  Obj := GetObjectProp(TreeControl, 'Items');
  if Obj = nil then
  begin
    ErrorDlg('Can NOT Found Items TreeNodes.');
    Exit;
  end;

  Writeln('Get Items ' + Obj.ClassName + Format(' %8.8x', [Integer(Obj)]));

  Obj := GetObjectProp(TreeControl, 'Selected');
  if Obj = nil then
  begin
    ErrorDlg('Can NOT Get Select TreeNode.');
    Exit;
  end;
  Writeln('Get Selected ' + Obj.ClassName + Format(' %8.8x', [Integer(Obj)]));
  Writeln('Selected Text: ' + GetStrProp(Obj, 'Text'));
end.
