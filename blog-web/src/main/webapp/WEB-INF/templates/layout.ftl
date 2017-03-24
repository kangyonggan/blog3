<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="web前端,java后台,数据库,系统运维,学习笔记,代码片段,问题集合,资源下载,技术分享"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="${ctx}/static/app/css/app.css"/>

    <script src="${ctx}/static/libs/jquery/jquery.min.js"></script>
<@block name="app-style"/>
</head>
<body>

<div class="sim-page"></div>

<script>var ctx = '${ctx}';</script>
<script src="${ctx}/static/app/js/simpage.js"></script>
<script src="${ctx}/static/app/js/app.js"></script>
<@block name="app-script"/>
</body>
</html>
