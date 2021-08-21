VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "EngineTool"
   ClientHeight    =   6105
   ClientLeft      =   9375
   ClientTop       =   3435
   ClientWidth     =   9960
   BeginProperty Font 
      Name            =   "΢���ź�"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6105
   ScaleWidth      =   9960
   Begin VB.CommandButton PageButton 
      Caption         =   "Page"
      Height          =   495
      Left            =   8160
      TabIndex        =   12
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton AboutButton 
      Caption         =   "About"
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Top             =   5400
      Width           =   1695
   End
   Begin VB.CommandButton RenameButton 
      Caption         =   "Rename"
      Height          =   495
      Left            =   8160
      TabIndex        =   6
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton UploadButton 
      Caption         =   "Upload"
      Height          =   495
      Left            =   8160
      TabIndex        =   5
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton DownloadButton 
      Caption         =   "Download"
      Height          =   495
      Left            =   8160
      TabIndex        =   4
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton DeleteButton 
      Caption         =   "Delete"
      Height          =   495
      Left            =   8160
      TabIndex        =   3
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton LocalLevelsButton 
      Caption         =   "LocalLevels"
      Default         =   -1  'True
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton OnlineLevelsButton 
      Caption         =   "OnlineLevels"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1695
   End
   Begin VB.ListBox List1 
      BackColor       =   &H8000000B&
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4560
      Left            =   2070
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   600
      Width           =   5895
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00E0E0E0&
      Height          =   6135
      Left            =   0
      Picture         =   "Form1.frx":2AFA
      ScaleHeight     =   6075
      ScaleWidth      =   9915
      TabIndex        =   8
      Top             =   0
      Width           =   9975
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   1200
         Top             =   6000
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton ImportButton 
         Caption         =   "Import"
         Height          =   495
         Left            =   8130
         TabIndex        =   15
         Top             =   1890
         Width           =   1695
      End
      Begin VB.PictureBox SearchButton 
         Height          =   375
         Left            =   7560
         Picture         =   "Form1.frx":A2F4
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   14
         Top             =   120
         Width           =   375
      End
      Begin VB.TextBox Search 
         Height          =   375
         Left            =   2040
         TabIndex        =   13
         Text            =   "Text1"
         Top             =   120
         Width           =   5415
      End
      Begin VB.CommandButton InfoButton 
         Caption         =   "LevelInfo"
         Height          =   495
         Left            =   8130
         TabIndex        =   10
         Top             =   90
         Width           =   1695
      End
      Begin VB.CommandButton ExtractButton 
         Caption         =   "Extract"
         Height          =   495
         Left            =   8130
         TabIndex        =   9
         Top             =   2490
         Width           =   1695
      End
      Begin VB.Label LevelCounter 
         BackStyle       =   0  'Transparent
         Caption         =   "LevelCounter"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2040
         TabIndex        =   11
         Top             =   5520
         Width           =   5895
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Public Function DownloadFile(ByVal strURL As String, ByVal strFile As String) As Boolean
   Dim lngReturn As Long
   lngReturn = URLDownloadToFile(0, strURL, strFile, 0, 0)
   If lngReturn = 0 Then DownloadFile = True
End Function





Private Sub Form_Load()
'���û�ؿ�������rt9
On Error Resume Next
Version = "2.1"
'���б�����
List1.BackColor = RGB(240, 252, 250)
Search.BackColor = RGB(240, 252, 250)
Dim oShell
Set oShell = CreateObject("WScript.Shell")
LevelFolder = oShell.ExpandEnvironmentStrings("%UserProfile%")
ConfigFolder = LevelFolder & "\AppData\Local\SMM_WE"
LevelFolder = LevelFolder & "\AppData\Local\SMM_WE\Niveles"
   MkDir ConfigFolder
MkDir LevelFolder
    
    If CheckFileExists(ConfigFolder & "\SMMWECloudLocale.cfg") = True Then
    Open ConfigFolder & "\SMMWECloudLocale.cfg" For Input As #3
    Line Input #3, Locale
