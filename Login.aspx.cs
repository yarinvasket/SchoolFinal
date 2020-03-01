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
            string sql = "select * from tbl_users";
            string str = MyAdoHelperAccess.printDataTable(db, sql);
            Response.Redirect("https://lol.com");
        }
    }
}