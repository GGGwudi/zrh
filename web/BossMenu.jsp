<%@ page import="Bean.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body{
        font-family: 'Sitka Text';
    }
    #dmenu{
        background: lightpink;
        background-size:100% 100%;

        border-radius: 20px;
    }
    div a{
        color: black;
        text-align: center;
    }
    .menutable{
        font-size: 18px;
        color: black;
        border-spacing: 60px 5px;
        width:100%;
        text-align: right;
    }
</style>
<div id="dmenu">
    <table class="menutable">
        <tr style="width: 20px">
            <td>
                <a href="MyFoods?type=全部">全部</a>
            </td>
            <td>
                <a href="MyFoods?type=软糖">软糖</a>
            </td>
            <td>
                <a href="MyFoods?type=硬糖">硬糖</a>
            </td>
            <td>
                <a href="MyFoods?type=水果糖">水果糖</a>
            </td>
            <td>
                <a href="MyFoods?type=棒棒糖">棒棒糖</a>
            </td>
            <td>
                <a href="MyFoods?type=冰淇淋">冰淇淋</a>
            </td>
            <td>
                <a href="MyFoods?type=夹心糖">夹心糖</a>
            </td>
            <td>
                <%
                    HttpSession session1=request.getSession();
                    Users user=(Users) session1.getAttribute("user");
                    if (user==null){
                        out.print("未登录，");
                        out.print("<a href=\"login.jsp\">请先登录</a>");
                    }
                    else {
                        out.print("欢迎您，" + user.getUname()+"，");
                        out.print("<a href=\"logout\">点击登出</a>");
                    }
                %>
            </td>
        </tr>
    </table>
</div>
