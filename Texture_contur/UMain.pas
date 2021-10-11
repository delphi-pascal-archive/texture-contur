unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  Tfrm_Main = class(TForm)
    pb_Display: TPaintBox;
    rb_Texture: TRadioButton;
    rb_Color: TRadioButton;
    rb_degrade: TRadioButton;
    FontDialog1: TFontDialog;
    lbl_Font: TLabel;
    UpDown1: TUpDown;
    ed_Shadow: TEdit;
    cb_Shadow: TCheckBox;
    cb_Contour: TCheckBox;
    ed_Contour: TEdit;
    UpDown2: TUpDown;
    ed_Text: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    sh_Contour: TShape;
    ColorDialog1: TColorDialog;
    sh_SContour: TShape;
    sh_Shadow: TShape;
    sh_SShadow: TShape;
    sh_TxtColor: TShape;
    sh_STxtColor: TShape;
    Label2: TLabel;
    procedure pb_DisplayPaint(Sender: TObject);
    procedure rb_TextureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_FontClick(Sender: TObject);
    procedure sh_ContourMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Déclarations privées }
    procedure DoDrawText;
    procedure UpdateLblFont;
  public
    { Déclarations publiques }
  end;

var
  frm_Main: Tfrm_Main;
  aTxt: string = 'DelphiSources.ru';

implementation

{$R *.dfm}
Uses Gradients;

Procedure GetTextSize(aCanvas : TCanvas; Text : String;Var aRect : TRect);
Begin
    DrawText(aCanvas.Handle, PChar(Text), Length(Text), aRect, DT_CALCRECT);
End;


procedure Tfrm_Main.DoDrawText;
Var Bmp : TBITMAP;
    aRect : TRect;
    ShadowOffset, ContourSize : Integer;
begin
  ShadowOffset := StrToIntDef(ed_Shadow.Text, 0);
  ContourSize := StrToIntDef(ed_Contour.Text, 0);
  aTxt := ed_Text.Text;
  Bmp := TBitmap.Create;
  try
    aRect := Rect(0,0,1,1);

    GetTextSize(pb_Display.Canvas, aTxt, aRect);
    InflateRect(aRect, ShadowOffset, ShadowOffset);
    //BMP.SetSize(aRect.Right, aRect.Bottom);
    BMP.Width := aRect.Right;
    BMP.Height := aRect.Bottom;

    if rb_Texture.Checked then
      BMP.LoadFromFile('crinklepaper.bmp'); //'crinklepaper.bmp'

    if rb_Degrade.Checked then
      GradientTriangle(BMP.Canvas,
        [$00FFAEAE, $00BBFFBB, $00B3FFFF, $00C1C1FF, $009DE6B9], aRect);

    if rb_Color.Checked then
    begin
      BMP.Canvas.Brush.Color := pb_Display.Canvas.Font.Color;
      BMP.Canvas.FillRect(aRect);
    end;

    pb_Display.Canvas.Brush.Style := bsClear;
    pb_Display.Canvas.FillRect(aRect);

    pb_Display.Canvas.Brush.Bitmap := Nil;

    if cb_Shadow.Checked then
    begin
      pb_Display.Canvas.Brush.Color := sh_Shadow.Brush.Color;
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, ShadowOffset+2, ShadowOffset+2, 0, 0,
        DST_PREFIXTEXT Or DSS_MONO);
    end;

    if cb_Contour.Checked then
    begin
      pb_Display.Canvas.Brush.Color := sh_Contour.Brush.Color;
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, 0, -ContourSize, 0, 0, DST_PREFIXTEXT Or DSS_MONO);
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, 0, ContourSize, 0, 0, DST_PREFIXTEXT Or DSS_MONO);

      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, -ContourSize, 0, 0, 0, DST_PREFIXTEXT Or DSS_MONO);
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, ContourSize, 0, 0, 0, DST_PREFIXTEXT Or DSS_MONO);

      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, -ContourSize, -ContourSize, 0, 0,
        DST_PREFIXTEXT Or DSS_MONO);
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, ContourSize, ContourSize, 0, 0,
        DST_PREFIXTEXT Or DSS_MONO);

      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, ContourSize, -ContourSize, 0, 0,
        DST_PREFIXTEXT Or DSS_MONO);
      DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
        LongInt(aTxt), 0, -ContourSize, ContourSize, 0, 0,
        DST_PREFIXTEXT Or DSS_MONO);
    end;

    pb_Display.Canvas.Brush.Style := bsSolid;
    pb_Display.Canvas.Brush.Bitmap := Bmp;
    DrawState(pb_Display.Canvas.Handle, pb_Display.Canvas.Brush.Handle, Nil,
      LongInt(aTxt), 0, 0, 0, 0, 0, DST_TEXT Or DSS_MONO);

  finally
    Bmp.Free;
    pb_Display.Canvas.Brush.Bitmap := Nil;
  end;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  Panel1.DoubleBuffered := True;
  UpdateLblFont;
end;

procedure Tfrm_Main.lbl_FontClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font := pb_Display.Font;
    if Execute then
      pb_Display.Font := Font;
  end;
  UpdateLblFont;
end;

procedure Tfrm_Main.pb_DisplayPaint(Sender: TObject);
begin
  DoDrawText;
end;

procedure Tfrm_Main.rb_TextureClick(Sender: TObject);
begin
  pb_Display.Invalidate
end;

procedure Tfrm_Main.sh_ContourMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then
  with ColorDialog1 do
  begin
    Color := TShape(Sender).Brush.Color;
    if Execute then
    begin
      TShape(Sender).Brush.Color := Color;
      if TShape(Sender).Tag = 111 then
        pb_Display.Font.Color := Color;
      pb_Display.Invalidate
    end;
  end;
end;

procedure Tfrm_Main.UpdateLblFont;
const sFontData = 'Name: %s'#13'Size: %d';
begin
  lbl_Font.Caption := Format(sFontData, [pb_Display.Font.Name,
                        pb_Display.Font.Size]);
end;

end.
