<%--
  Created by IntelliJ IDEA.
  User: 肖哲
  Date: 2019/6/22
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="js/jquery.easyui.min.js"></script>
<%--<script language="JavaScript">
        $(function () {
            $.post("getData",null,function (data) {
                var table="<table border=1>";
                table=table+"<tr><td>学号</td><td>姓名</td> <td>性别</td><td>年龄</td><td>生日</td></tr>";

                for (var i=0;i<data.length;i++){
                    var s=data[i];
                    table=table+"<tr><td>"+s.id+"</td><td>"+s.title+"</td> <td>"+s.summary+"</td><td>"+s.author+"</td><td>"+s.createdate+"</td></tr>";
                }
                table=table+"</table>";

                $("#getData").html(table);
                },"json");
        });
    </script>--%>

    <script language="JavaScript">
        $(function () {

            $('#btn1').bind('click', function(){
                alert('easyui');
            });

            $("#btu2").click(function () {
            $('#dg').datagrid({
                title:"学生信息表",
                url:'getDataByPage',
                pagination:true,
                pageList:[2,3,5,8],
                pageSize:3,
                columns:[[
                    {field:'id',title:'学号',width:100,align:'center'},
                    {field:'title',title:'姓名',width:100,align:'center'},
                    {field:'summary',title:'主题',width:100,align:'center'},
                    {field:'author',title:'作者',width:100,align:'center'},
                    {field:'createdate',title:'日期',width:100,align:'center',
                        formatter: function(value,row,index){
                        var date=new Date(value);
                        var year=date.getFullYear();
                        var month=date.getMonth()+1;
                        var day=date.getDay();
                        return year+"年"+month+"月"+day+"日";
                    }
                    },
                ]]
            });
        })
        })
    </script>

</head>
<body>
<%--<input type="button" id="but1" value="显示学生">
<div id="getData"></div>--%>

<table class="easyui-datagrid" style="width: 600px;height:250px"
       data-options="title:'学生信息列表',url:'getData',fitColumns:true,singleSelect:true">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">学号</th>
        <th data-options="field:'title',width:100">姓名</th>
        <th data-options="field:'summary',width:100,align:'right'">主题</th>
        <th data-options="field:'author',width:100,align:'right'">作者</th>
        <th data-options="field:'createdate',width:100,align:'right'">日期</th>
    </tr>
    </thead>
</table>
<input type="button" id="btu2" value="使用datagrid展示数据">
<table id="dg" style="width: 600px;height:250px"></table>


<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">easyui</a>


</body>
</html>
