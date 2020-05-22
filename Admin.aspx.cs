using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DeleteUser(object sender, EventArgs e)
    {
        int id = int.Parse(Request["IdBox"]);
        string db = "Database.mdb";
        MyAdoHelperAccess.ConnectToDb(db);
        string sql = "delete from tbl_users where id = " + int.Parse(Request["IdBox"]) + ";";
        MyAdoHelperAccess.DoQuery(db, "delete from tbl_users where id = " + int.Parse(Request["IdBox"]) + ";");
    }
}