package com.kangyonggan.app.blog.web.controller;

import com.kangyonggan.app.blog.common.util.StringUtil;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;

/**
 * @author kangyonggan
 * @since 2017/3/23
 */

public class BaseController {

    protected static final String RESP_CO = "respCo";
    protected static final String RESP_MSG = "respMsg";

    protected static final String SUCCESS = "Y";
    protected static final String FAILURE = "F";

    private String PATH_ROOT;
    private static final String LIST = "/list";
    private static final String INDEX = "/index";
    private static final String FORM = "/form";
    private static final String FORM_MODAL = "/form-modal";
    private static final String DETAIL = "/detail";
    private static final String DETAIL_MODAL = "/detail-modal";
    private static final String TABLE_TR = "/table-tr";

    public BaseController() {
        String className = getClass().getSimpleName();
        String arr[] = StringUtil.camelToArray(className);

        PATH_ROOT = "";
        for (int i = 0; i < arr.length - 1; i++) {
            if (i != 0) {
                PATH_ROOT += "/";
            }
            PATH_ROOT += arr[i];
        }
    }

    protected Map<String, Object> getResultMap() {
        Map<String, Object> resultMap = new HashedMap();
        resultMap.put(RESP_CO, SUCCESS);
        resultMap.put(RESP_MSG, "操作成功");

        return resultMap;
    }

    protected void setResultMapFailure(Map<String, Object> resultMap) {
        setResultMapFailure(resultMap, null);
    }

    protected void setResultMapFailure(Map<String, Object> resultMap, String msg) {
        resultMap.put(RESP_CO, FAILURE);
        resultMap.put(RESP_MSG, StringUtils.isEmpty(msg) ? "未知错误，请联系管理员" : msg);
    }

    protected String getPathRoot() {
        return PATH_ROOT;
    }

    protected String getPathIndex() {
        return PATH_ROOT + INDEX;
    }

    protected String getPathList() {
        return PATH_ROOT + LIST;
    }

    protected String getPathForm() {
        return PATH_ROOT + FORM;
    }

    protected String getPathFormModal() {
        return PATH_ROOT + FORM_MODAL;
    }

    protected String getPathDetail() {
        return PATH_ROOT + DETAIL;
    }

    protected String getPathDetailModal() {
        return PATH_ROOT + DETAIL_MODAL;
    }

    protected String getPathTableTr() {
        return PATH_ROOT + TABLE_TR;
    }

}

