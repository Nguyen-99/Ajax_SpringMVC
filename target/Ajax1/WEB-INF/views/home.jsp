<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nguyen
  Date: 5/28/2021
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">--%>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
          crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
          crossorigin="anonymous">
    <style type="text/css">
        input[type="text"], input[type="number"] {
            display: block;
            width: 100%;
            height: 40px;
            margin-bottom: 10px;
        }

        .content {
            margin-top: 50px;
        }

        .navbar {
            color: white;
            background-color: #45619D !important;
            border-radius: 0px;
        }

        .navbar-header {
            /*border-radius: none;*/
        }

        .navbar-header a {
            margin-top: 10px;
            font-size: 30px;
        }

        .navbar-header a:hover {
            color: white;
        }

        .btn {
            width: 100%;
        }

        #ajax-response {
            text-align: center;
            margin-left: 20px;
            border: 1px solid black;
            margin-bottom: 10px;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
<header> <nav class="navbar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="navbar-header">
                    <a href="#" class="navbar navbar-brand">Viblo</a>
                </div>
            </div>
        </div>
    </div>
</nav> </header>

<section class="content">
    <div class="container">
        <div class="row">
            <div id="ajax-response"></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h3>Add New Person</h3>
                <input type="text" placeholder="Enter name of person" id="name"/>
                <input type="number" placeholder="Enter age of person" id="age"/>
                <input type="submit" class="btn btn-success" value="Submit" onclick="addViaAjax()">
            </div>
            <div class="col-md-4">
                <h3>Search Person by name</h3>
                <input type="text" placeholder="Enter name of person" id="query" />
                <input type="button" class="btn btn-success" value="Submit" onclick="searchViaAjax()">
            </div>
        </div>
    </div>
</section>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>

<script type="text/javascript">
    function addViaAjax(){
        var name=$("#name").val();
        var age=$("#age").val();
        $.ajax({
            url: "<c:url value="/addnew"/>",
            type:"get",
            data:{
                name:name,
                age:age
            },
            dataType: "json",
            success :function (result){
                console.log("SUCCESS: ",result);
                var rs="<h3>You just add a person name:"+result.name+",age:"+result.age+"</h3>";
                $("#ajax-response").html(rs);
            }
        });
    }
    function searchViaAjax(){
        var query=$("#query").val();

        $.ajax({
            url: "<c:url value="/search"/>",
            type:"get",
            data:{
                query:query
            },
            dataType: "json",
            success:function (result){
                console.log("Success:",result);
                if(result==null){
                    var rs="<h3>Not found person</h3>";
                }else {
                    var rs= "<h3>You just search a person name:"+result.name+"</h3>"
                }
                $("#ajax-response").html(rs);
            }
        });
    }
</script>
</body>
</html>
