Attribute VB_Name = "Module1"
Option Explicit
Const START_ROW As Integer = 7
Const END_ROW As Integer = 37
Const START_COL As Integer = 3
Const END_COL As Integer = 4


Sub ��荞��()
    Dim varFileName As Variant
    Dim intFree As Integer
    Dim strRec As String
    Dim strSplit() As String
    Dim i As Long, j As Long, k As Long
    Dim strCell As String
    
    
    varFileName = Application.GetOpenFilename(FileFilter:="CSV�t�@�C��(*.csv), *.csv", Title:="CSV�t�@�C����荞�ݑI��")
    If varFileName = False Then
        Exit Sub
    End If
    
    Open varFileName For Input As #1 'CSV�t�@�C���I�[�v��
    
    i = 0
    '�t�@�C���̏I���܂ŌJ��Ԃ�
    Do Until EOF(1)
        Line Input #1, strRec '1�s�ǂݍ���
        '��s�ڂ͔�΂�����
        
        strSplit = Split(strRec, ",")
        ActiveWorkbook.ActiveSheet.Cells(i + START_ROW, START_COL) = strSplit(1) '�o��
        ActiveWorkbook.ActiveSheet.Cells(i + START_ROW, END_COL) = strSplit(2) '�ދ�
        i = i + 1
    Loop
    Close #1 '�t�@�C�������
End Sub
