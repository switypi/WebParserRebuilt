using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebParser
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Exception caughtException = Server.GetLastError();
            errorBox.Text = caughtException.InnerException.StackTrace;
            lblErrorMsg.Text = caughtException.Message;
        }
    }
}