'��������
    If Locale = "zh-cn" Then
    LocalLevelsButton.Caption = "���عؿ�"
    OnlineLevelsButton.Caption = "���߹ؿ�"
    UploadButton.Caption = "�ϴ�"
    AboutButton.Caption = "����"
    InfoButton.Caption = "�ؿ���Ϣ"
    Title = "SMMWE Cloud �ؿ������� " & Version
    RenameError = "������ʧ�ܣ��ؿ����ֲ������ա�"
    ErrorText(0) = "ȷ��Ҫɾ�� ��"
    ErrorText(1) = "�� ��"
    ErrorText(2) = "������ ��"
    ErrorText(3) = "�� �������ơ�"
    ErrorText(4) = "����"
    ErrorText(5) = "����������..."
    ErrorText(6) = "������ɣ�"
    ErrorText(7) = "������"
    ErrorText(8) = "��������ϣ�"
    ErrorText(9) = "ɾ��"
    ErrorText(10) = "ɾ����ϣ�"
    ErrorText(11) = "(�ؿ�Ϊ3.0.0���߰�����)"
    ErrorText(12) = "�ؿ����ߣ�"
    ErrorText(13) = "�ؿ�������"
    ErrorText(14) = "��Ϸ���"
    ErrorText(15) = "��ǩ1��"
    ErrorText(16) = "��ǩ2��"
    ErrorText(17) = "ʱ�䣺"
    ErrorText(18) = "�Զ����᣺"
    ErrorText(19) = "����"
    ErrorText(20) = "����"
    ErrorText(21) = "����"
    ErrorText(22) = "��ȡ"
    ErrorText(23) = "��ȡ��ɣ�"
    ErrorText(24) = "SMMWE Cloud ����ϴ�"
    ErrorText(25) = "���ؿ�"
    ErrorText(26) = "������"
    ErrorText(27) = "ҳ��"
    ErrorText(28) = "�� SMMWE Cloud ��ҳ��"
    ErrorText(29) = "������"
    ErrorText(30) = "�ڱ�ҳ������..."
    ErrorText(31) = "����"
    ErrorText(32) = "������ɣ�"
    ErrorText(33) = "�ؿ�"
    
    GameLabel(0) = "�Զ�"
    GameLabel(1) = "��С����"
    GameLabel(2) = "���˶�ս"
    GameLabel(3) = "����"
    GameLabel(4) = "BOSSս"
    GameLabel(5) = "����"
    GameLabel(6) = "��ʱ��ս"
    GameLabel(7) = "�Զ�����"
    GameLabel(8) = "����"
    GameLabel(9) = "���"
    GameLabel(10) = "����"
    GameLabel(11) = "����"
    GameLabel(12) = "��ͳ"
    GameLabel(13) = "����"
    GameLabel(14) = "�ֿ�"
    GameLabel(15) = "��"
     JSONError = "(�ؿ�����ʧ��)"
ElseIf Locale = "en-us" Then
     LocalLevelsButton.Caption = "Local Level"
     OnlineLevelsButton.Caption = "Online Level"
     UploadButton.Caption = "Upload"
     AboutButton.Caption = "About"
    InfoButton.Caption = "Level Info"
    Title = "SMMWE Cloud Level Manager " & Version
     RenameError = "Failed to rename, level name cannot be left blank."
     ErrorText(0) = "Are you sure you want to delete " & Chr(34)
     ErrorText(1) = Chr(34) & "? "
     ErrorText(2) = "Please enter the new name for " & Chr(34)
     ErrorText(3) = Chr(34) & ". "
     ErrorText(4) = "Download"
     ErrorText(5) = "Downloading..."
     ErrorText(6) = "Download complete!"
     ErrorText(7) = "Rename"
     ErrorText(8) = "Rename complete!"
     ErrorText(9) = "Delete"
     ErrorText(10) = "Deletion complete!"
    ErrorText(11) = "(Made with 3.0.0 Offline patch)"
    ErrorText(12) = "Maker: "
    ErrorText(13) = "Stage: "
    ErrorText(14) = "Game style: "
    GameLabel(0) = "Automatic"
    GameLabel(1) = "Short but intense"
    GameLabel(2) = "Multiplayer versus"
    GameLabel(3) = "Theme"
    GameLabel(4) = "BOSS fight"
    GameLabel(5) = "Singleplayer"
    GameLabel(6) = "Time challenge"
    GameLabel(7) = "Autoscroll"
    GameLabel(8) = "Skills"
    GameLabel(9) = "Shooting"
    GameLabel(10) = "Music"
    GameLabel(11) = "Art"
    GameLabel(12) = "Traditional"
    GameLabel(13) = "Puzzles"
    GameLabel(14) = "Link"
    GameLabel(15) = "None"
    ErrorText(15) = "Label 1: "
    ErrorText(16) = "Label 2: "
    ErrorText(17) = "Timer: "
    ErrorText(18) = "Autoscroll: "
    ErrorText(19) = "Slow"
    ErrorText(20) = "Normal"
    ErrorText(21) = "Fast"
    ErrorText(22) = "Export"
    ErrorText(23) = "Completed!"
    ErrorText(24) = "SMMWE Cloud Users Uploaded"
    ErrorText(25) = " Levels"
    ErrorText(26) = "Loading"
    ErrorText(27) = "Page"
    ErrorText(28) = "Open SMMWE Cloud Website"
    ErrorText(29) = "Check Update"
    ErrorText(30) = "Search in this page..."
    ErrorText(31) = "Import"
    ErrorText(32) = "Completed!"
    ErrorText(33) = "Level"
     JSONError = "(Level parsing failed)"
