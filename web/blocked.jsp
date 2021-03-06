<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="Bean.Blocked" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.FoodDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        HttpSession httpSession=request.getSession(false);
        if (request.getParameter("page")==null){
    %>
    <script>
        alert("操作有误，将回到首页！");
        window.location="PageContent";
    </script>
    <%
        }
        int currentpage=Integer.valueOf(request.getParameter("page"));
        if (httpSession==null){
    %>
    <script>
        alert("对不起您尚未登录，请登录后再进行操作！");
        window.location="login.jsp";
    </script>
    <%
    }
    else{
        if (httpSession.getAttribute("user")==null){
    %>
    <script>
        alert("对不起您尚未登录，请登录后再进行操作！");
        window.location="login.jsp";
    </script>
    <%
    }
    else {
        Users user=(Users)  httpSession.getAttribute("user");
        if (user.getRole()!=2){
    %>
    <script>
        alert("对不起您无权访问该页面！");
        window.location="PageContent";
    </script>

    <%
        }
        if (httpSession.getAttribute("react")!=null){
            boolean success=(boolean)httpSession.getAttribute("react");
            if (success){
    %>
    <script>
        alert("解封成功！");
    </script>
    <%
        httpSession.removeAttribute("react");
    }
    else {
    %>
    <script>
        alert("解封失败！请重试！");
    </script>
    <%
                httpSession.removeAttribute("react");
            }
        }
    %>
    <title>封号列表</title>
    <link rel="stylesheet" type="text/css" href="firstPage.css">
</head>
<body>
<%
    FoodDao foodDao=new FoodDao();
    UserDao userDao=new UserDao();
    List<Blocked> list= userDao.getblockes();
    int pageSize=20;
    int allpages=(int) Math.ceil(list.size()/pageSize);
%>
<div class="sc">
    <%
        if (list==null||list.size()==0){
    %>
    <a href="ManagerFirstPage.jsp">暂无记录，点击返回首页</a><br>
    <%
    }
    else {
    %>
    <table style="margin-top:10px;
    margin-bottom:10px;
    border-spacing: 50px 5px;
    text-align: center;
    font-size: 20px;
    margin-left: 25%;
    color: black;
    border: black 5px solid;
    border-radius: 20px;">
        <tr>
            <td></td>
            <td>封号列表</td>
            <td></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>用户名</td>
            <td></td>
        </tr>
        <%
            for (int i=(currentpage-1)*pageSize;i<list.size()&&i<currentpage*pageSize;i++){
                Blocked ll=list.get(i);
        %>
        <tr>
            <td><%=ll.getEmail()%></td>
            <td><%=ll.getUname()%></td>
            <td><a href="Free?uname=<%=ll.getUname()%>&page=<%=currentpage%>">
                <button class="bos">解封账号</button> </a> </td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="ManagerFirstPage.jsp"><button class="bos">返回首页</button></a>
    <%
        }
    %>
</div>
<div>
    <a style="margin-left: 42%;font-size: 20px"
       onclick="backaction()" href=<%=currentpage<=1?"#":"loglogs.jsp?page="+(currentpage-1)%>>上一页</a>
    <a style="margin-left: 7%;font-size: 20px"
       onclick="forwaction()" href=<%=currentpage>allpages?"#":"loglogs.jsp?page="+(currentpage+1)%>>下一页</a>
</div>
<script>
    function backaction() {
        <%
        if (currentpage<=1){
        %>
        alert("已经是首页了！");
        <%
        }
        %>
    }
    function forwaction() {
        <%
        if (currentpage>allpages){
        %>
        alert("已经是最后一页了！");
        <%
        }
        %>
    }
</script>
<%
        }
    }
%>
</body>
</html>
