<%@ Page Title="" Language="C#" MasterPageFile="~/WebParser.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebParser.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .overlay {
            position: fixed;
            z-index: 98;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            background-color: transparent;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .overlayContent {
            z-index: 99;
            margin: 250px auto;
            /*width: 80px;
            height: 80px;*/
        }

            .overlayContent h2 {
                font-size: 18px;
                font-weight: bold;
                color: #000;
            }

            /*.overlayContent img {
                width: 80px;
                height: 80px;
            }*/
    </style>
    <asp:UpdatePanel ID="updtlog" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="dvNewScan" CssClass="panel" HorizontalAlign="Center"  runat="server">

                <fieldset style="width: 44%;vertical-align:middle" >
                    <legend>Log in Form</legend>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label CssClass="label" ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="txtBox" Width="150px" ID="UserName" /><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" CssClass="label"  runat="server" AssociatedControlID="Password">Password</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="txtBox" Width="150px" ID="Password" TextMode="Password" /><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" Display="Dynamic" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">

                                      <asp:Button ID="Button1" CssClass="button" runat="server" OnClick="login_Click" Text="Log in" />
                                </td>
                            </tr>
                       
                            <tr >
                                <td >
                                      <asp:Label ID="lblErrorMessage" Font-Bold="true" Font-Size="Large" Visible="false" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div>
                    </div>

                  
                </fieldset>
            </asp:Panel>

          

           

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="updProgress"
        AssociatedUpdatePanelID="updtlog"
        runat="server">
        <ProgressTemplate>
            <div class="overlay" />
            <div class="overlayContent">
                <img ID="Image1" runat="server"  src="~/Images/ImgLoader.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
