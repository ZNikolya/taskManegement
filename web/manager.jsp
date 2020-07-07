<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="model.Task" %>
<%@ page import="model.Comment" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20.06.2020
  Time: 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("user");
    List<Task> tasks = (List<Task>) request.getAttribute("task");
%>

<a href="/logout"> logout </a>

<div style="width: 800px;">
    <div style="width: 50%; float: left">
        Add User:<br>
        <form action="/userRegister" method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="name"><br>
            <input type="text" name="surname" placeholder="surname"><br>
            <input type="text" name="email" placeholder="email"><br>
            <input type="password" name="password" placeholder="password"><br>
            <select name="type">
                <option value="USER">USER</option>
                <option value="MANAGER">MANAGER</option>
            </select><br>
            <input type="file" name="image"> <br>

            <input type="submit" value="Register">
        </form>

        <div id="info"></div>
        <div id="tasklist"> Loading....</div>
        <div style="width: 50%; float: left">
            Add Task:<br>
            <form action="/addTask" method="post" id="addTask">
                <input type="text" id="name" name="name" placeholder="name"><br>
                <textarea name="description" id="description" placeholder="description"> </textarea><br>
                <input type="date" id="date" name="date"><br>
                <select name="status" id="status">
                    <option value="NEW">NEW</option>
                    <option value="IN_PROGRESS">IN_PROGRESS</option>
                    <option value="FINISHED">FINISHED</option>
                </select><br>
                <select name="user_id" id="user_id">

                    <%
                        if (users != null) {
                            for (User user : users) {
                    %>
                    <option value="<%=user.getId()%>"><%=user.getName()%><%=user.getSurname()%>
                    </option>

                    <%
                            }
                        }
                    %>

                </select><br><br>
                <input type="submit" value="Add">
            </form>
        </div>
    </div>
</div>


<script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>

    $(document).ready(function () {

        $("#addTask").submit(function (e) {
            e.preventDefault();
            let name = $("#name").val()
            let description = $("#description").val()
            let date = $("#date").val()
            let status = $("#status").val()
            let user_id = $("#user_id").val()
            $.ajax({
                url: "/addTask?name="+name+"&description="+description+"&date="+date+"&status="+status+"&user_id="+user_id,
                method: "POST",
                success: function (result) {
                    $("#info").html(result)
                    $("#name").val("")
                    $("#description").val("")
                    $("#date").val("")
                    $("#status").val("")
                    $("#user_id").val("")
                },
                error: function (result) {
                    $("#info").html("there is problem with task data!")

                }
            });
        })

        let getTaskList = function () {
            $.ajax({
                url: "/tasklist",
                method: "GET",
                success: function (result) {
                    $("#tasklist").html(result)
                }
            });
        };
        getTaskList();
        setInterval(getTaskList, 2000)
    })

</script>
</body>
</html>