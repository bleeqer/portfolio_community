package com.portfolio.service;

import com.portfolio.domain.QuestionCategoryVO;

import java.util.List;

public interface QuestionCategoryService {
    List<QuestionCategoryVO> selectAll();
}
