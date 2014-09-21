<%@ Page Title="" Language="C#" MasterPageFile="~/WebParser.Master" AutoEventWireup="true" CodeBehind="ScanLoad.aspx.cs" Inherits="WebParser.ScanLoad" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        input[type="file"] {
            position: relative;
            text-align: right;
            -moz-opacity: 0;
            filter: alpha(opacity: 0);
            opacity: 0;
            z-index: 2;
        }
    </style>
    <script type="text/javascript">
        function gridRowOnclick(ctrlId) {

            var retVal = confirm("Do you want to continue ?");
            if (retVal == true) {
                __doPostBack(ctrlId, 'FROMBTN')
               
                return true;
            } else {
                return false;
            }
        }

    </script>
    <%-- <asp:UpdatePanel ID="updtMaster" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
        </Triggers>
        <ContentTemplate>--%>
    <asp:Panel runat="server" HorizontalAlign="Center">
        <div>
            <fieldset style="width: 44%; vertical-align: middle; margin-top: 20px">
                <legend>Scan documents</legend>
                <table border="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server">New Scan</asp:Label>
                            <asp:RadioButton ID="RadioButton1" runat="server" OnCheckedChanged="NewScan_CheckedChanged" AutoPostBack="true" Checked="true" GroupName="scanGroup" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server">Additional Scan</asp:Label>
                            <asp:RadioButton runat="server" ID="rdbtnAddtional" AutoPostBack="true" OnCheckedChanged="AddtionalScan_CheckedChanged" GroupName="scanGroup" />
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="dvNewScan" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClientName" CssClass="label" Text="Client Name" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientName" CssClass="txtBox" Width="200px" runat="server" /><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="txtClientName" CssClass="field-validation-error" ErrorMessage="The client name field is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblScanName" CssClass="label" Text="Scan Name" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewScanName" CssClass="txtBox" Width="200px" runat="server" /><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="txtNewScanName" CssClass="field-validation-error" ErrorMessage="The scan name field is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblScanDate" CssClass="label" Text="Scan Date" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" CssClass="txtBox" Width="200px" runat="server" />
                                <ajaxToolkit:CalendarExtender ID="Calendar1" PopupButtonID="txtDate" runat="server" TargetControlID="txtDate" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="txtDate" CssClass="field-validation-error" ErrorMessage="The scan date field is required." />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server"
                                        ControlToValidate="txtDate" ValidationExpression="(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Invalid date"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUploadNewXmlFIle" CssClass="label" Text="Select file to upload" runat="server"></asp:Label>
                            </td>
                            <td>
                                <ajaxToolkit:AsyncFileUpload OnUploadedFileError="fileUpload1_UploadedFileError" ID="fileUpload1" Width="280px" runat="server" />
                                <br />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="txtDate" CssClass="field-validation-error" ErrorMessage="The scan date field is required." />--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="btnsave_Click"
                                    Style="width: 85px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblmessage" Font-Bold="true" Font-Size="Large" runat="server" />
                            </td>
                        </tr>

                    </table>

                </asp:Panel>
            </fieldset>
        </div>
        <asp:Panel ID="pnlMessage" Visible="false" runat="server">
            <fieldset style="width: 44%; vertical-align: middle; margin-top: 20px">
                <legend></legend>
                <table border="0">

                    <tr>
                        <td>
                            <asp:Label ID="Label3" CssClass="label" Text="Status 1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNewPlugins" CssClass="label" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPluginMessage" CssClass="label" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" CssClass="label" Text="Status 2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNewCompaliance" CssClass="label" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblComplianceMessage" CssClass="label" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" CssClass="label" Text="Status 3" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNewVariance" CssClass="label" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblVarianceMessage" CssClass="label" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </asp:Panel>



        <asp:Panel Visible="false" ID="dvAdditionalScan" runat="server">
            <fieldset style="width: 44%; vertical-align: middle; margin-top: 20px">
                <legend></legend>
                <asp:GridView runat="server" GridLines="Vertical" ID="grdScanList" OnRowCommand="grdScanList_RowCommand" CssClass="Grid" OnRowDataBound="grdScanList_RowDataBound"
                    OnRowEditing="grdScanList_RowEditing" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField HeaderText="Scan Id" DataField="ScanID" />
                        <asp:BoundField HeaderText="Scan Name" DataField="ScanName" />
                        <asp:BoundField HeaderText="Scan Date" DataField="ScanDate" />
                        <asp:BoundField HeaderText="Client Name" DataField="ClientName" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="deleteButton" CommandArgument='<%# Eval("ScanID") %>'  CommandName="Edit" runat="server" Text="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                  
                </asp:GridView>
            </fieldset>
        </asp:Panel>




    </asp:Panel>

    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>

    <%--    <asp:UpdateProgress ID="updProgress"
        AssociatedUpdatePanelID="updtMaster"
        runat="server">
        <ProgressTemplate>
            <div class="overlay" />
            <div class="overlayContent">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ImgLoader.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
</asp:Content>
