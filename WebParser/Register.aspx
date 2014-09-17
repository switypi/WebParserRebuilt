<%@ Page Title="" Language="C#" MasterPageFile="~/WebParser.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebParser.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updtReg" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="dvNewScan" CssClass="panel" HorizontalAlign="Center" runat="server">
                <fieldset style="width: 44%; vertical-align: middle">
                    <legend>Registration Form</legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" CssClass="label" runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" Width="150px" ID="UserName" />
                                <div>
                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="UserName" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{4,8}$" runat="server" ErrorMessage="Minimum 5 and Maximum 8 characters required."></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="UserName"
                                        CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" CssClass="label" runat="server" AssociatedControlID="Password">Password</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" Width="150px" ID="Password" TextMode="Password" />
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ControlToValidate="Password"
                                        CssClass="field-validation-error" ErrorMessage="The password field is required." />
                                    <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ControlToValidate="Password" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{4,8}$" runat="server" ErrorMessage="Minimum 5 and Maximum 8 characters required."></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" CssClass="label" runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" Width="150px" ID="ConfirmPassword" MaxLength="12" TextMode="Password" />
                                <div>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ControlToValidate="ConfirmPassword"
                                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" CssClass="label" runat="server">Is Admin</asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chktnAdmin" runat="server" />
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMessage" Font-Bold="true" Font-Size="Large" Visible="false" runat="server"></asp:Label>
                            </td>
                            
                        </tr>
                    </table>
                </fieldset>
            </asp:Panel>

            
            
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdateProgress ID="updProgress"
        AssociatedUpdatePanelID="updtReg" DisplayAfter="100"
        runat="server">
        <ProgressTemplate>
            <div class="overlay" />
            <div class="overlayContent">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ImgLoader.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>


</asp:Content>
