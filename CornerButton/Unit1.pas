unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TCornerButton;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    i : Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btn1Click(Sender: TObject);
begin
  tmr1.Enabled := True;
  i := 1;
  btn1.XRadius := 0;
  btn1.YRadius := 0;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
   i:= i + 1;
   if i = 100 then
      tmr1.Enabled := false;

   TThread.CreateAnonymousThread(
   procedure
   begin
     if i <= 50 then
     begin
      btn1.XRadius := btn1.XRadius + 1;
      btn1.yRadius := btn1.yRadius + 1;
     end
     else
     begin
      btn1.XRadius := btn1.XRadius - 1;
      btn1.yRadius := btn1.yRadius - 1;
     end;
   end).Start;
end;

end.
