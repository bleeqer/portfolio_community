package com.portfolio.domain;

import com.portfolio.commons.util.TimeDiff;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class QAPairVO {

    private String question;
    private String catPath;
//    private String questionRegDate;
//    private int questionLikeCnt;

    private int quesNo;
    private int ansNo;
    private String answer;
    private int answerUserNo;
    private String answerRegDate;
//    private Date answerRegDate;
//    private String answerTimeDiff;
    private int answerLikeCnt;
    private String answerEmail;
    private String answerUserName;
    private String answerUserPhoto;
    private String answerUserOccupation;

    public String getAnswerRegDate() {
        return answerRegDate;
    }
    public void setAnswerRegDate(Date date) {
        this.answerRegDate = TimeDiff.calculateTime(date);
    }

}
