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
    <script language="JavaScript">

        $(function(){
            $('#btn2').bind('click', function(){
                alert('easyui');
            });
            $('#btn').linkbutton({
                iconCls: 'icon-search'
            });
            $('#tt2').tabs({
                border:false,
                onSelect:function(title){
                    alert(title+' is selected');
                }
            });
            $(function(){
                $('#btn').bind('click', function(){
                    alert('easyui');
                });
            });
            $('#cc').layout('add',{
                region: 'center',
                width: 180,
                title: 'West Title',
                split: true,
                tools: [{
                    iconCls:'icon-add',
                    handler:function(){alert('add')}
                },{
                    iconCls:'icon-remove',
                    handler:function(){alert('remove')}
                }]
            });

        });



    </script>
</head>
<body class="easyui-layout">
<%--布局面板--%>

    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;">
        布局面板

        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">easyui</a>

    </div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;">
        <a id="btn1" href="#">easyui</a>

    </div>

    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;">
        <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">easyui</a>
    </div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;">
        <%--选项卡 - Tabs--%>
        <div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
            <div title="Tab1" style="padding:20px;display:none;">
                选项卡
            </div>
            <div title="Tab2" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">
                tab2
            </div>
            <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">
                tab3
            </div>
        </div>
    </div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">

        <div id="cc"></div>

    </div>



</body>
</html>
