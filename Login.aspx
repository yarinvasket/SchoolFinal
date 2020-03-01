<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="PrintTable" %>

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

            if (document.getElementById("password").value == "") {
                document.getElementById("error").innerHTML += " יש להכניס את הסיסמה</br>";
                document.getElementById("password").style.backgroundColor = "red";
                msg = false;
            }
            return msg;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mobile-container">

        <!-- Top Navigation Menu -->
        <div class="topnav">
            <a href="login.html" class="active">התחבר</a>
            <div id="myLinks" style="text-align:right">
                <a href="index.html" style="color: white">על עצמי</a>
                <a href="subject.html" style="color: white">הנושא שבחרתי</a>
                <a href="table.html" style="color: white">מידע על הנושא שבחרתי</a>
                <a href="register.html" style="color: white">הרשמה</a>
				<a href="album.html" style="color: white">אלבום תמונות</a>
            </div>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>

        <div id="main">
            <h1 style="text-align:center; display:block; font-size: 50px; text-decoration-line:underline">התחבר</h1>
            <form style="text-align:center" onsubmit="return IsValid()" action="index.html">
                <table align="center">
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
                        </td>
                        <td>
                            <input type="submit" value="התחבר" />
                            <input type="reset" value="אפס" onclick="Reset()" />
                        </td>
                    </tr>
                </table>

                <br/>

                <a href="register.html" style="text-align:center">אין לי חשבון</a>
                <br/>

                <div class="error" style="color:white" id="error"></div>
            </form>

        </div>

        <!-- End smartphone / tablet look -->
    </div>
    </form>
</body>
</html>