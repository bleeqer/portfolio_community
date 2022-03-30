package com.portfolio.mapper;

import com.portfolio.domain.AnswerReplyVO;
import com.portfolio.domain.AnswerVO;
import com.portfolio.service.AnswerReplyService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/spring-security.xml"})
public class AnswerReplyMapperTest {

    @Autowired
    AnswerReplyMapper answerReplyMapper;

//    @Test
//    public void test() {
//        HashMap<String, Integer> map = new HashMap<>();
//        map.put("replyNo", 25);
//
//        answerReplyMapper.delete(map);
//    }

    @Test
    public void selectTest() {
//        List<AnswerReplyVO> answers = answerReplyMapper.selectList(25);
        Map<String, Integer> requestNums = new HashMap<>();
        requestNums.put("ansNo", 25);
        requestNums.put("replyNo", 21);
        List<AnswerReplyVO> answers = answerReplyMapper.selectMoreList(requestNums);

        for (AnswerReplyVO answer : answers) {
            System.out.println("REPLY NO: " + answer.getReplyNo());
            System.out.println("CONTENT: " + answer.getContent());
            System.out.println("LEVEL: " + answer.getLevel());

        }
    }
}