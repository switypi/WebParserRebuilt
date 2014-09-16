using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebParser.DAL.DataFunction;
using WebParser.DAL.Model;

namespace WebParser
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu mnuControl = this.Master.FindControl("menuMaster") as Menu;
            mnuControl.Enabled = false;
            
        }
        protected void login_Click(object sender, EventArgs e)
        {
            LoginDTO item = new LoginDTO();
            item.UserId = UserName.Text;
            item.Password = Password.Text;
            var connection = new LoginFunctions();
            var obj = connection.DoLogin(item.UserId, item.Password);
            if (obj == null)
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Login failed.";
            }
            else
            {
                Session["UserName"] = obj.UserId;
                FormsAuthentication.SetAuthCookie(item.UserId, createPersistentCookie: false);

                if (!obj.IsAdmin)
                {
                    Session["IsAdmin"] = false;
                 

                    Response.Redirect("~/ScanLoad.aspx");
                    //FormsAuthentication.RedirectFromLoginPage(obj.UserId, false);
                }
                else
                {
                    Session["IsAdmin"] = true;
                    Response.Redirect("~/Admin.aspx");
                }

            }
        }
    }
}