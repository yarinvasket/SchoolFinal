using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Disabled : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string uname = (string)Session["username"];
            string password = (string)Session["password"];
            string db = "Database.mdb";

            string sql = "select * from tbl_users where uname='" + uname + "' and upass='" + password + "';";
            bool selected = Request["accessibility"] == "on";

            if (MyAdoHelperAccess.IsExist(db, sql))
            {
                string query = "update tbl_users\nset accessibility = " + selected + "\nwhere uname = '" + uname + "';";
                MyAdoHelperAccess.DoQuery(db, query);
            }

            Response.Redirect("index.aspx");
        }
    }
}