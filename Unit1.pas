unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    cb_port: TComboBox;
    btn_send: TButton;
    tb_command: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_sendClick(Sender: TObject);
    procedure cb_portChange(Sender: TObject);
    procedure cb_portSelect(Sender: TObject);
  private
    { Private-Deklarationen }
  public

  end;
var
  Form1: TForm1;
var
  NumberWritten, BytesRead, BytesToRead: LongWord;
Buffer: PChar;
var
  hCommFile: THandle;
  chosenPort: String;

implementation

{$R *.dfm}

procedure sendToPort(input: String);
 begin
 if input.Length > 0 then
  begin
   //ShowMessage(chosenPort);
   hCommFile := CreateFile(PChar(chosenPort),GENERIC_WRITE or GENERIC_READ, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   if hCommFile = INVALID_HANDLE_VALUE then
     begin
     ShowMessage('Unable to open ' + Form1.cb_port.Text);
     Exit;
     end;
    NumberWritten := 0;
    if WriteFile(hCommFile, PChar(input)^, Length(input), NumberWritten, nil) = False then ShowMessage('Problem with ' + Form1.cb_port.Text);
    BytesRead := 0;
    BytesToRead := 1;
    if ReadFile(hCommFile, Buffer, BytesToRead, BytesRead, nil) = False then ShowMessage('Problem with ' + Form1.cb_port.Text);
    CloseHandle(hCommFile);
    end
    else
    begin
      ShowMessage('No command given...');
    end;
 end;

procedure TForm1.btn_sendClick(Sender: TObject);
begin
     sendToPort(Self.tb_command.Text);
end;

procedure TForm1.cb_portChange(Sender: TObject);
begin
  chosenPort := cb_port.Text;
end;

procedure TForm1.cb_portSelect(Sender: TObject);
begin
  chosenPort := cb_port.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cb_port.AddItem('COM1',Self);
  cb_port.AddItem('COM2',Self);
  cb_port.AddItem('COM3',Self);
  cb_port.AddItem('COM4',Self);
  cb_port.AddItem('COM5',Self);
end;

end.
