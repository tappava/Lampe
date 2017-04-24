object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Delpi Lampe @rootfromhell'
  ClientHeight = 299
  ClientWidth = 635
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
  object Button1: TButton
    Left = 552
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Check Ports'
    TabOrder = 0
  end
  object cb_port: TComboBox
    Left = 482
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'Select Port'
    OnChange = cb_portChange
    OnSelect = cb_portSelect
  end
  object btn_send: TButton
    Left = 135
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 2
    OnClick = btn_sendClick
  end
  object tb_command: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
