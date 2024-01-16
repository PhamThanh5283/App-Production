<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Initialize.aspx.cs" Inherits="App_Production.Initialize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row-1">
            <center>
                <h3 style="color:Tomato;"><b>Manufacturing Inputs</b></h3>
            </center>
        </div>
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md">
                    <div class="card">
                        <div class="card-body">
                            <center><h4 style="color:blue;"><b>Input Production Area</b></h4></center>
                            <div class="row">
                                <div class="col-md-2">
                                    <label><b style="color: #FF0000">ID:</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Txt_ID" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <label><b style="color: #FF0000">User Name:</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Txt_name" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                        </div>
                                    </div>                                      
                                </div>
                                <div class="col-md-2">
                                    <label><b style="color: #FF0000">Work Center:</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Txt_Workcenter" Font-Bold="true" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label><b style="color: #FF0000">Position:</b></label>
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="Txt_Position" Font-Bold="true" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="input-group">
                                                    <asp:Button ID="BtnUpdate" CssClass="btn btn-success btn-lg" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
                                                </div>
                                            </div>
                                            <div class="col-md">
                                                <div class="input-group">
                                                    <asp:Button ID="BtnDel" CssClass="btn btn-danger btn-lg" runat="server" Text="Delete" OnClick="BtnDel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <label><b style="color: #FF0000">Or Upload File:</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:FileUpload class="btn btn-outline-primary" ID="FileUpload1" Width="250" runat="server"></asp:FileUpload>   
                                        </div>
                                        <div class="input-group">
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <br />
                                        <div class="input-group">
                                            <a href="Templete/Area.xlsx" download="Area.xlsx"><b><u>Download Templete here!</u></b></a>
                                        </div>
                                        <br />
                                            <div class="input-group">
                                                <asp:Button ID="btnUpload" class="btn btn-lg btn-block btn-success" Width="250" runat="server" Text="Update Excel File" OnClick="btnUpload_Click" /> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [MF_Area]"></asp:SqlDataSource>
                                    <div class="row">
                                        <div style="width: 100%; height: 250px; overflow: scroll">
                                            <asp:GridView ID="GridView1" class="table table-striped table-bordered" DataSourceID="SqlDataSource1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                                <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black"></FooterStyle>

                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999"></PagerStyle>

                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black"></RowStyle>

                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                                <SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>

                                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                                <SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                         <h4 style="color:blue"><b>Input Production Process Data</b></h4>
                                     </center>
                                     <div class="row">
                                        <div class="col-md-2">
                                            <label><b style="color: #FF0000">StgID:</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox CssClass="form-control" ID="TxtStgCode" Font-Bold="true" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <label><b style="color: #FF0000">Name of Stage:</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox CssClass="form-control" ID="TxtStgName" Font-Bold="true" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <label><b style="color: #FF0000">Cost of Stage:</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox CssClass="form-control" ID="TxtStgCost" Font-Bold="true" runat="server" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <label><b style="color: #FF0000">Type:</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox CssClass="form-control" ID="TxtType" Font-Bold="true" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label><b style="color: #FF0000">Or Upload File:</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:FileUpload ID="FileUpload2" class="btn btn-outline-primary" runat="server" />
                                                </div>
                                            </div>
                                            <br />
                                            <div class="input-group">
                                                <a href="Templete/MF Stage.xlsx" download="MF Stage.xlsx"><b><u>Download Templete here!</u></b></a>
                                            </div>
                                            <br />
                                            <asp:Button ID="BtnUpload2" Class="btn btn-primary btn-lg" runat="server" Text="Update Excel File" OnClick="BtnUpload2_Click" />
                                        </div>
                                        <div class="col-md">
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [MF_Stage]"></asp:SqlDataSource>
                                            <div class="row">
                                                <div style="width: 100%; height: 250px; overflow: scroll">
                                                    <asp:GridView ID="GridView2" class="table table-striped table-bordered" DataSourceID="SqlDataSource2" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                                        </Columns>

                                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

                                                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                                                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                                                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                                                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                                                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                                                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
