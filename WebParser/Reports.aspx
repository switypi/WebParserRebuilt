<%@ Page Title="" Language="C#" MasterPageFile="~/WebParser.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="WebParser.Reports" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updtlog" runat="server" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGenerateExcel" />
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                <fieldset style="width: 64%; vertical-align: middle">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" Text="Select Scan" runat="server"></asp:Label><br />

                            </td>
                            <td>
                                <asp:DropDownList ID="drpScanList" Width="150px" runat="server"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label2" Text="Select Option" runat="server"></asp:Label><br />

                            </td>
                            <td>
                                <asp:DropDownList ID="drpOptionList" OnSelectedIndexChanged="drpOptionList_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                    <asp:ListItem Selected="True" Text="Generate Regular Scan Report" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Generate Compliance Scan Report" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Generate Vulnerabilities Not Reported List" Value="3"></asp:ListItem>

                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div style="margin-left:80px;margin-top:10px">
                                    <asp:Button ID="btnGenerateExcel" Visible="true" Text="Generate" runat="server" OnClick="btnGenerateExcel_Click" />
                                </div>
                            </td>

                        </tr>

                    </table>
                </fieldset>
            </asp:Panel>
            <asp:Label Text="No records" runat="server" Font-Bold="true" Font-Size="Large" Visible="false" ID="lblNoRecords"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
