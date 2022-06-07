package com.portfolio.controller;

import com.portfolio.domain.CategoryVO;
import com.portfolio.domain.QuestionVO;
import com.portfolio.service.AnswerService;
import com.portfolio.service.QuestionService;
import com.portfolio.service.QuestionImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("question")
public class QuestionController {

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Autowired
    QuestionImageService imageService;

    @PostMapping("create")
    public String createQuestion(QuestionVO questionVO, Principal principal, Model model) {

        questionVO.setUserEmail(principal.getName());

        System.out.println(questionVO.getCategoryCode());

        // 기존 질문 리스트 조회
        List<QuestionVO> questions = questionService.selectList(new QuestionVO());

        questionService.create(questionVO);

        // 새로 생성된 질문글
        QuestionVO question = questionService.select(questionVO.getQuesNo());

        // 기존 질문 리스트의 첫번째 질문에 새로 생성된 질문글 추가
        questions.add(0, question);

        // 질문 하나가 추가되었으므로 기존 질문 리스트에서 질문 한개 삭제
        if(questions.size() > 10) {
            questions.remove(questions.size() - 1);
        }

        model.addAttribute("questions", questions);

        model.addAttribute("categories", questionService.selectCategories());

        return "redirect:/questions";
    }

    @GetMapping("select")
    @ResponseBody
    public QuestionVO selectQuestion(@RequestParam int quesNo) {

        return questionService.select(quesNo);

    }

    @PostMapping("update")
    @ResponseBody
    public QuestionVO updateQuestion(@RequestBody QuestionVO questionVO) {

        questionService.update(questionVO);

        return questionService.select(questionVO.getQuesNo());

    }

    @GetMapping("{quesNo}")
    public String viewQuestion(@PathVariable long quesNo, Model model) {

        QuestionVO question = questionService.select(quesNo);

        // 답변여부에 따라 답변글 조회
        if (question.getAnswered().equals("Y")) {

            HashMap<String, Long> map = new HashMap<>();

            map.put("quesNo", quesNo);

            // 더불러오기용 마지막 답변글 번호
            map.put("ansNo", null);

            // 답변 리스트
            model.addAttribute("answers", answerService.selectAnswers(map));

        }

        model.addAttribute("question", question);

        return "detailQuestion";

    }

    @GetMapping("categories")
    @ResponseBody
    public List<CategoryVO> getCategories() {

        return questionService.selectCategories();
    }

}
