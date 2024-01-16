<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Pickers.aspx.cs" Inherits="App_Production.Pickers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [User_checked]"></asp:SqlDataSource>
                            <div class="col">
                                <center> 
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="_Date" HeaderText="Date" SortExpression="_Date" DataFormatString="{0:dd/MM/yyyy}">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="_In" HeaderText="In" SortExpression="_In">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="_Out" HeaderText="Out" SortExpression="_Out">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Teamleader_ID" HeaderText="Teamleader_ID" SortExpression="Teamleader_ID">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="_User_ID" HeaderText="User_ID" SortExpression="_User_ID">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="_Floor" HeaderText="Floor" SortExpression="_Floor">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Stage_code" HeaderText="Stage_code" SortExpression="Stage_code">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

                                        <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                                        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                                        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                                        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                                    </asp:GridView>    
                                </center>
                            </div>
                        </div>
                     </div>
                 </div>
             </div>
        </div>
    </div>

</asp:Content>
