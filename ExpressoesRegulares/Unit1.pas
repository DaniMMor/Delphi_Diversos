unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.RegularExpressions;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure invalido;
    procedure valido;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btn1Click(Sender: TObject);
begin
  if TRegEx.IsMatch(Edit1.Text,Memo1.Lines.Text) then
    valido
  else
    invalido;

end;

procedure TForm1.invalido;
begin
  lbl1.Caption := 'invalido';
  lbl1.Font.Color := clRed;
end;

procedure TForm1.valido;
begin
  lbl1.Caption := 'valido';
  lbl1.Font.Color := clGreen;
end;

end.
