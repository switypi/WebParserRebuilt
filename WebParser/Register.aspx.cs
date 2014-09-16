﻿using System;
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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            LoginDTO item = new LoginDTO();
            item.Password = Password.Text;
            item.UserId = UserName.Text;
            item.IsAdmin = chktnAdmin.Checked;
            var connector = new LoginFunctions();
            var obj = connector.DoRegister(item);
            if (obj == null)
            {
                lblMessage.Text = "User Id already exist.Please try with different user name.";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Loged In.";
                lblMessage.Visible = true;
                FormsAuthentication.SetAuthCookie(UserName.Text, createPersistentCookie: false);

                //Label lbl = this.Master.FindControl("lblLoginName") as Label;
                //lbl.Text = obj.UserId;
                //HyperLink link = this.Master.FindControl("hypLogOut") as HyperLink;
                //HyperLink scnLink = this.Master.FindControl("hypScn") as HyperLink;
                //link.Text = obj.UserId;

                //lbl.Visible = true;
                //link.Visible = true;

                if (obj.IsAdmin)
                {
                    Session["IsAdmin"] = true;
                    Response.Redirect("~/Admin.aspx");
                }
                else
                {
                    Session["IsAdmin"] = false;
                    Response.Redirect("~/ScanLoad.aspx");
                }

            }
        }
    }
}