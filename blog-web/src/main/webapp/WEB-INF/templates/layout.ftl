<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="个人博客,学习笔记,代码片段,技术分享"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="${ctx}/static/app/css/app.css"/>
<@block name="app-style"/>
</head>
<body>
<#include "navbar.ftl"/>

<div class="main-container" id="main-container">

<#include "sidebar.ftl"/>

    <div class="page-content-area"></div>

<#include "footer.ftl"/>
</div>

<script>var ctx = '${ctx}';</script>
<script src="${ctx}/static/libs/jquery/jquery.min.js"></script>
<script src="${ctx}/static/libs/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/libs/ace/ace.min.js"></script>
<script src="${ctx}/static/app/js/app.js"></script>
<@block name="app-script"/>
</body>
</html>
