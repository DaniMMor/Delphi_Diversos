unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  Vcl.StdCtrls;

type
  TEmpresa = record
    id : Integer;
    IE: string;
    CNPJ : string;
    Status: string;
  end;

   TSefaz = record
    IE: string;
    CNPJ : string;
  end;



type
  TForm1 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    mmo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    mmo3: TMemo;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    ListaEmp : TDictionary<integer,TEmpresa>;
    ListaSefaz : TDictionary<string,TSefaz>;
    Emp : TEmpresa;
    Sefaz : TSefaz;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  ArqEmp, ArqSefaz: TextFile;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);


begin
   TThread.CreateAnonymousThread(procedure
    var
    linha: string;
    nreg, i: integer;
  begin

      Reset(ArqEmp);
      nreg := 0;
      mmo1.Clear;
      ListaEmp.Clear;

      while (not eof(ArqEmp)) do
      begin
        Readln(ArqEmp, linha);
        nreg := nreg + 1;

        i:= pos(';', linha);
        Emp.IE := copy(linha, 1, i-1);
        delete(linha, 1, i);

        Emp.CNPJ := linha;
        Emp.id := nreg;

        ListaEmp.add(Emp.id,emp);

        if CheckBox1.Checked then
           mmo1.Lines.Add(IntToStr( Emp.id) + ' - ' + Emp.IE + ' - ' + Emp.CNPJ);
      end;

      if not CheckBox1.Checked then
      ShowMessage('carregou todas emp');

  end).Start;


    TThread.CreateAnonymousThread(procedure
    var
    linha1: string;
    nreg1, j: integer;
  begin

      Reset(ArqSefaz);
      nreg1 := 0;
      mmo2.Clear;
      ListaSefaz.Clear;

      while (not eof(ArqSefaz)) do
      begin
        Readln(ArqSefaz, linha1);
        nreg1 := nreg1 + 1;

        j:= pos(';', linha1);
        Sefaz.IE := copy(linha1, 1, j-1);
        delete(linha1, 1, j);

        Sefaz.CNPJ := linha1;

        ListaSefaz.add(Sefaz.ie,Sefaz);

         if CheckBox1.Checked then
            mmo2.Lines.Add(Sefaz.IE + ' - ' + Sefaz.CNPJ);
      end;

      if not CheckBox1.Checked then
      ShowMessage('carregou todos sefaz');

  end).Start;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  TThread.CreateAnonymousThread(procedure
  var i,k : Integer;
  begin
      k:= 1;
      AssignFile(ArqEmp,'c:\\texto\arqEmp.txt');
      Rewrite(ArqEmp);
      for i := 0 to 5000 do
      begin
        Writeln(ArqEmp,'i',k,';','c',k+10);
        inc(k);
        if i = 5000  then ShowMessage('termino arqEmp');
      end;
      Closefile(ArqEmp); //fecha o handle de arquivo
  end).Start;


  TThread.CreateAnonymousThread( procedure
   var j,l: Integer;
  begin
     l := 1;
     AssignFile(ArqSefaz,'c:\\texto\arqSefaz.txt');
     Rewrite(ArqSefaz);
      for j := 0 to 14000 do
      begin
        Writeln(ArqSefaz,'i',l,';','c',l+10 );
        inc(l);
        if j = 14000  then ShowMessage('termino arqSefaz');
      end;
      Closefile(ArqSefaz);
  end).Start;

end;

procedure TForm1.Button2Click(Sender: TObject);

begin
   mmo3.Clear;

    TThread.CreateAnonymousThread( procedure
    var
    i, j : Integer;
    begin
       j := Round( Pred(ListaEmp.Count) / 2) + 1;
       for I := 0 to j do
       begin
           if ListaEmp.TryGetValue(i,Emp) then
              if not ListaSefaz.TryGetValue(Emp.ie,Sefaz) then
              begin
                 mmo3.Lines.Add('a -' +IntToStr(Emp.id) + ' - ' + Emp.IE + ' - ' + Emp.CNPJ);
              end;
       end;

   end).Start;

     TThread.CreateAnonymousThread( procedure
    var
    k, l : Integer;
    begin

       for l :=(Round( (Pred(ListaEmp.Count) / 2)) + 2) to Pred(ListaEmp.Count) do
       begin
           if ListaEmp.TryGetValue(l,Emp) then
              if not ListaSefaz.TryGetValue(Emp.ie,Sefaz) then
              begin
                 mmo3.Lines.Add('b - ' +IntToStr(Emp.id) + ' - ' + Emp.IE + ' - ' + Emp.CNPJ);
              end;
       end;

   end).Start;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    ListaEmp := TDictionary<integer,TEmpresa>.create;
    ListaSefaz := TDictionary<string,TSefaz>.create;
end;

end.