ElseIf Locale = "es-es" Then
      LocalLevelsButton.Caption = "Nivel local"
      OnlineLevelsButton.Caption = "Nivel en linea"
      UploadButton.Caption = "Subir Nivel"
    InfoButton.Caption = "info de nivel"
      AboutButton.Caption = "Sobre"
    Title = "SMMWE Cloud Level Manager " & Version
      RenameError = "No se pudo cambiar el nombre, el nombre del nivel no se puede dejar en blanco."
      ErrorText(0) = "Esta seguro de que desea borrar" & Chr(34)
      ErrorText(1) = Chr(34) & "?"
      ErrorText(2) = "Ingrese el nuevo nombre para" & Chr(34)
      ErrorText(3) = Chr(34) & "."
      ErrorText(4) = "Descargar"
      ErrorText(5) = "Descargando ..."
      ErrorText(6) = "Descarga completa!"
      ErrorText(7) = "Cambiar nombre"
      ErrorText(8) = "Cambio de nombre completo!"
      ErrorText(9) = "Borrar"
      ErrorText(10) = "Eliminacion completa!"
      ErrorText(11) = "(Hecho con el parche 3.0.0 sin conexion)"
     ErrorText(12) = "Creador :"
     ErrorText(13) = "Escenario: "
    ErrorText(14) = "Estilo de juego: "
    GameLabel(0) = "Automatismos"
    GameLabel(1) = "Corto pero intenso"
    GameLabel(2) = "Conpetitivo"
    GameLabel(3) = "Tematico"
    GameLabel(4) = "Contra jefes"
    GameLabel(5) = "En solitario"
    GameLabel(6) = "Contrareloj"
    GameLabel(7) = "Autoavance"
    GameLabel(8) = "Habilidad"
    GameLabel(9) = "Disparos"
    GameLabel(10) = "Musica"
    GameLabel(11) = "Artistico"
    GameLabel(12) = "Tradicional"
    GameLabel(13) = "Puzles"
    GameLabel(14) = "Link"
    GameLabel(15) = "Ninguno"
    ErrorText(15) = "Etiqueta 1: "
     ErrorText(16) = "Etiqueta 2: "
     ErrorText(17) = "Cronometro: "
     ErrorText(18) = "Autoavance: "
    ErrorText(19) = "Lento"
    ErrorText(20) = "Normal"
    ErrorText(21) = "Rapido"
    ErrorText(22) = "Exportar"
     ErrorText(23) = "Completado!"
     JSONError = "(Error de analisis de nivel)"
     ErrorText(24) = "SMMWE Cloud subidos"
     ErrorText(25) = " Niveles"
     ErrorText(26) = "Cargando"
    ErrorText(27) = "Pagina"
    ErrorText(28) = "Sitio web abierto SMMWE Cloud"
    ErrorText(29) = "Buscar actualizacion"
    ErrorText(30) = "Buscar en esta pagina..."
    ErrorText(31) = "Importar"
    ErrorText(32) = "Completado!"
    ErrorText(33) = "Nivel"
    End If
    Close #3
    End If
    DownloadButton.Caption = ErrorText(4)
    RenameButton.Caption = ErrorText(7)
    DeleteButton.Caption = ErrorText(9)
    ExtractButton.Caption = ErrorText(22)
    ImportButton.Caption = ErrorText(31)
