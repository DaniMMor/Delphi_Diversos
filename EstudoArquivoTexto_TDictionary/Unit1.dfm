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
    Top = 398
    Width = 253
    Height = 25
    Caption = 'Carrega Arq Texto nos memos e no TDictionary'
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 8
    Top = 8
    Width = 123
    Height = 317
    Lines.Strings = (
      'mmo1')
    TabOrder = 1
  end
  object mmo2: TMemo
    Left = 137
    Top = 8
    Width = 130
    Height = 317
    Lines.Strings = (
      'mmo2')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 368
    Width = 253
    Height = 24
    Caption = 'Criar Arq Texto'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 429
    Width = 253
    Height = 25
    Caption = 'Verifica Empresa'
    TabOrder = 4
    OnClick = Button2Click
  end
  object mmo3: TMemo
    Left = 283
    Top = 8
    Width = 332
    Height = 317
    Lines.Strings = (
      'mmo3')
    TabOrder = 5
  end
  object CheckBox1: TCheckBox
    Left = 290
    Top = 402
    Width = 135
    Height = 17
    Caption = 'carregar memo'
    TabOrder = 6
  end
end
