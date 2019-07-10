<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table tr:nth-child(odd){
        background:#9FF;
    }
</style>

<body style="width:900px; margin:0px auto;">
<div style="width:900px; text-align:center">
    <h2>帖子列表</h2>
</div>
<div style="width:880px; text-align:right; padding-right:20px; line-height:25px; height:25px;">
    <a href="#"></a></div>
<div style="width:900px; text-align:center">
    <form id="searchForm" action="${pageContext.request.contextPath}/index">
        帖子标题：
        <input type="text" name="title" id="title" value="${invitationParam.title}" />
        &nbsp;
        <input type="submit" name="btnSearch" id="btnSearch" value="搜索" />
        &nbsp;&nbsp;&nbsp;
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>

    </form>
</div>

<div style="width:900px; text-align:center">
    <table width="900" border="1" cellspacing="0" cellpadding="0">
        <tr style="background-color:#999">
            <td width="73" align="center">序号</td>
            <td width="124" align="center">标题</td>
            <td width="382" align="center">内容摘要</td>
            <td width="87"  align="center">作者</td>
            <td width="104" align="center">发布时间</td>
            <td width="90"  align="center">操作</td>
        </tr>

        <c:if test="${requestScope.info.list!=null}">
            <c:forEach var="invitation" items="${requestScope.info.list}">
                <tr>
                    <td align="center">${invitation.id}</td>
                    <td align="center">${invitation.title}</td>
                    <td align="center">${invitation.summary}</td>
                    <td align="center">${invitation.author}</td>
                    <td align="center"><fmt:formatDate value="${invitation.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td align="center">
                        <a href="${pageContext.request.contextPath}/update/${invitation.id}">查看回复</a>&nbsp;
                        <a href="javascript:do_delete(${invitation.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <td colspan="6" align="center" valign="middle">
                <a href="javascript:do_page(1)">首页</a> &nbsp;
                <a href="javascript:do_page(${requestScope.info.pageNum-1})" style="text-decoration: none">上一页</a> &nbsp;
                <c:forEach var="n" items="${requestScope.info.navigatepageNums}">
                    <a href="javascript:do_page(${n})">${n}</a>&nbsp;
                </c:forEach>
                <a href="javascript:do_page(${requestScope.info.pageNum+1})" style="text-decoration: none">下一页</a> &nbsp;
                <a href="javascript:do_page(${requestScope.info.pages})" style="text-decoration: none">末页</a> &nbsp;
                ${requestScope.info.pageNum}/${requestScope.info.pages}页

            </td>
        </tr>
    </table>


</div>
</body>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="application/javascript">
    function do_page(pn) {
        $("#pageIndex").val(pn);
        $("#searchForm").submit();
    }
    function do_delete(id) {
        var url = "${pageContext.request.contextPath}/delete/" + id;
        if (confirm("确认删除吗？")) {
            location.href = url;
            //设置地址，判断，然后返回地址
        }
    }
</script>
</html>