'ɾ�����߹ؿ��б�����
    If CheckFileExists(ConfigFolder & "\SMMWECloudLevelList.json") = True Then Kill ConfigFolder & "\SMMWECloudLevelList.json"
'��������
    Form1.Caption = Title & " - " & LocalLevelsButton.Caption
DeleteButton.Visible = True
InfoButton.Visible = True
RenameButton.Visible = True
DownloadButton.Visible = False
UploadButton.Visible = False
ExtractButton.Visible = True
List1.Top = 120
List1.Height = 5340
PageButton.Visible = False
SearchButton.Visible = False
ImportButton.Visible = True
Search.Visible = False

Search.Text = ErrorText(30)
Search.ForeColor = RGB(130, 130, 130)

    '���ر��عؿ�
Dim fname As String
fname = Dir(LevelFolder & "\*.swe", 7)
List1.Clear
Do
If fname = "" Then Exit Do
List1.AddItem Replace(fname, ".swe", "")
fname = Dir()
Loop
ReDim locallevel(0 To List1.ListCount - 1) As String
For I = 0 To List1.ListCount - 1
locallevel(I) = List1.List(I)
Next
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
End Sub
Private Sub LocalLevelsButton_click()
'���û�ؿ�������rt9
On Error Resume Next
'��������
DeleteButton.Visible = True
RenameButton.Visible = True
ImportButton.Visible = True
InfoButton.Visible = True
DownloadButton.Visible = False
UploadButton.Visible = False
ExtractButton.Visible = True
SearchButton.Visible = False
PageButton.Visible = False
Search.Visible = False
    Form1.Caption = Title & " - " & LocalLevelsButton.Caption
List1.Top = 120
List1.Height = 5340
'���ر��عؿ�
List1.Clear
fname = Dir(LevelFolder & "\*.swe", 7)
Do
If fname = "" Then Exit Do
List1.AddItem Replace(fname, ".swe", "")
fname = Dir()
Loop
ReDim locallevel(0 To List1.ListCount - 1)
For I = 0 To List1.ListCount - 1
locallevel(I) = List1.List(I)
Next
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
End Sub
Private Sub OnlineLevelsButton_Click()
'���߹ؿ���ť
    If CheckFileExists(ConfigFolder & "\SMMWECloudLevelList.json") = True Then Kill ConfigFolder & "\SMMWECloudLevelList.json"
LevelSourceUrl = "https://cloud.smmwe.ml/main/"

    Form1.Caption = Title & " - " & OnlineLevelsButton.Caption
List1.Clear
List1.AddItem ErrorText(26)
DeleteButton.Visible = False
RenameButton.Visible = False
ExtractButton.Visible = False
DownloadButton.Visible = True
InfoButton.Visible = False
ImportButton.Visible = False
UploadButton.Visible = True
PageButton.Visible = True
Search.Visible = True
SearchButton.Visible = True
List1.Top = 600
Search.Text = ErrorText(30)
Search.ForeColor = RGB(130, 130, 130)
List1.Height = 4860
'��ȡҳ��
PageNumber = 1
    Debug.Print DownloadFile("https://cloud.smmwe.ml/main/?filename", ConfigFolder & "\SMMWECloudLevelList.json")
    Dim pagelist As String
    Open ConfigFolder & "\SMMWECloudLevelList.json" For Input As #6
    Line Input #6, pagelist
    onlinepage = Split(pagelist, vbLf)
    onlinepage = Filter(onlinepage, "Levels Page")
    PageNumberMax = UBound(onlinepage) - LBound(onlinepage) + 2
    Close #6
    '��ȡ�ؿ�
    Dim filelist As String
    Open ConfigFolder & "\SMMWECloudLevelList.json" For Input As #1
    Line Input #1, filelist
    OnlineLevel = Split(filelist, vbLf)
    OnlineLevel = Filter(OnlineLevel, ".swe")
    onlineleveltmp = Join(OnlineLevel, vbCrLf)
    onlineleveltmp = Replace(onlineleveltmp, ".swe", "")
    OnlineLevel = Split(onlineleveltmp, vbCrLf)
    Dim tmp2 As Integer
    tmp2 = UBound(OnlineLevel) - LBound(OnlineLevel)
    Dim s As Long, I As Long
    
