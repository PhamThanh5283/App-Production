<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Usersignup.aspx.cs" Inherits="App_Production.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div calss="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/login.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b style="color: #FF0000">User ID (MSNV)*</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b style="color: #FF0000">Full Name*</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b style="color: #FF0000">Dept*</b></label>
  
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b style="color: #FF0000">Email*</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Phone Number</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Phone Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b>Contact</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Contact"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b style="color: #FF0000">Password*</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Pasword" TextMode="Password"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-md-6">
                                <label><b style="color: #FF0000">Confirm Password*</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pasword" TextMode="Password"></asp:TextBox>
                                </div>
                             </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">

                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign up" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <a href="userlogin.aspx"><<< Back to Home page</a><br><br>
            </div>
        </div>
    </div>
    </b>
</asp:Content>