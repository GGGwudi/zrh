<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body{
        font-family: 'Sitka Text';
    }
    #dhead{
        margin: 0;
        color: white;
    }
    div a{
        color: black;
        text-align: center;
    }
    .headtable{
        text-align: right;
        margin-left: 90%;
    }
</style>
<div id="dhead">
    <a href="PageContent?type=精品推荐"><img src="pictures/logo.png" width="150" height="120"
         style="float: left;margin-left: 85px;margin-top: 0px"></a>
    <table class="headtable" style="text-align: right">
        <tr>
            <td>
                <a href="ShopCar.jsp">
                    我的购物车
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="MyInfo.jsp">
                    我的账户
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="booses.jsp?page=1">
                    查看所有店家
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="MyRecord.jsp?page=1">
                    我的购买记录
                </a>
            </td>
        </tr>
    </table>
</div>
