Public Class fksmGridView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Dim atLeastOneRowDeleted As Boolean
        For Each row As GridViewRow In GridView1.Rows
            Dim cb As WebControls.CheckBox = CType(row.FindControl("ckbxSesector"), WebControls.CheckBox)
            If Not cb Is Nothing And cb.Checked Then
                atLeastOneRowDeleted = True
                Dim name As String = Convert.ToString(GridView1.DataKeys(row.RowIndex).Value)
                lblResult.Text += String.Format("This would have deleted Name {0}<br />", name)
            End If
            lblResult.Visible = atLeastOneRowDeleted
        Next
    End Sub
End Class