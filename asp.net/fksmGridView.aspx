<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fksmGridView.aspx.vb" Inherits="SelfAspNet.fksmGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="名前" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:TemplateField HeaderText="選択">
                    <ItemTemplate>
                        <asp:CheckBox ID="ckbxSesector" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="名前" HeaderText="名前" ReadOnly="True" SortExpression="名前" />
                <asp:BoundField DataField="男性/女性" HeaderText="男性/女性" SortExpression="男性/女性" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SelfAspNet.fksmDataSetTableAdapters.fksmTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_名前" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="名前" Type="String" />
                <asp:Parameter Name="p1" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="p1" Type="String" />
                <asp:Parameter Name="Original_名前" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="btnDelete" runat="server" Text="削除" />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
