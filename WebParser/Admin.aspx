<%@ Page Title="" Language="C#" MasterPageFile="~/WebParser.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebParser.Admin" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" HorizontalAlign="Center">
        <fieldset style="width: 64%; vertical-align: middle">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" CssClass="label" Text="Select Scan" runat="server"></asp:Label>
                    </td>
                    <td>
                         <asp:DropDownList ID="drpScanList" runat="server" Height="25px" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td style="margin-left:5px">
                        <asp:Label ID="Label2" CssClass="label" Text="Select Option"  runat="server"></asp:Label>
                    </td>
                    <td>
                         <asp:DropDownList ID="drpOptionList" Width="250" runat="server" AutoPostBack="true" Height="25px" OnSelectedIndexChanged="drpOptionList_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Text="Generate “New Plugin Data – Regular Scan" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Generate New Plugin Data – Compliance Scan" Value="2"></asp:ListItem>
                            <asp:ListItem Text="PluginOutput Variance Report-1 – Regular Scan" Value="3"></asp:ListItem>
                            <asp:ListItem Text="PluginOutput Variance Report-2 – Compliance Scan" Value="4"></asp:ListItem>
                            <asp:ListItem Text="New Plugin Data - Regular Scan file" Value="5"></asp:ListItem>
                            <asp:ListItem Text="New Plugin Data - Compliance Scan file" Value="6"></asp:ListItem>
                            <asp:ListItem Text="PluginOutput Variance Report-1”" Value="7"></asp:ListItem>
                            <asp:ListItem Text="PluginOutput Variance Report-2" Value="8"></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr >
                    <td colspan="4" >
                        <asp:Panel Visible="false" ID="pnlUpload" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUploadNewXmlFIle" CssClass="label" Text="Upload Excel" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <ajaxToolkit:AsyncFileUpload ID="fileUpload1" runat="server" Height="30pt" />
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>
                    </td>

                </tr>
                <tr>
                    <td style="float: left; margin-left: 14%" colspan="4">
                        <asp:Button ID="btnGenerateExcel" Visible="true" Text="Generate" runat="server" OnClick="btnGenerateExcel_Click" />
                        <asp:Button ID="btnUpload" Text="Upload" Visible="false" runat="server" OnClick="btnUpload_Click" />
                    </td>
                   
                </tr>

                <tr>
                    <td style="float: right; margin-top: 10px" colspan="4">
                        <asp:Label Text="No records" runat="server" Font-Bold="true" Font-Size="Large" Visible="false" ID="lblNoRecords"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>


    </asp:Panel>
</asp:Content>
