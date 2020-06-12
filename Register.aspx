<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="PrintTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style type="text/css">

        body {
            font-family: "Lato", sans-serif;
        }

        .mobile-container {
            max-width: 1920px;
            margin: auto;
            background-color: #555;
            height: 1080px;
            color: black;
            border-radius: 10px;
            text-align: right;
        }

        .topnav {
            overflow: hidden;
            background-color: #333;
            position: relative;
            color: white;
        }

            .topnav #myLinks {
                display: none;
            }

            .topnav a {
                color: black;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
                display: block;
            }

                .topnav a.icon {
                    background: white;
                    display: block;
                    position: absolute;
                    right: 0;
                    top: 0;
                }

                .topnav a:hover {
                    background-color: #ddd;
                    color: white;
                }

        .active {
            background-color: #4CAF50;
            color: white;
            text-align: right;
            margin-right: 40px;
        }

        p.ex1 {
            margin-right: 15px;
            color: white;
        }

        h3.ex2 {
            margin-right: 15px;
            color: white;
            font-size: large;
        }

        td {
            text-align: left;
            color: white;
        }

        h1 {
            color: white;
        }

        #main {
            transition: margin-left .5s;
        }
    </style>
</head>
<body>
    <script type="text/javascript">

        function Reset() {
            document.getElementById("error").innerHTML = "";
            document.getElementById("firstname").style.backgroundColor = "white";
        }

        function ResetColor(id) {
            document.getElementById(id).style.backgroundColor = "white";
            document.getElementById("error").innerHTML = ""
        }

        function IsValid() {
            document.getElementById("error").innerHTML = "";
            var msg = true;
            if (document.getElementById("firstname").value == "") {

                document.getElementById("error").innerHTML += " יש להכניס את השם הפרטי</br>";
                document.getElementById("firstname").style.backgroundColor = "red";
                msg = false;
            }
            else if (document.getElementById("firstname").value.length < 2 || document.getElementById("firstname").value.length > 8) {
                document.getElementById("error").innerHTML += " השם הפרטי צריך להיות בין 2 ל-8 תווים</br>";
                document.getElementById("firstname").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("lastname").value == "") {

                document.getElementById("error").innerHTML += " יש להכניס את שם המשפחה</br>";
                document.getElementById("lastname").style.backgroundColor = "red";
                msg = false;
            }
            else if (document.getElementById("lastname").value.length < 2 || document.getElementById("lastname").value.length > 8) {
                document.getElementById("error").innerHTML += " שם המשפחה צריך להיות בין 2 ל-8 תווים</br>";
                document.getElementById("lastname").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("username").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את שם המשתמש</br>";
                document.getElementById("username").style.backgroundColor = "red";
                msg = false;
            }
            else if (document.getElementById("username").value.length < 2 || document.getElementById("username").value.length > 8) {
                document.getElementById("error").innerHTML += " שם המשתמש צריך להיות בין 2 ל-8 תווים</br>";
                document.getElementById("username").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("email").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את המייל</br>";
                document.getElementById("email").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("password").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את הסיסמה</br>";
                document.getElementById("password").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("password2").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את אישור הסיסמה</br>";
                document.getElementById("password2").style.backgroundColor = "red";
                msg = false;
            }
            else if (document.getElementById("password2").value != document.getElementById("password").value) {
                document.getElementById("error").innerHTML += " הסיסמה ואישור הסיסמה צריכים להיות זהים</br>";
                document.getElementById("password2").style.backgroundColor = "red";
                msg = false;
            }

            if (!document.getElementById("male").checked && !document.getElementById("female").checked) {
                document.getElementById("error").innerHTML += " יש לסמן את המגדר</br>";
                msg = false;
            }

            if (document.getElementById("date").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את תאריך הלידה</br>";
                document.getElementById("date").style.backgroundColor = "red";
                msg = false;
            }

            if (document.getElementById("number").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את מספר הטלפון</br>";
                document.getElementById("number").style.backgroundColor = "red";
                msg = false;
            }
            else if (document.getElementById("number").value.length != 10) {
                document.getElementById("error").innerHTML += " מספר הטלפון חייב להיות באורך 10 ספרות</br>";
                document.getElementById("number").style.backgroundColor = "red";
                msg = false;
            }

            if (!document.getElementById("checkbox").checked) {
                document.getElementById("error").innerHTML += " יש להסכים לתנאי השימוש</br>";
                msg = false;
            }
            return msg;
        }
    </script>
    <script type="text/javascript">
        function myFunction() {
            var x = document.getElementById("myLinks");
            if (x.style.display === "block") {
                x.style.display = "none";
            } else {
                x.style.display = "block";
            }
        }
    </script>
    <form id="form1" runat="server">
        <div class="mobile-container">

        <!-- Top Navigation Menu -->
        <div class="topnav">
            <a href="Login.aspx" class="active">התחבר</a>
            <div id="myLinks" style="text-align:right">
                <a href="Register.aspx" style="color: white">הרשמה</a>
            </div>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>

        <div id="main">
            <h1 style="text-align:center; display:block; font-size: 50px; text-decoration-line:underline">הרשם</h1>
            <form style="text-align:center" onsubmit="return IsValid()" action="login.html">
                <table align="center">
                    <tr>
                        <td>
                            First name
                        </td>

                        <td>
                            <input type="text" id="firstname" name="firstname" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last name
                        </td>

                        <td>
                            <input type="text" id="lastname" name="lastname" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            User name
                        </td>

                        <td>
                            <input type="text" id="username" name="username" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>

                        <td>
                            <input type="password" id="password" name="password" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password
                        </td>

                        <td>
                            <input type="password" id="password2" name="password2" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>

                        <td>
                            <input type="email" id="email" name="email" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>

                        <td>
                            <input type="radio" id="male" name="gender" value="male"/> זכר
                            <input type="radio" id="female" name="gender" value="female"/> נקבה
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Birth Date
                        </td>

                        <td>
                            <input type="date" id="date" name="date" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone Number
                        </td>

                        <td>
                            <input type="number" id="number" name="number" onclick="ResetColor(this.id);" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                        </td>
                        <td>
                            אני מסכים
                            <a href="Terms.aspx">לתנאי השימוש</a>
                            <input type="checkbox" id="checkbox" name="checkbox" onclick="MyWindow.close()"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input type="submit" value="הרשם" onclick="return IsValid()"/>
                            <input type="reset" value="אפס" onclick="Reset()" />
                        </td>
                    </tr>
                </table>

                <br/>

                <a href="Login.aspx" style="text-align:center">כבר יש לי חשבון</a>
                <br/>

                <div class="error" style="color:white" id="error"></div>
            </form>

        </div>

        <!-- End smartphone / tablet look -->
    </div>
    </form>
</body>
</html>