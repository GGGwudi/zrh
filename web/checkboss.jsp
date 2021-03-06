<%@ page import="Bean.Users" %>
<%@ page import="Bean.SoldSort" %>
<%@ page import="Dao.UserDao" %>
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
        alert("封号成功！");
    </script>
    <%
        httpSession.removeAttribute("react");
    }
    else {
    %>
    <script>
        alert("封号失败！请重试！");
    </script>
    <%
                httpSession.removeAttribute("react");
            }
        }
    %>
    <title>店家榜单</title>
    <link rel="stylesheet" type="text/css" href="firstPage.css">
</head>
<body>
<%
    FoodDao foodDao=new FoodDao();
    UserDao userDao=new UserDao();
    List<SoldSort> list= userDao.getAllboss();
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
    margin-left: 16%;
    color: black;
    border: black 5px solid;
    border-radius: 20px;">
        <tr>
            <td></td>
            <td></td>
            <td>店家销售榜单</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>店家</td>
            <td>联系方式</td>
            <td>店铺销量</td>
            <td>总收入</td>
            <td></td>
        </tr>
        <%
            for (int i=(currentpage-1)*pageSize;i<list.size()&&i<currentpage*pageSize;i++){
                SoldSort ss=list.get(i);
        %>
        <tr>
            <td><%=ss.getBoss()%></td>
            <td><%=ss.getEmail()%></td>
            <td><%=ss.getNum()%>份</td>
            <td><%=ss.getEarn()%>元</td>
            <td><a href="Block?uname=<%=ss.getBoss()%>&role=店家&page=<%=currentpage%>&login=2">
                <button class="bos">封锁账号</button> </a> </td>
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
       onclick="backaction()" href=<%=currentpage<=1?"#":"checkboss.jsp?page="+(currentpage-1)%>>上一页</a>
    <a style="margin-left: 7%;font-size: 20px"
       onclick="forwaction()" href=<%=currentpage>allpages?"#":"checkboss.jsp?page="+(currentpage+1)%>>下一页</a>
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
