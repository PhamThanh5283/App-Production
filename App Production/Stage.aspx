<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Stage.aspx.cs" Inherits="App_Production.Stage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%=GridView1.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
        <script>
            function getValue(radio) {
                $('#<%=TextBox1.ClientID %>').focus();
                $('#<%=Label4.ClientID %>').text("OUT");

            }
            function getValue1(radio) {
                $('#<%=TextBox1.ClientID %>').focus();
                $('#<%=Label4.ClientID %>').text("IN");
            }
        </script>
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3><b>Employee Information</b></h3>
                                 </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/download.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row" >
                            <div class="col-md-11">
                                <center>
                                    <span class="badge badge-pill badge-info"><b>Scan Employees ID</b></span>
                                </center>
                            </div>
                            <div class="col-md-4">
                                <label><b>User ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" Width="100" runat="server" placeholder="ID" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b>Employee Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-11">
                                <center>
                                    <span class="badge badge-pill badge-info"><b>Filter Function</b></span>
                                </center>
                            </div>
                            <div class="col-md-4">
                                <label><b>Floor</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" DataTextField="column1" DataValueField="column1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Line</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList2" Width="150" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Team leader</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList3" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" >
                            <div class="col-md-4">
                                <label><b>Stage Code</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Dept</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList6" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Stage Name</b></label>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList5" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Btn_update" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Btn_update_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Btn_cancel" class="btn btn-lg btn-block btn-danger" runat="server" Text="Cancel" OnClick="Btn_cancel_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                    <div class="card-body">
                                        <center>
                                            <h4><b>List of steps</b></h4>
                                        </center>
                                    </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="card text-white bg-info mb-3">
                                <div class="card-body">
                                    <center>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" id="customRadioInline1" name="customRadioInline1" checked onchange="getValue1(this)"  value="IN" class="custom-control-input">
                                            <label class="custom-control-label" for="customRadioInline1"><b>Check in</b></label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" id="customRadioInline2" name="customRadioInline1" onchange="getValue(this)" value="OUT" class="custom-control-input">
                                            <label class="custom-control-label" for="customRadioInline2"><b>Check out</b></label>
                                        </div>
                                    &emsp;&emsp;&emsp;&emsp;
                                        <b><asp:Label ID="Label1" runat="server" Text="Stage Selected:"></asp:Label></b>
                                        <b><asp:Label ID="Label2" runat="server" ForeColor="Yellow" ></asp:Label></b>
                                    &emsp;&emsp;&emsp;&emsp;
                                        <b><asp:Label ID="Label3" runat="server" Text="Check Selected:"></asp:Label></b>
                                        <b><asp:Label ID="Label4" runat="server" ForeColor="Yellow" ></asp:Label></b>
                                    &emsp;&emsp;&emsp;&emsp;
                                        <b><asp:Label ID="Label5" runat="server" ForeColor="Yellow" Text="Selected" Visible="False"></asp:Label></b>
                                    </center>
                                </div>
                             </div>
                        </div>
                    </div>
                     </div>
                    <div class="row-1">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row-1">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' ProviderName='<%$ ConnectionStrings:con.ProviderName %>' SelectCommand="SELECT * FROM [Stage_table]"></asp:SqlDataSource>
                        <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1"  runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <SelectedRowStyle BackColor="#FF0066" ForeColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:CommandField>
                                    <asp:BoundField DataField="_Date" HeaderText="_Date" SortExpression="_Date" Visible="False" />
                                    <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" Visible="False">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="_Floor" HeaderText="Floor" SortExpression="_Floor">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Teamleader_ID" Visible ="false" HeaderText="Teamleader_ID" SortExpression="Teamleader_ID" >
                                    <ItemStyle Font-Bold="True" Font-Italic="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Teamleader_Name" HeaderText="Teamleader Name" SortExpression="Teamleader_Name">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Area" HeaderText="Line" SortExpression="Area">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Stage_code" HeaderText="Stage Code" SortExpression="Stage_code">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Stage_name" HeaderText="Stage Name" SortExpression="Stage_name">
                                        <ItemStyle Font-Bold="True" Font-Italic="True"></ItemStyle>
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
                        </div>
                    </div>
             </div>
        </div>
    </div>
    <div class="row-1">
        <div class="col">
            <hr>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-5">
            <div class="col-md-14">
                <div class="card">
                    <div class="card-body">
                        <div style="width: 100%; height: 200px; overflow: scroll">
                            <asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="_Date" HeaderText="Date" SortExpression="_Date" DataFormatString="{0:d}">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="In" HeaderText="In" SortExpression="In">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Out" HeaderText="Out" SortExpression="Out">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Work Center" HeaderText="Work Center" SortExpression="Work Center">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="User ID" HeaderText="User ID" SortExpression="User ID">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenNV" HeaderText="T&#234;n NV" SortExpression="TenNV">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Stage_code" HeaderText="Stage Code" SortExpression="Stage_code">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Stage_name" HeaderText="Stage Name" SortExpression="Stage_name">
                                        <ItemStyle Font-Bold="True"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black"></FooterStyle>

                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

                                <RowStyle BackColor="#EEEEEE" ForeColor="Black"></RowStyle>

                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * from V_Stage Order by [In] DESC"></asp:SqlDataSource>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