List1.Clear
    For I = 0 To tmp2
        List1.AddItem OnlineLevel(I)
    Next I
    Close #1
    PageButton.Caption = ErrorText(27) & " " & CStr(PageNumber) & "/" & CStr(PageNumberMax)
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
End Sub
'���� ������Դ������
Private Sub ImportButton_Click()
On Error GoTo userCanceled
With CommonDialog1
.CancelError = True
.Flags = cdlOFNHideReadOnly Or cdlOFNAllowMultiselect Or cdlOFNExplorer Or cdlOFNNoDereferenceLinks
.Filter = "SMM_WE " & ErrorText(33) & "(*.swe)|*.swe"
.ShowOpen
FileCopy .FileName, LevelFolder & "\" & Split(.FileName, "\")(UBound(Split(.FileName, "\")) - LBound(Split(.FileName, "\")))
    ImportButton.Caption = ErrorText(32)
    DoEvents
    Sleep (700)
    ImportButton.Caption = ErrorText(31)
End With
        List1.Clear
        fname = Dir(LevelFolder & "\*.swe", 7)
        Do
        If fname = "" Then Exit Do
        List1.AddItem Replace(fname, ".swe", "")
        fname = Dir()
        Loop
        ReDim locallevel(0 To List1.ListCount - 1)
        For I = 0 To List1.ListCount - 1
        locallevel(I) = List1.List(I)
        Next
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
userCanceled:
End Sub
'ɾ��
Private Sub DeleteButton_Click()
If List1.Text <> "" Then
    IfDelete = MsgBox(ErrorText(0) & List1.Text & ErrorText(1), 1, "")
    If IfDelete = 1 Then
    Kill LevelFolder & "\" & List1.Text & ".swe"
    DeleteButton.Caption = ErrorText(10)
    Sleep (1000)
    DeleteButton.Caption = ErrorText(9)
List1.Clear
fname = Dir(LevelFolder & "\*.swe", 7)
Do
If fname = "" Then Exit Do
List1.AddItem Replace(fname, ".swe", "")
fname = Dir()
Loop
ReDim locallevel(0 To List1.ListCount - 1)
For I = 0 To List1.ListCount - 1
locallevel(I) = List1.List(I)
Next
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
    End If
