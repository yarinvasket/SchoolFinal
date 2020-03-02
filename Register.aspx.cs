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
            string firstname = Request["firstname"];
            string lastname = Request["lastname"];
            string uname = Request["username"];
            string password = Request["password"];
            string email = Request["email"];
            string gender = Request["gender"];
            string bday = Request["date"];
            string phoneNum = Request["number"];
            string sql = "select * from tbl_users where uname='" + uname + "';";
            if (!MyAdoHelperAccess.IsExist(db, sql))
            {
                MyAdoHelperAccess.DoQuery(db, "insert into tbl_users (uname, Fname, Lname, upass, email, bday, gender, cellNum, phoneNum) values ('" + uname + "', '" + firstname + "', '" + lastname + "', '" + password + "', '" + email + "', '" + bday + "', '" + gender + "', '" + phoneNum.Substring(0, 3) + "', '" + phoneNum.Substring(3) + "');");

                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("The user \"" + uname + "\" already exists.");
            }
        }
    }
}