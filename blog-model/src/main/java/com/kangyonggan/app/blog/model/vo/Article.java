package com.kangyonggan.app.blog.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
public class Article implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 栏目代码
     */
    @Column(name = "category_code")
    private String categoryCode;

    /**
     * 栏目名称
     */
    @Column(name = "category_name")
    private String categoryName;

    /**
     * 标签
     */
    private String tags;

    /**
     * 评论数量
     */
    @Column(name = "comment_count")
    private Integer commentCount;

    /**
     * 浏览数量
     */
    @Column(name = "glance_count")
    private Integer glanceCount;

    /**
     * 逻辑删除:{0:未删除, 1:已删除}
     */
    @Column(name = "is_deleted")
    private Byte isDeleted;

    /**
     * 创建时间
     */
    @Column(name = "created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @Column(name = "updated_time")
    private Date updatedTime;

    /**
     * 文章内容
     */
    private String content;

    private static final long serialVersionUID = 1L;
}