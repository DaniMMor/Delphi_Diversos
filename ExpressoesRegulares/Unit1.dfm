object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 183
    Top = 152
    Width = 42
    Height = 33
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 431
    Height = 89
    Lines.Strings = (
      '(\W|^)[\w.\-]{0,2}@(yahoo|hotmail|gmail)\.com(\W|$)')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 116
    Width = 431
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 8
    Top = 143
    Width = 75
    Height = 51
    Caption = 'btn1'
    TabOrder = 2
    OnClick = btn1Click
  end
end
