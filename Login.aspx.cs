using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string db = "Database.mdb";
            MyAdoHelperAccess.ConnectToDb(db);
            string uname = Request["username"];
            string password = Request["password"];
            string sql = "select * from tbl_users where uname='" + uname + "' and upass='" + password + "';";
            if (uname == "admin" && MyAdoHelperAccess.IsExist(db, sql))
            {
                Session["username"] = uname;
                Session["password"] = password;
                Response.Redirect("Admin.aspx");
            }
            else if (MyAdoHelperAccess.IsExist(db, sql))
            {
                Session["username"] = uname;
                Session["password"] = password;
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Write("Incorrect user name or password.");
            }
        }
    }
}