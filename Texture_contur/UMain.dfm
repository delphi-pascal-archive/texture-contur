object frm_Main: Tfrm_Main
  Left = 220
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Texture contur'
  ClientHeight = 476
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object pb_Display: TPaintBox
    Left = 0
    Top = 0
    Width = 604
    Height = 400
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -60
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
    OnPaint = pb_DisplayPaint
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 604
    Height = 76
    Align = alBottom
    TabOrder = 0
    object lbl_Font: TLabel
      Left = 98
      Top = 39
      Width = 47
      Height = 16
      Hint = 'Cliquer pour modifier'
      Caption = 'lbl_Font'
      ParentShowHint = False
      ShowHint = True
      OnClick = lbl_FontClick
    end
    object Label1: TLabel
      Left = 98
      Top = 19
      Width = 110
      Height = 16
      Hint = 'Cliquer pour modifier'
      Caption = 'Font properties:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lbl_FontClick
    end
    object sh_SContour: TShape
      Left = 441
      Top = 101
      Width = 64
      Height = 32
      Brush.Color = clSilver
      Pen.Style = psClear
    end
    object sh_Contour: TShape
      Left = 360
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clBlack
      OnMouseDown = sh_ContourMouseDown
    end
    object sh_SShadow: TShape
      Left = 582
      Top = 101
      Width = 64
      Height = 32
      Brush.Color = clSilver
      Pen.Style = psClear
    end
    object sh_Shadow: TShape
      Tag = 1
      Left = 472
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clGray
      OnMouseDown = sh_ContourMouseDown
    end
    object sh_STxtColor: TShape
      Left = 255
      Top = 101
      Width = 64
      Height = 32
      Brush.Color = clSilver
      Pen.Style = psClear
    end
    object sh_TxtColor: TShape
      Tag = 111
      Left = 256
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clRed
      OnMouseDown = sh_ContourMouseDown
    end
    object Label2: TLabel
      Left = 216
      Top = 48
      Width = 32
      Height = 16
      Caption = 'Color'
    end
    object cb_Contour: TCheckBox
      Left = 294
      Top = 48
      Width = 63
      Height = 17
      Caption = 'Contur'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = rb_TextureClick
    end
    object cb_Shadow: TCheckBox
      Left = 395
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Shadow'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = rb_TextureClick
    end
    object ed_Contour: TEdit
      Left = 558
      Top = 40
      Width = 19
      Height = 25
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 2
      Text = '2'
      OnChange = rb_TextureClick
    end
    object ed_Shadow: TEdit
      Left = 512
      Top = 40
      Width = 20
      Height = 25
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 3
      Text = '5'
      OnChange = rb_TextureClick
    end
    object ed_Text: TEdit
      Left = 216
      Top = 9
      Width = 377
      Height = 24
      TabOrder = 4
      Text = 'DelphiSources.ru'
      OnChange = rb_TextureClick
    end
    object rb_Color: TRadioButton
      Left = 10
      Top = 24
      Width = 71
      Height = 17
      Caption = 'Color'
      TabOrder = 5
      OnClick = rb_TextureClick
    end
    object rb_degrade: TRadioButton
      Left = 10
      Top = 40
      Width = 79
      Height = 17
      Caption = 'Gradient'
      Checked = True
      TabOrder = 6
      TabStop = True
      OnClick = rb_TextureClick
    end
    object rb_Texture: TRadioButton
      Left = 10
      Top = 8
      Width = 79
      Height = 17
      Caption = 'Texture'
      TabOrder = 7
      OnClick = rb_TextureClick
    end
    object UpDown1: TUpDown
      Left = 532
      Top = 40
      Width = 21
      Height = 25
      Associate = ed_Shadow
      Min = 1
      Max = 5
      Position = 5
      TabOrder = 8
    end
    object UpDown2: TUpDown
      Left = 576
      Top = 40
      Width = 17
      Height = 25
      Associate = ed_Contour
      Min = 1
      Max = 5
      Position = 2
      TabOrder = 9
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 18
    Top = 9
  end
  object ColorDialog1: TColorDialog
    Left = 18
    Top = 37
  end
end