End If
End Sub
'���عؿ�
Private Sub DownloadButton_Click()
If List1.Text <> "" Then
    DownloadButton.Caption = ErrorText(5)
    Debug.Print DownloadFile(LevelSourceUrl & List1.Text & ".swe", LevelFolder & "\" & List1.Text & ".swe")
    DownloadButton.Caption = ErrorText(6)
    DoEvents
    Sleep (1000)
    DownloadButton.Caption = ErrorText(4)
End If
End Sub



'������
Private Sub RenameButton_Click()

If List1.Text <> "" Then
    NewName = InputBox(ErrorText(2) & List1.Text & ErrorText(3), "")
    If NewName <> "" Then
     If NewName <> " " Then
       Name LevelFolder & "\" & List1.Text & ".swe" As LevelFolder & "\" & NewName & ".swe"
    RenameButton.Caption = ErrorText(8)
    DoEvents
    Sleep (1000)
    RenameButton.Caption = ErrorText(7)
        List1.Clear
        fname = Dir(LevelFolder & "\*.swe", 7)
        Do
        If fname = "" Then Exit Do
        List1.AddItem Replace(fname, ".swe", "")
        fname = Dir()
        Loop
        ReDim locallevel(0 To List1.ListCount - 1)
        For I = 0 To List1.ListCount - 1
        locallevel(I) = List1.List(I)
        Next
    Else
        MsgBox RenameError
    End If
    Else
        MsgBox RenameError
    End If
End If
End Sub
Private Sub Search_Click()
If Search.Text = ErrorText(30) Then
Search.Text = ""
Search.ForeColor = RGB(0, 0, 0)
End If
End Sub

Private Sub SearchButton_Click()
'ִ������
If Search.Text <> (ErrorText(30)) Then
ReDim OnlineLevelSearched(0 To List1.ListCount - 1)
For I = 0 To List1.ListCount - 1
OnlineLevelSearched(I) = List1.List(I)
Next
OnlineLevelSearched2 = Filter(OnlineLevelSearched, Search.Text)
    Dim tmp3 As Integer
    tmp3 = UBound(OnlineLevelSearched2) - LBound(OnlineLevelSearched2)
List1.Clear
    For I = 0 To tmp3
        List1.AddItem OnlineLevelSearched2(I)
    Next I
End If

If Search.Text = "" Then
    Open ConfigFolder & "\SMMWECloudLevelList.json" For Input As #1
    Line Input #1, filelist
    OnlineLevel = Split(filelist, vbLf)
    OnlineLevel = Filter(OnlineLevel, ".swe")
    onlineleveltmp = Join(OnlineLevel, vbCrLf)
    onlineleveltmp = Replace(onlineleveltmp, ".swe", "")
    OnlineLevel = Split(onlineleveltmp, vbCrLf)
    Dim tmp2 As Integer
    tmp2 = UBound(OnlineLevel) - LBound(OnlineLevel)
    
List1.Clear
    For I = 0 To tmp2
        List1.AddItem OnlineLevel(I)
    Next I
    Close #1
End If

LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
End Sub

Private Sub UploadButton_Click()
Shell "cmd /c start https://cloud.smmwe.ml/upload", vbMinimizedNoFocus
End Sub


Private Sub AboutButton_Click()
Load frmAbout
frmAbout.Show
End Sub

Private Sub InfoButton_Click()
If List1.Text <> "" Then
    Dim LevelContent As String
    Open LevelFolder & "\" & List1.Text & ".swe" For Input As #4
    Line Input #4, LevelContent
    Close #4
    LevelContent = Base64Decode(LevelContent)
    Debug.Print LevelContent
    Dim LevelMaker As String
    LevelMaker = JSONParse("MAIN.AJUSTES[0].user", LevelContent)
    If LevelMaker = "0" Then LevelMaker = ErrorText(11)
    If LevelMaker = "0.000" Then LevelMaker = ErrorText(11)
    Dim GameStyle As String
    GameStyle = JSONParse("MAIN.AJUSTES[0].apariencia", LevelContent)
    If GameStyle = "0" Then GameStyle = "SMB1"
    If GameStyle = "1" Then GameStyle = "SMB3"
    If GameStyle = "2" Then GameStyle = "SMW"
    If GameStyle = "3" Then GameStyle = "NSMBU"
    gamelabel1 = JSONParse("MAIN.AJUSTES[0].etiqueta1", LevelContent)
    gamelabel2 = JSONParse("MAIN.AJUSTES[0].etiqueta2", LevelContent)
    If gamelabel1 = "0" Then gamelabel1 = GameLabel(12)
    If gamelabel1 = "1" Then gamelabel1 = GameLabel(13)
    If gamelabel1 = "2" Then gamelabel1 = GameLabel(6)
    If gamelabel1 = "3" Then gamelabel1 = GameLabel(7)
    If gamelabel1 = "4" Then gamelabel1 = GameLabel(0)
    If gamelabel1 = "5" Then gamelabel1 = GameLabel(1)
    If gamelabel1 = "6" Then gamelabel1 = GameLabel(3)
    If gamelabel1 = "7" Then gamelabel1 = GameLabel(2)
    If gamelabel1 = "8" Then gamelabel1 = GameLabel(10)
    If gamelabel1 = "9" Then gamelabel1 = GameLabel(11)
    If gamelabel1 = "10" Then gamelabel1 = GameLabel(8)
    If gamelabel1 = "11" Then gamelabel1 = GameLabel(9)
    If gamelabel1 = "12" Then gamelabel1 = GameLabel(4)
    If gamelabel1 = "13" Then gamelabel1 = GameLabel(5)
    If gamelabel1 = "14" Then gamelabel1 = GameLabel(14)
    If gamelabel2 = "0" Then gamelabel2 = GameLabel(12)
    If gamelabel2 = "1" Then gamelabel2 = GameLabel(13)
    If gamelabel2 = "2" Then gamelabel2 = GameLabel(6)
    If gamelabel2 = "3" Then gamelabel2 = GameLabel(7)
    If gamelabel2 = "4" Then gamelabel2 = GameLabel(0)
    If gamelabel2 = "5" Then gamelabel2 = GameLabel(1)
    If gamelabel2 = "6" Then gamelabel2 = GameLabel(3)
    If gamelabel2 = "7" Then gamelabel2 = GameLabel(2)
    If gamelabel2 = "8" Then gamelabel2 = GameLabel(10)
    If gamelabel2 = "9" Then gamelabel2 = GameLabel(11)
    If gamelabel2 = "10" Then gamelabel2 = GameLabel(8)
    If gamelabel2 = "11" Then gamelabel2 = GameLabel(9)
    If gamelabel2 = "12" Then gamelabel2 = GameLabel(4)
    If gamelabel2 = "13" Then gamelabel2 = GameLabel(5)
    If gamelabel2 = "14" Then gamelabel2 = GameLabel(14)
    If gamelabel1 = "-1" Then gamelabel1 = GameLabel(15)
    If gamelabel2 = "-1" Then gamelabel2 = GameLabel(15)
    Dim AutoScroll As String
    AutoScroll = JSONParse("MAIN.AJUSTES[0].autoavance", LevelContent)
    If AutoScroll = "0" Then AutoScroll = GameLabel(15)
    If AutoScroll = "1" Then AutoScroll = ErrorText(19)
    If AutoScroll = "2" Then AutoScroll = ErrorText(20)
    If AutoScroll = "3" Then AutoScroll = ErrorText(21)
    MsgBox ErrorText(12) & JSONParse("MAIN.AJUSTES[0].user", LevelContent) & vbCrLf & ErrorText(13) & JSONParse("MAIN.AJUSTES[0].entorno", LevelContent) _
    & vbCrLf & ErrorText(13) & GameStyle & vbCrLf & ErrorText(15) & gamelabel1 & "  " & ErrorText(16) & gamelabel2 & vbCrLf & ErrorText(17) & JSONParse("MAIN.AJUSTES[0].cronometro", LevelContent) _
    & vbCrLf & ErrorText(18) & AutoScroll _
    , vbOKOnly, InfoButton.Caption
End If
End Sub
Private Sub ExtractButton_Click()
'�����ؿ���ť
If List1.Text <> "" Then
Dim oShell
Set oShell = CreateObject("WScript.Shell")
DesktopFolder = oShell.ExpandEnvironmentStrings("%UserProfile%")
DesktopFolder = DesktopFolder & "\Desktop"
FileCopy LevelFolder & "\" & List1.Text & ".swe", DesktopFolder & "\" & List1.Text & ".swe"
    ExtractButton.Caption = ErrorText(23)
    DoEvents
    Sleep (1000)
    ExtractButton.Caption = ErrorText(22)
End If
End Sub
Private Sub PageButton_Click()
'����ҳ��
PageNumber = PageNumber + 1
If PageNumber = PageNumberMax + 1 Then PageNumber = 1
If PageNumber = 1 Then
LevelSourceUrl = "https://cloud.smmwe.ml/main/"
Else
LevelSourceUrl = "https://cloud.smmwe.ml/main/Levels%20Page%20" & CStr(PageNumber - 1) & "/"
End If
    PageButton.Caption = ErrorText(27) & " " & CStr(PageNumber) & "/" & CStr(PageNumberMax)
    '��ȡ�ؿ�
    Debug.Print DownloadFile(LevelSourceUrl & "?filename", ConfigFolder & "\SMMWECloudLevelList.json")
    Dim filelist As String
    Open ConfigFolder & "\SMMWECloudLevelList.json" For Input As #1
    Line Input #1, filelist
    OnlineLevel = Split(filelist, vbLf)
    OnlineLevel = Filter(OnlineLevel, ".swe")
    onlineleveltmp = Join(OnlineLevel, vbCrLf)
    onlineleveltmp = Replace(onlineleveltmp, ".swe", "")
    OnlineLevel = Split(onlineleveltmp, vbCrLf)
    Dim tmp2 As Integer
    tmp2 = UBound(OnlineLevel) - LBound(OnlineLevel)
    Dim s As Long, I As Long
    
List1.Clear
    For I = 0 To tmp2
        List1.AddItem OnlineLevel(I)
    Next I
    Close #1
LevelCounter.Caption = CStr(List1.ListCount) & ErrorText(25)
End Sub