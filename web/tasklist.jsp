
<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Task" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<User> users = (List<User>) request.getAttribute("user");
    List<Task> tasks = (List<Task>) request.getAttribute("task");
%>
<div>
    <br>
    All Users:<br>
    <table border="1">
        <tr>
            <th>name</th>
            <th>surname</th>
            <th>email</th>
            <th>type</th>
            <th>picture</th>
        </tr>
        <%
            if (users != null) {
                for (User user : users) {%>
        <tr>
            <td><%=user.getName()%>
            </td>
            <td><%=user.getSurname()%>
            </td>
            <td><%=user.getEmail()%>
            </td>
            <td><%=user.getUserType().name()%>
            </td>
            <td> <% if (user.getPictureUrl() != null) { %>
                <img src="/image?path=<%=user.getPictureUrl()%>" width="30"/>
                <%}%>
            </td>
            <%
                    }
                }
            %>
        </tr>
    </table>
</div>
<div>
<ul>

    All Tasks: <br>
    <table border="1">
        <tr>
            <th>name</th>
            <th>description</th>
            <th>deadline</th>
            <th>status</th>
            <th>user</th>
        </tr>
        <%
            if (tasks != null) { %>
        <% for (Task task : tasks) { %>
        <tr>
            <td>  <a href="/taskPage?id=<%=task.getId()%>"> <%=task.getName()%> </a>
            </td>
            <td><%=task.getDescription()%>
            </td>
            <td><%=task.getDeadline()%>
            </td>
            <td><%=task.getTaskStatus().name()%>
            </td>
            <td><%=task.getUser().getName() + " " + task.getUser().getSurname()%>
            </td>

            <%
                } %>
            <% }
            %>
        </tr>
    </table>
</ul>
</div>

