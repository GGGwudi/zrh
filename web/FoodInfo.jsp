<%@ page import="Bean.Foods" %>
<%@ page import="Dao.FoodDao" %>
<%@ page import="Bean.Users" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="Dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String sid=request.getParameter("id");
        int cpage=0;
        if (request.getParameter("page")!=null)
            cpage=Integer.valueOf(request.getParameter("page"));
        String type=request.getParameter("type");
        if (sid==null){
    %>
    <jsp:forward page="/PageContent"></jsp:forward>
    <%
        }else {
            FoodDao foodDao=new FoodDao();
            UserDao userDao=new UserDao();
            int id=Integer.valueOf(sid);
            Foods food= foodDao.getFood(id);
            HttpSession ses=request.getSession();
            Users u=(Users) ses.getAttribute("user");
            ses.setAttribute("fid",id);
            if (u!=null) {
                LocalDateTime time = LocalDateTime.now();
                int begin=time.getSecond();
                ses.setAttribute("time",begin);
                ses.setAttribute("ftype",food.getType());
            }
    %>
    <link rel="stylesheet" type="text/css" href="firstPage.css">
    <title><%=food.getFoodname()%></title>
</head>
<body>
<%@include file="head.jsp"%>
<%@include file="menu.jsp"%>
<div class="foodinfo">
<img src="foods/<%=food.getPicture()%>" width="250" height="250"
     style="float: left;border: white 5px solid;border-radius: 30px;margin-right: 40px;margin-left: 20px">
<dl>
    <dd>店家:<%=food.getBoss()%></dd>
<dd>糖果名称:<%=food.getFoodname()%></dd>
<dd>价格:<%=food.getPrice()%></dd>
<dd>已卖出:<%=food.getSold()%>份</dd>
<dd>剩余:<%=food.getNum()%>份</dd>
<dd>糖果简介:<%=food.getIntroduction()%></dd>
<dd>
    <%
        String url="MyCar";
        String boss=request.getParameter("boss")==null?"":request.getParameter("boss");
        String cp=request.getParameter("page")==null?"":request.getParameter("page");
        String ty=request.getParameter("type")==null?"":request.getParameter("type");
        String mr=request.getParameter("myrecord")==null?"":request.getParameter("myrecord");
    %>
    <form name="f" action=<%=u==null?"login.jsp":url%>>
    添加 <input type="number" value="1" min="1" max="500" name="wanted" style="width: 40px"/> 份
        <br>
        <input value="<%=boss%>" name="boss" style="display: none">
        <input value="<%=cp%>" name="page" style="display: none">
        <input value="<%=ty%>" name="type" style="display: none">
        <input value="<%=mr%>" name="myrecord" style="display: none">
    <input class="bos2" type="submit" value="立即添加到购物车" onclick="check()"/>
</form>  </dd>
    <dd><a href="BossShop?name=<%=food.getBoss()%>"><button class="bos2">去店铺看看</button></a></dd><br>
</dl>
</div>
<script>
    function check() {
        <%
            if (u==null){
        %>
        alert("对不起您尚未登录，请登录后再进行操作！");
        <%
            }
            else {
        %>
        alert("添加成功！");
        <%
            }
        %>
    }
</script>
<%
    }
%>
<%@include file="foot.jsp"%>
</body>
</html>
