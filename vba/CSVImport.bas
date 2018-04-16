Attribute VB_Name = "Module1"
Option Explicit
Const START_ROW As Integer = 7
Const END_ROW As Integer = 37
Const START_COL As Integer = 3
Const END_COL As Integer = 4


Sub 取り込み()
    Dim varFileName As Variant
    Dim intFree As Integer
    Dim strRec As String
    Dim strSplit() As String
    Dim i As Long, j As Long, k As Long
    Dim strCell As String
    
    
    varFileName = Application.GetOpenFilename(FileFilter:="CSVファイル(*.csv), *.csv", Title:="CSVファイル取り込み選択")
    If varFileName = False Then
        Exit Sub
    End If
    
    Open varFileName For Input As #1 'CSVファイルオープン
    
    i = 0
    'ファイルの終わりまで繰り返す
    Do Until EOF(1)
        Line Input #1, strRec '1行読み込み
        '一行目は飛ばしたい
        
        strSplit = Split(strRec, ",")
        ActiveWorkbook.ActiveSheet.Cells(i + START_ROW, START_COL) = strSplit(1) '出勤
        ActiveWorkbook.ActiveSheet.Cells(i + START_ROW, END_COL) = strSplit(2) '退勤
        i = i + 1
    Loop
    Close #1 'ファイルを閉じる
End Sub
