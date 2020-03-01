﻿using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Collections.Generic;

/// <summary>
/// Summary description for MyAdoHelper
/// פעולות עזר לשימוש במסד נתונים מסוג אקסס
///  App_Data המסד ממוקם בתקיה 
/// </summary>

public class MyAdoHelperAccess
{
    static string fileName = "Database.mdb";
    public MyAdoHelperAccess()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static OleDbConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("App_Data/");//מיקום מסד בפורוייקט
        path += fileName;
       
        //string connString = "Provider=Microsoft.ace.OLEDB.12.0;Data source=" + path + ";Persist Security Info=True";//נתוני ההתחברות הכוללים מיקום וסוג המסד
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data source=" + path + ";Persist Security Info=True";//נתוני ההתחברות הכוללים מיקום וסוג המסד
        OleDbConnection conn = new OleDbConnection(connString);
        return conn;
    }


    public static int DoQuery(string fileName, string sql)//הפעולה מקבלת שם מסד נתונים ומחרוזת מחיקה/ הוספה/ עדכון
    //ומבצעת את הפקודה על המסד הפיזי
    {
        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        int rowResults = com.ExecuteNonQuery();
        com.Dispose();
        conn.Close();
        return rowResults;

    }


    /// <summary>
    /// To Execute update / insert / delete queries
    ///  הפעולה מקבלת שם קובץ ומשפט לביצוע ומחזירה את מספר השורות שהושפעו מביצוע הפעולה
    /// </summary>
    public int RowsAffected(string fileName, string sql)//הפעולה מקבלת מסלול מסד נתונים ופקודת עדכון
    //ומבצעת את הפקודה על המסד הפיזי
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ ומשפט לחיפוש ערך - מחזירה אמת אם הערך נמצא ושקר אחרת
    /// </summary>
    public static bool IsExist(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        OleDbDataReader data = com.ExecuteReader();
        bool found;
        found = (bool)data.Read();// אם יש נתונים לקריאה יושם אמת אחרת שקר - הערך קיים במסד הנתונים
        conn.Close();
        return found;

    }
    //רועי

    public static DataTable ExecuteDataTable(string fileName, string sql)
    {
        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbDataAdapter tableAdapter = new OleDbDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);
        conn.Close();
        return dt;
    }



    public void ExecuteNonQuery(string fileName, string sql)
    {
        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand command = new OleDbCommand(sql, conn);
        command.ExecuteNonQuery();
        conn.Close();
    }


    public static string printDataTable(DataTable dt)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {
        string printStr = "<table border='1'>";
        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";
        return printStr;
    }

    public static string printDataTable(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {

        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {

                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }

    public static string printDataTableWithDelete(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {

        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            if (row["uname"].ToString() != "admin") //לא למחוק מנהל
            {
                printStr += "<tr>";
                foreach (object myItemArray in row.ItemArray)
                {

                    printStr += "<td>" + myItemArray.ToString() + "</td>";
                }

                printStr += "<td><form method='post' onsubmit='return confirm(\"delete " + row["id"] + " ?\")' action='managerDelete.aspx'>";
                printStr += "<input type='hidden' id='hdnId' name='hdnId' value='" + row["id"] + "'/>";
                printStr += "<input type='submit' value='delete' /></td></form>";

                printStr += "</tr>";
            }
        }
        printStr += "</table>";

        return printStr;
    }

    public static string printDataTable(string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {

        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {

                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }
    //SpGetAllCities
    public static string printDataTable2(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {


        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {

                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }

    public static string getAllUsers(string fileName, string sql)
    {

        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<select dir='rtl' id='users' name='users'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<option value='" + row[0].ToString() + "'>" + row[0].ToString() + "</option>";
        }
        printStr += "</select>";

        return printStr;
    }
}
