using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebParser.DAL.DataFunction;
using WebParser.DAL.Model;

namespace WebParser
{
    public partial class ScanLoad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

            }
            else
            {
                if (Page.Request.Form["__EVENTARGUMENT"] == "FROMBTN")
                {
                    PerformCustomAction();
                }

            }

            if (Session["IsAdmin"] != null)
            {
                Menu mnuControl = this.Master.FindControl("menuMaster") as Menu;
                if (!((bool)Session["IsAdmin"]))
                {
                    mnuControl.Items[0].Enabled = false;
                    mnuControl.Items[3].Enabled = false;
                }
                else
                {
                    mnuControl.Items[0].Enabled = true;
                    mnuControl.Items[3].Enabled = true;
                }

            }


            (this.Master.FindControl("lblLoginName") as Label).Text = Session["UserName"] as string;
            (this.Master.FindControl("hypLogOut") as HyperLink).Visible = true;
        }


        private void PerformCustomAction()
        {
            dvAdditionalScan.Visible = false;
            dvNewScan.Visible = true;
            var obj = new OperationFunctions();
            var dtoItem = obj.GetsScanResultByScanId(Session["UserName"] as string, int.Parse(((System.Web.UI.WebControls.TableRow)(grdScanList.SelectedRow)).Cells[0].Text));
            if (dtoItem.Count > 0)
            {
                txtClientName.Text = dtoItem.First().ClientName;
                txtNewScanName.Text = dtoItem.First().ScanName;
                Session["ScanId"] = dtoItem.First().ScanID;
                Session["SubscanId"] = dtoItem.First().SubScanID;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            XDocument myDoc = XDocument.Load(fileUpload1.FileContent);

            XNamespace cm = myDoc.Descendants("Report").First().Attributes().ElementAt(1).Value;
            var dtl = (from r in myDoc.Descendants("ReportItem")
                       select new ImportXMLDataDTO()
                       {
                           ReportHost = r.Parent.Attribute("name").Value,
                           ClientName = txtClientName.Text,
                           ScanDate = DateTime.Parse(txtDate.Text),
                           ScanName = txtNewScanName.Text,
                           IsAdditionalScan = rdbtnAddtional.Checked,
                           ScanId = Session["ScanId"] != null ? Convert.ToInt32(Session["ScanId"]) : 0,
                           SubScanId = Session["SubscanId"] != null ? Convert.ToInt32(Session["SubscanId"]) : 0,
                           UserId = Session["UserName"] as string,
                           PlugId = r.Attribute("pluginID").Value,
                           Port = r.Attribute("port") == null ? null : r.Attribute("port").Value,
                           Compliance = r.Element("compliance") == null ? null : r.Element("compliance").Value,
                           ComplianceResult = r.Element(cm + "compliance-result") == null ? null : r.Element(cm + "compliance-result").Value,
                           ComplianceActualValue = r.Element(cm + "compliance-actual-value") == null ? null : r.Element(cm + "compliance-actual-value").Value,
                           ComplianceCheckID = r.Element(cm + "compliance-check-id") == null ? null : r.Element(cm + "compliance-check-id").Value,
                           ComplianceOutPut = r.Element(cm + "compliance-output") == null ? null : r.Element(cm + "compliance-output").Value,
                           CompliancePolicyValue = r.Element(cm + "compliance-policy-value") == null ? null : r.Element(cm + "compliance-policy-value").Value,
                           Description = r.Element("description") == null ? null : r.Element("description").Value,
                           ExploitAvailable = r.Element("exploit_available") == null ? null : r.Element("exploit_available").Value,
                           ExploitabilityEase = r.Element("exploitability_ease") == null ? null : r.Element("exploitability_ease").Value,
                           ExploitedByMalware = r.Element("exploited_by_malware") == null ? null : r.Element("exploited_by_malware").Value,
                           RiskFactor = r.Element("risk_factor") == null ? null : r.Element("risk_factor").Value,
                           SeeLAlso = r.Element("see_also") == null ? null : r.Element("see_also").Value,
                           Solution = r.Element("solution") == null ? null : r.Element("solution").Value,
                           Synopsis = r.Element("synopsis") == null ? null : r.Element("synopsis").Value,
                           PluginOutput = r.Element("plugin_output") == null ? null : r.Element("plugin_output").Value,
                           ComplianceCheckName = r.Element(cm + "cmcompliance-check-name") == null ? null : r.Element(cm + "cmcompliance-check-name").Value,
                           Complianceinfo = r.Element(cm + "compliance-info") == null ? null : r.Element(cm + "compliance-info").Value,
                           ComplianceSeeAlso = r.Element(cm + "compliance-see-also") == null ? null : r.Element(cm + "compliance-see-also").Value,
                           ComplianceSolution = r.Element(cm + "compliance-solution") == null ? null : r.Element(cm + "compliance-solution").Value,
                       }).ToList();

            var obj = new OperationFunctions();
            try
            {
                ReturnResultDTO retValue = obj.ImportXmlData(dtl);
                if (retValue.IsSuccess)
                {
                    txtNewScanName.Text = string.Empty;
                    txtDate.Text = string.Empty;
                    txtClientName.Text = string.Empty;

                    lblmessage.Visible = true;
                    lblmessage.Text = "Upload successfull.";
                    lblComplianceMessage.Text = retValue.NewComplianceMessage;
                    lblNewCompaliance.Text = retValue.NewComplianceCount.ToString();
                    lblNewPlugins.Text = retValue.NewPluginCount.ToString();
                    lblPluginMessage.Text = retValue.NewPluginMessage;
                    lblNewVariance.Text = retValue.NewVarianceCount.ToString();
                    lblVarianceMessage.Text = retValue.NewVarianceMessage;

                    pnlMessage.Visible = true;
                    RadioButton1.Checked = true;
                }
                else
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "Import failed.";
                    RadioButton1.Checked = true;
                }
            }
            catch (Exception ex)
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Import failed.";
                //throw;
            }


        }

        public List<ScanMasterDTO> GetRecords()
        {
            List<ScanMasterDTO> scanMasters = new List<ScanMasterDTO>();
            var obj = new OperationFunctions();
            scanMasters = obj.GetPreviousScanResult(HttpContext.Current.Session["UserName"] as string);
            grdScanList.DataSource = scanMasters;
            grdScanList.DataBind();
            return null;
        }

        protected void NewScan_CheckedChanged(object sender, EventArgs e)
        {
            dvAdditionalScan.Visible = false;
            dvNewScan.Visible = true;
            lblmessage.Visible = false;
        }

        protected void AddtionalScan_CheckedChanged(object sender, EventArgs e)
        {
            dvAdditionalScan.Visible = true;
            dvNewScan.Visible = false;
            pnlMessage.Visible = false;
            GetRecords();
        }

        protected void grdScanList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdScanList.SelectedIndex = e.NewEditIndex;
            PerformCustomAction();
        }

        protected void grdScanList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button l = (Button)e.Row.FindControl("deleteButton");
                l.Attributes.Add("onclick", "javascript:return " + " confirm('Are you sure you want to continue ? ')");
            }
        }

        protected void fileUpload1_UploadedFileError(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            lblmessage.Text = "Import file size is oversized.";
        }
             

    }
}