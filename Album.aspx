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
</head>
<body>
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
    <script type="text/javascript">
        var imgs = ['img0.jpg', 'img1.jpg', 'img2.jpg'];
        var idx = 0;
        function nextImg() {
            if (idx < 2)
                document.getElementById('myImage').src = 'res/' + imgs[++idx];
            return false;
        }
        function prevImg() {
            if (idx > 0)
                document.getElementById("myImage").src = "res/" + imgs[--idx];
            return false;
        }
	</script>
    <form id="form1" runat="server">
        <div class="mobile-container">

        <!-- Top Navigation Menu -->
        <div class="topnav">
            <a href="Login.aspx" class="active">התחבר</a>
            <div id="myLinks" style="text-align:right">
                <a href="index.aspx" style="color: white">על עצמי</a>
                <a href="Subject.aspx" style="color: white">הנושא שבחרתי</a>
                <a href="Table.aspx" style="color: white">מידע על הנושא שבחרתי</a>
                <a href="Register.aspx" style="color: white">הרשמה</a>
				<a href="Album.aspx" style="color: white">אלבום תמונות</a>
            </div>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>

        <div style="text-align:center">
            <h3 class="ex2">אלבום תמונות של היקום</h3>
			<button onclick="return nextImg()">
				תמונה הבאה
			</button>
			----------
			<button onclick="return prevImg()">
				תמונה קודמת
			</button>
			<br/>
			<br/>
			<br/>
			<img id="myImage" src="res/img0.jpg" style="width:100px"/>
        </div>

        <!-- End smartphone / tablet look -->
    </div>
    </form>
</body>
</html>