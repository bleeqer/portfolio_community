package com.portfolio.controller;

import com.portfolio.commons.util.UploadFileUtils;
import com.portfolio.domain.UserVO;
import com.portfolio.service.AnswerService;
import com.portfolio.service.QuestionService;
import com.portfolio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;
import java.util.List;


@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    AnswerService answerService;

    @Autowired
    QuestionService questionService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("login")
    public String userLogin() {

        return "login";
    }

    @GetMapping("profile/{email}")
    public String userProfile(@PathVariable String email, Model model) {

        // 유저 정보 가져오기
        UserVO user = userService.select(email);

        model.addAttribute("user", user);

        return "profile";
    }

    @GetMapping("profile/{email}/answers")
    public String userAnswers(@PathVariable String email, Model model) {

        // 유저 정보 가져오기
        model.addAttribute("user", userService.select(email));

        // 유저가 작성한 답변-질문 페어 3개 가져오기
        model.addAttribute("answerPairs", answerService.selectAnsweredPairByUser(email));

        return "profile";
    }

    @GetMapping("profile/{email}/questions")
    public String userQuestions(@PathVariable String email, Model model) {

        // 유저 정보 가져오기
        model.addAttribute("user", userService.select(email));

        // 유저가 작성한 질문 리스트 가져오기
//        model.addAttribute("questions", questionService.selectList(userNo));

        return "profile";
    }

    @GetMapping("get")
    @ResponseBody
    public UserVO getUser(Principal principal) {

        return userService.select(principal.getName());
    }

    @PostMapping("create")
    @ResponseBody
    public int createUser(UserVO userVO, MultipartHttpServletRequest multiRequest) throws IOException {
        
        // 프로필 이미지 업로드 후 업로드한 이미지 경로 담기
        List<String> photoPath = UploadFileUtils.uploadFile(multiRequest);
        
        // 해싱한 비밀번호로 교체
        userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));

        userVO.setAuthority("ROLE_USER");
        
        // 업로드한 이미지 경로 셋팅
        userVO.setPhoto(photoPath.get(0));

        try {
            userService.create(userVO);
        }
        catch(Exception e) {
            return 0;
        }

        return 1;
    }

}
