object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 482
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 419
    Width = 212
    Height = 25
    Caption = 'verificar empresas'
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 8
    Top = 8
    Width = 283
    Height = 367
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object mmo2: TMemo
    Left = 297
    Top = 8
    Width = 318
    Height = 367
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 379
    Width = 212
    Height = 24
    Caption = 'Carregar Sefaz e Emp'
    TabOrder = 3
    OnClick = Button1Click
  end
  object pb1: TProgressBar
    Left = 226
    Top = 379
    Width = 389
    Height = 17
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 378
    Top = 375
  end
end
