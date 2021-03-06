<%@ page import="Bean.Users" %>
<%@ page import="Bean.MyBuyFood" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.UserDao" %>
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
        %>
    <title>购买记录</title>
    <link rel="stylesheet" type="text/css" href="firstPage.css">
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%
    FoodDao foodDao=new FoodDao();
    UserDao userDao=new UserDao();
    Users us=(Users) httpSession.getAttribute("user");
    List<MyBuyFood> list= userDao.getRecord(us.getEmail());
    int pageSize=10;
    int allpages=(int) Math.ceil(list.size()/pageSize);
%>
<div class="sc">
    <%
        if (list==null||list.size()==0){
    %>
    <a href="PageContent">暂无订单消息，点击返回首页</a><br>
    <%
    }
    else {
    %>
    <table style="margin-top:10px;
    margin-bottom:10px;
    border-spacing: 50px 5px;
    text-align: center;
    font-size: 20px;
    color: black;
    margin-left: 23%;
    border: black 5px solid;
    border-radius: 20px;">
        <tr>
            <td></td>
            <td></td>
            <td>我的记录</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>糖果</td>
            <td>店家</td>
            <td>数量</td>
            <td>购买时间</td>
            <td>共计</td>
        </tr>
        <%
            for (int i=(currentpage-1)*pageSize;i<list.size()&&i<currentpage*pageSize;i++){
                MyBuyFood food=list.get(i);
        %>
        <tr>
            <td><a href="FoodInfo.jsp?id=<%=food.getFoodid()%>&page=<%=currentpage%>&myrecord=1"><%=food.getFood()%></a></td>
            <td><a href="BossShop?name=<%=food.getBoss()%>"><%=food.getBoss()%></a></td>
            <td><%=food.getNum()%></td>
            <td><%=food.getTime()%></td>
            <td><%=food.getAllpay()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
     %>
</div>
<div>
    <a style="margin-left: 42%;font-size: 20px"
       onclick="backaction()" href=<%=currentpage<=1?"#":"MyRecord.jsp?page="+(currentpage-1)%>>上一页</a>
    <a style="margin-left: 7%;font-size: 20px"
       onclick="forwaction()" href=<%=currentpage>allpages?"#":"MyRecord.jsp?page="+(currentpage+1)%>>下一页</a>
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
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
