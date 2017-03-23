$(function () {
    // 异步加载界面
    var $ajaxContent = $(".page-content-area");
    $ajaxContent.ace_ajax({
        'default_url': '#index',
        'content_url': function (hash) {
            return window.location.origin + window.location.pathname + "/" + hash;
        },
        'loading_text': '<span class="loading">正在加载, 请稍等...</span>'
    });

    // 监听异步加载失败事件
    $ajaxContent.on("ajaxloaderror", function (e, data) {
        window.location.href = ctx + '/#500';
    });
});

// 提示信息
var last_gritter;
var showMessage = function (type, message) {
    if (last_gritter) {
        $.gritter.remove(last_gritter);
    }
    last_gritter = $.gritter.add({
        title: '消息',
        text: message,
        class_name: type
    });
};
var Message = {
    success: function (message) {
        showMessage('gritter-success', message);
    },

    warning: function (message) {
        showMessage('gritter-warning', message);
    },

    error: function (message) {
        showMessage('gritter-error', message);
    },

    info: function (message) {
        showMessage('gritter-info', message);
    }
};
