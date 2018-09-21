unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.ComCtrls;

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
    OpenDialog1: TOpenDialog;
    pb1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    ListaEmp : TDictionary<integer,TEmpresa>;
    ListaSefazIE : TDictionary<string,string>;
    ListaSefazCNPJ : TDictionary<string,string>;

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
var
  i,j,K : Integer;
  vCNPJ, vIE : string;
begin
   mmo2.Clear;
   j := 100;
   K:=0;
   pb1.Min := 1;
   pb1.Max := ListaEmp.Count;

   for I := 0 to Pred(ListaEmp.Count) do
   begin
       if ListaEmp.TryGetValue(i, Emp) then
       begin
           if ListaSefazie.TryGetValue(Emp.IE, vCNPJ) then
           begin
             if Emp.CNPJ <> vCNPJ then
             begin
                Application.ProcessMessages;
                mmo2.Lines.Add('IE: '+ Emp.id.ToString + ' - CNPJ: '+ Emp.CNPJ);
             end;
           end
           else
           begin
             mmo2.Lines.Add('IE: '+ Emp.id.ToString + ' - IE: '+ Emp.IE);
           end;


           if ListaSefazCNPJ.TryGetValue(Emp.CNPJ, vIE) then
           begin
             if Emp.IE <> vIE then
             begin
                Application.ProcessMessages;
                mmo2.Lines.Add('CNPJ: '+Emp.id.ToString + ' - IE: '+ Emp.IE);
             end;
           end
           else
           begin
             mmo2.Lines.Add('CNPJ: '+Emp.id.ToString + ' - CNPJ: '+ Emp.CNPJ);
           end;


        end
        else
        K:=K+1;


       if i = j then
       begin
         Application.ProcessMessages;
         pb1.Position := i;
         j := j + 100;
       end;
   end;
   mmo2.Lines.Add('FIM DA PESQUISA');
   mmo2.Lines.Add('NAO ACHOU LISTAEMP: ' + K.ToString);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  linha, vIE : string;
  i, j,k : Integer;
begin
    j := 0;
    k := 0;
    ListaSefazIE.Clear;
    ListaSefazCNPJ.Clear;
    ListaEmp.Clear;
    mmo1.Clear;

    if OpenDialog1.Execute then
       AssignFile(ArqSefaz, OpenDialog1.FileName);
    Reset(ArqSefaz);

    while not Eof(ArqSefaz) do
    begin
      Readln(ArqSefaz, linha);
      if copy(linha,1,1) <> '' then
      begin
        j := j + 1;
        i := Pos(';', linha);
        Sefaz.IE := Copy(linha, 1, i-1);
        Delete(linha, 1, i);

        i := Pos(';', linha);
        Sefaz.CNPJ := Copy(linha, 1, i-1);

        ListaSefazIE.Add(Sefaz.IE, Sefaz.CNPJ);

        try
           ListaSefazCNPJ.Add(Sefaz.CNPJ, Sefaz.IE);
        except
              mmo1.Lines.Add('cnpj duplicado ' + Sefaz.CNPJ  + ' - ' + Sefaz.IE);
           if ListaSefazCNPJ.TryGetValue(Sefaz.CNPJ,vIE) then
              mmo1.Lines.Add('cnpj original  ' + Sefaz.CNPJ  + ' - ' + vIE);
          mmo1.Lines.Add('');
        end;


      end
      else
      k := k + 1;

    end;
    CloseFile(ArqSefaz);
    mmo1.Lines.Add('ArqSefaz possui ' + j.ToString + ' linhas.');
    mmo1.Lines.Add('');
    mmo1.Lines.Add('ArqSefaz possui ' + k.ToString + ' linhas em branco.');
    mmo1.Lines.Add('');
    mmo1.Lines.Add(Sefaz.IE + ' - ' + Sefaz.CNPJ);


    if OpenDialog1.Execute then
       AssignFile(ArqEmp, OpenDialog1.FileName);
    Reset(ArqEmp);

    j:= 0;
    k := 0;
    while not Eof(ArqEmp) do
    begin
      j := j + 1;
      Emp.id := j;

      Readln(ArqEmp, linha);

      if copy(linha,1,1) <> '' then
      begin
        i := Pos(';', linha);
        Emp.IE := Copy(linha, 1, i-1);
        Delete(linha, 1, i);

        i := Pos(';', linha);
        Emp.CNPJ := Copy(linha, 1, i-1);

        ListaEmp.Add(Emp.id, Emp);
      end
      else
      k := k + 1;
    end;
    CloseFile(ArqEmp);
    mmo1.Lines.Add('');
    mmo1.Lines.Add('ArqEmpresas possui ' + j.ToString + ' linhas.');
    mmo1.Lines.Add('');
    mmo1.Lines.Add('ArqEmpresas possui ' + k.ToString + ' linhas em branco.');
    mmo1.Lines.Add('');
    mmo1.Lines.Add(Emp.id.ToString + ' - ' +  Emp.IE + ' - ' + emp.CNPJ);






//  TThread.CreateAnonymousThread(procedure
//  var i,k : Integer;
//  begin
//      k:= 1;
//      AssignFile(ArqEmp,'c:\\texto\arqEmp.txt');
//      Rewrite(ArqEmp);
//      for i := 0 to 1500000 do
//      begin
//        Writeln(ArqEmp,'i',k,';','c',k+10);
//        inc(k);
//        if i = 1500000  then ShowMessage('termino arqEmp');
//      end;
//      Closefile(ArqEmp); //fecha o handle de arquivo
//  end).Start;
//
//
//  TThread.CreateAnonymousThread( procedure
//   var j,l: Integer;
//  begin
//     l := 1;
//     AssignFile(ArqSefaz,'c:\\texto\arqSefaz.txt');
//     Rewrite(ArqSefaz);
//      for j := 0 to 1500000 do
//      begin
//        Writeln(ArqSefaz,'i',l,';','c',l+10 );
//        inc(l);
//        if j = 1500000  then ShowMessage('termino arqSefaz');
//      end;
//      Closefile(ArqSefaz);
//  end).Start;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   i : Integer;

begin
//   mmo3.Clear;
//
//    for I := 0 to Pred(ListaEmp.Count) do
//    begin
//           if ListaEmp.TryGetValue(i,Emp) then
//              if not ListaSefaz.TryGetValue(Emp.ie,Sefaz) then
//              begin
//                 mmo3.Lines.Add('a -' +Emp.id.ToString + ' - ' + Emp.IE + ' - ' + Emp.CNPJ);
//              end;
//    end;
//
//    ShowMessage(i.ToString);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    ListaEmp := TDictionary<Integer,TEmpresa>.create;
    ListaSefazIE := TDictionary<string,string>.create;
    ListaSefazCNPJ := TDictionary<string,string>.create;
end;

end.
