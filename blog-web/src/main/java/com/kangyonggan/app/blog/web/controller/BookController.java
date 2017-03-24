package com.kangyonggan.app.blog.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 2017/3/21
 */
@Controller
@RequestMapping("book")
public class BookController extends BaseController {

    /**
     * 书籍
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return getPathRoot();
    }

}
