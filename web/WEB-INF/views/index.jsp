<%--
  Created by IntelliJ IDEA.
  User: linux-king
  Date: 2/13/22
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>

    <sec:authentication property="principal" var="principal"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <sec:csrfMetaTags/>

    <script>
        const token = $("meta[name='_csrf']").attr("content")
        const header = $("meta[name='_csrf_header']").attr("content")
    </script>

    <%--Bootstrap--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <%--tinymce editor--%>
    <script src="https://cdn.tiny.cloud/1/gus813frvbl3fe4mc223cqoe7nmtzbc5kbk3xc2dzvawxe52/tinymce/6/tinymce.min.js"></script>

    <%--Bootstrap Icon--%>
    <%--    <link rel="stylesheet" href="https://cdn.misdeliver.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">--%>

    <%--CSS--%>
    <link rel="stylesheet" type="text/css" href="/static/css/utils.css">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/static/css/popover.css">
    <link rel="stylesheet" type="text/css" href="/static/css/answer.css">

    <style>
        input, textarea, button, a {
            color: rgb(213, 214, 214);
            background-color: transparent;
        }

        html, body {
            box-sizing: border-box !important;
            padding: 0;
            margin: 0;
            font-size: 16px;
            border: none;
            background-color: #181818;
            color: rgb(213, 214, 214);
        }

        .icon_svg-stroke {
            stroke: rgb(177, 179, 182);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            color: inherit;
        }

        select:focus {
            outline: none;
        }
    </style>

</head>
<body>

<div>

    <div style="height: 50px;"></div>

    <%--Navbar--%>
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

    <%--Search focus overlay--%>
    <div class="position-fixed bg-transparent-dark search-overlay"></div>


    <%--Main content--%>
    <div>
        <div class="container-fluid m-0" style="padding-top: 30px; padding-left: 24px; padding-right: 24px;">
            <div class="d-flex mx-auto position-relative" style="max-width: 1002px; min-width: 1002px;">

                <%--토픽 리스트--%>
                <div class="pb-5 position-fixed kuttDS"
                     style="height: calc(100vh - 80px); width: 166px; overflow-y:scroll !important;">
                    <div>
                        <%--개별 토픽 컨테이너--%>
                        <c:forEach var="category" items="${categories}">
                            <div class="category-item d-flex mb-1 rounded-1 <c:if test="${search.categoryCode == category.categoryCode}">selected</c:if> bg-hover-whiten-light"
                                 data-category-code="${category.categoryCode}">
                                <a class="text-decoration-none" href="/category/${category.categoryCode}"
                                   style="width: 100%;">
                                    <div class="p-2 d-flex align-items-center" style="height: auto;">

                                            <%--토픽 아이콘--%>
                                        <div class="me-2">
                                            <div class="d-flex rounded-1 overflow-hidden">
                                                <img class="m-0" src="${category.categoryPhoto}" alt="IMG" width="18"
                                                     height="18">
                                            </div>
                                        </div>

                                            <%--카테고리 이름--%>
                                        <div class="d-flex">
                                            <div class="d-flex font-size-1">
                                                <div class="d-flex align-items-center justify-content-start">${category.categoryName}</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <%--질문글 리스트--%>
                <div style="width: 572px; margin-left: 172px;">
                    <div>
                        <div id="pair-list">

                            <c:forEach var="answerPair" items="${answerPairs}">

                                <%--질문글--%>
                                <div class="pair hide-object mb-3 mx-1" data-ques-no="${answerPair.quesNo}"
                                     data-ans-no="${answerPair.ansNo}">

                                        <%--배경색--%>
                                    <div class="rounded-3 bg-dark position-relative bg-hover-whiten position-relative overflow-hidden">
                                        <div class="QnA-section ps-3 pe-3 pt-4" style="height: 100%;">
                                            <div class="">

                                                    <%--질문글--%>
                                                <div>

                                                        <%--질문글 body--%>
                                                    <div>
                                                        <div>

                                                                <%--답변자 프로필--%>
                                                            <div class="mb-2 d-flex">

                                                                    <%--프로필 사진--%>
                                                                <div class="me-2 position-relative">
                                                                    <div>
                                                                        <img class="rounded-7 border border-color-whiten"
                                                                             src="/static/img/flower.jpeg" alt=""
                                                                             width="36" height="36">
                                                                    </div>
                                                                    <div class="bg-hover-darken position-absolute"
                                                                         style="inset: 0;">
                                                                    </div>
                                                                </div>

                                                                    <%--프로필 정보--%>
                                                                <div class="d-flex flex-column">

                                                                        <%--이름--%>
                                                                    <div class="my-auto font-size-1"><a
                                                                            class="text-decoration-none link-default-color hover-underline h6"
                                                                            href="/user/profile/${answerPair.userNo}"><strong>${answerPair.userName}</strong></a>
                                                                    </div>

                                                                        <%--상세--%>
                                                                    <div class="my-auto color-gray font-size-1">${answerPair.userOccupation}<span> · </span>${answerPair.answerRegDate}
                                                                    </div>

                                                                </div>
                                                            </div>

                                                                <%--질문글 내용--%>
                                                            <div>
                                                                <div class="d-flex justify-content-between">
                                                                        <%--Question title--%>
                                                                    <div class="question-text pe-2">
                                                                        <a class="hover-underline"
                                                                           href="/question/${answerPair.quesNo}"><strong
                                                                                style="line-height: 1.6;">${answerPair.question}</strong></a>
                                                                    </div>
                                                                        <%--Question close--%>
                                                                    <div class="position-absolute"
                                                                         style="top: 4px; right: 4px;">
                                                                        <div>
                                                                                    <span class="hide-button bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center"
                                                                                          style="width: 38px; height: 38px;"
                                                                                          data-ques-no="${answerPair.quesNo}"
                                                                                          data-toggle="description"
                                                                                          data-content="Hide">
                                                                                      <svg width="24" height="24"
                                                                                           viewBox="0 0 24 24"
                                                                                           xmlns="http://www.w3.org/2000/svg">
                                                                                        <path d="m16.243 7.757-8.486 8.486m8.486 0L7.757 7.757"
                                                                                              class="icon_svg-stroke"
                                                                                              fill="none"
                                                                                              fill-rule="evenodd"
                                                                                              stroke-linecap="round"
                                                                                              stroke="#666"
                                                                                              stroke-width="1.5"></path>
                                                                                      </svg>
                                                                                    </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <%--Answer--%>
                                                            <div class="answer pt-2 border-bottom-gray mt-1" data-ans-no="${answerPair.ansNo}" data-ques-no="${answerPair.quesNo}">
                                                                <div>

                                                                        <%--Content--%>
                                                                    <div>
                                                                        <div>

                                                                                <%--content--%>
                                                                            <div>

                                                                                    <%--Answer content--%>
                                                                                <div class="position-relative">
                                                                                    <div class="fade-post" style="">
                                                                                        <div class="answer-text" style="font-size: 15px; line-height: 1.5rem;">
                                                                                                ${answerPair.answer}
                                                                                            <div class="overflow-fade hidden" style="background: linear-gradient(to bottom, transparent 60%, rgb(24, 24, 24) 100%) !important;"></div>
                                                                                        </div>
                                                                                        <span class="readMore-button btn btn-primary rounded-pill hidden">More</span>
                                                                                    </div>
                                                                                </div>

                                                                                    <%--Footer--%>
                                                                                <div>

                                                                                        <%--Upvote/Downvote, Comment, Share, Option 버튼--%>
                                                                                    <div class="footer-container pe-1" data-ans-no="${answerPair.ansNo}">

                                                                                            <%--Container--%>
                                                                                        <div class="d-flex justify-content-center align-items-center my-1"
                                                                                             style="height: 46px;">

                                                                                                <%--div.Upvote/Downvote, Comment 버튼--%>
                                                                                            <div class="d-flex justify-content-center align-items-center">

                                                                                                    <%--Upvote/Downvote 버튼--%>
                                                                                                <div class="answer-like-container me-1 d-flex justify-content-center align-items-center">

                                                                                                        <%--Container--%>
                                                                                                    <div class="d-flex rounded-pill" role="button"
                                                                                                         style="background-color: rgba(255, 255, 255, 0.05); height: 30px;">

                                                                                                        <sec:authorize access="isAuthenticated()">
                                                                                                            <%--Like 버튼--%>
                                                                                                            <div class="answer-like-button d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill" data-ans-no="${answerPair.ansNo}">
                                                                                                                <div class="d-flex">
                                                                                                                    <div>
                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center">
                                                                            <svg width="20" height="20"
                                                                                 viewBox="0 0 24 24"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="M12 4 3 15h6v5h6v-5h6z"
                                                                                      stroke-width="1.5"
                                                                                      stroke="rgb(72, 148, 253)"
                                                                                      fill="none"
                                                                                      stroke-linejoin="round"></path>
                                                                            </svg>
                                                                        </span>
                                                                                                                    </div>
                                                                                                                    <div class="answer-like-cnt d-flex align-items-center justify-content-center"
                                                                                                                         style="font-size: 13px; margin-left: 2px;" data-ans-no="${answerPair.ansNo}">
                                                                                                                        <c:if test="${answerPair.likes > 0}">
                                                                                                                            ${answerPair.likes}
                                                                                                                        </c:if>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <%--Unlike 버튼--%>
                                                                                                            <div class="answer-dislike-button d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill" data-ans-no="${answerPair.ansNo}">
                                                                                                                <div class="d-flex">
                                                                                                                    <div>
                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center">
                                                                            <svg width="20" height="20"
                                                                                 viewBox="0 0 24 24"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="m12 20 9-11h-6V4H9v5H3z"
                                                                                      class="icon_svg-stroke icon_svg-fill"
                                                                                      stroke="#666" fill="none"
                                                                                      stroke-width="1.5"
                                                                                      stroke-linejoin="round"></path>
                                                                            </svg>
                                                                        </span>
                                                                                                                    </div>
                                                                                                                    <div class="answer-dislike-cnt d-flex align-items-center justify-content-center"
                                                                                                                         style="font-size: 13px; margin-left: 2px;" data-ans-no="${answerPair.ansNo}">
                                                                                                                        <c:if test="${answerPair.dislikes > 0}">
                                                                                                                            ${answerPair.dislikes}
                                                                                                                        </c:if>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </sec:authorize>

                                                                                                        <sec:authorize access="isAnonymous()">
                                                                                                            <%--Like 버튼--%>
                                                                                                            <div class="login-first d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill" data-ans-no="${answerPair.ansNo}">
                                                                                                                <div class="d-flex">
                                                                                                                    <div>
                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center">
                                                                            <svg width="20" height="20"
                                                                                 viewBox="0 0 24 24"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="M12 4 3 15h6v5h6v-5h6z"
                                                                                      stroke-width="1.5"
                                                                                      stroke="rgb(72, 148, 253)"
                                                                                      fill="none"
                                                                                      stroke-linejoin="round"></path>
                                                                            </svg>
                                                                        </span>
                                                                                                                    </div>
                                                                                                                    <div class="answer-like-cnt d-flex align-items-center justify-content-center"
                                                                                                                         style="font-size: 13px; margin-left: 2px;" data-ans-no="${answerPair.ansNo}">
                                                                                                                        <c:if test="${answerPair.likes > 0}">
                                                                                                                            ${answerPair.likes}
                                                                                                                        </c:if>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <%--Unlike 버튼--%>
                                                                                                            <div class="login-first d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill" data-ans-no="${answerPair.ansNo}">
                                                                                                                <div class="d-flex">
                                                                                                                    <div>
                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center">
                                                                            <svg width="20" height="20"
                                                                                 viewBox="0 0 24 24"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="m12 20 9-11h-6V4H9v5H3z"
                                                                                      class="icon_svg-stroke icon_svg-fill"
                                                                                      stroke="#666" fill="none"
                                                                                      stroke-width="1.5"
                                                                                      stroke-linejoin="round"></path>
                                                                            </svg>
                                                                        </span>
                                                                                                                    </div>
                                                                                                                    <div class="answer-dislike-cnt d-flex align-items-center justify-content-center"
                                                                                                                         style="font-size: 13px; margin-left: 2px;" data-ans-no="${answerPair.ansNo}">
                                                                                                                        <c:if test="${answerPair.dislikes > 0}">
                                                                                                                            ${answerPair.dislikes}
                                                                                                                        </c:if>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </sec:authorize>
                                                                                                    </div>
                                                                                                </div>

                                                                                                    <%--Comment 버튼--%>
                                                                                                <div class="comment-button"
                                                                                                     data-ans-no="${answerPair.ansNo}" role="button">

                                                                                                        <%--Container--%>
                                                                                                    <div>

                                                                                                            <%--Comment button--%>
                                                                                                        <div class="d-flex rounded-pill px-2 bg-hover-whiten">

                                                                                                                <%--Comment icon--%>
                                                                                                            <span class="d-inline-block d-flex align-items-center justify-content-center"
                                                                                                                  style="height: 30px;">
                                                                        <svg width="24" height="24"
                                                                             viewBox="0 0 24 24"
                                                                             xmlns="http://www.w3.org/2000/svg">
                                                                            <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z"
                                                                                  class="icon_svg-stroke icon_svg-fill"
                                                                                  stroke="#666" stroke-width="1.5"
                                                                                  fill="none"></path>
                                                                        </svg>
                                                                    </span>

                                                                                                                <%--Comment count--%>
                                                                                                            <div class="d-flex align-items-center justify-content-center color-gray">
                                                                                                                    <%--                                                                                ${answerPair.answerCommentCnt}--%>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                                <%--Options--%>
                                                                                            <div class="ms-auto d-flex">

                                                                                                    <%--Three dots--%>
                                                                                                <sec:authorize access="isAuthenticated()">
                                                                                                    <%--                                                                <c:if test="${user.username == answer.answerUserEmail}">--%>
                                                                                                    <div>
                                                                                                        <a tabindex="0" class="answer-option-button bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center"
                                                                                                           style="width: 38px; height: 38px;" data-ans-no="${answerPair.ansNo}">
                                                                                                            <svg class="d-block" width="24" height="24" viewBox="0 0 24 24"
                                                                                                                 xmlns="http://www.w3.org/2000/svg"><path
                                                                                                                    d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Z"
                                                                                                                    class="icon_svg-stroke" stroke-width="1.5" stroke="#666" fill="none"></path>
                                                                                                            </svg>
                                                                                                            <div class="answer-option-popover-content" style="display: none;">

                                                                                                                <div class="d-flex answer-popover-item" style="z-index: 999;" data-bs-toggle="modal" data-bs-target="#answer-modal" data-ans-no="${answerPair.ansNo}" data-ques-no="${answerPair.quesNo}" data-option-type="Edit">
                                                                                                                    <div class="py-1 px-3">Edit</div>
                                                                                                                </div>
                                                                                                                <div class="d-flex answer-popover-item" data-ans-no="${answerPair.ansNo}" data-ques-no="${answerPair.quesNo}" data-option-type="Delete">
                                                                                                                    <div class="py-1 px-3">Delete</div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                    <%--                                                                </c:if>--%>
                                                                                                </sec:authorize>


                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                                <%--Comment section--%>
                                                                            <div class="comment-section"
                                                                                 data-ans-no="${answerPair.ansNo}" style="display: none; margin: 0 -16px -2px -16px;">
                                                                                <div class="d-flex justify-content-between align-items-center px-3 py-2"
                                                                                     style="width: 100%; background-color: #202020;">

                                                                                        <%--Profile--%>
                                                                                    <a href="">
                                                                                        <div>
                                                                                            <img style="width: 36px; height: 36px;"
                                                                                                 src="/static/img/user.png" alt="">
                                                                                        </div>
                                                                                    </a>

                                                                                        <%--Comment input--%>
                                                                                    <div class="rounded-3 bg-black ms-2 py-1 px-3"
                                                                                         style="width: 100%;">
                                                                                        <form class="comment-form" action="" data-ans-no="${answerPair.ansNo}">
                                                                                            <input class="comment-text" type="text"
                                                                                                   name="answerComment"
                                                                                                   style="width: 100%; outline: none; border: none;"
                                                                                                   placeholder="Add a comment...">
                                                                                            <input class="comment-ans-no" type="hidden" name="ansNo" value="${answerPair.ansNo}">
                                                                                            <input class="comment-parent-co-no" type="hidden" name="parentCoNo" value="0">
                                                                                            <sec:csrfInput/>
                                                                                                <%--                                                        <sec:authorize access="isAuthenticated()">--%>
                                                                                                <%--                                                            <input type="hidden" name="userEmail" value="${user.username}">--%>
                                                                                                <%--                                                        </sec:authorize>--%>
                                                                                        </form>
                                                                                    </div>

                                                                                    <sec:authorize access="isAuthenticated()">
                                                                                        <%--Add button--%>
                                                                                        <span class="add-comment-button btn btn-primary d-flex align-items-center justify-content-center rounded-pill"
                                                                                              style="font-size: 13px; height: 30px; margin-left: 4px;"
                                                                                              data-co-level="0" data-co-no="0" data-parent-co-no="0" data-ans-no="${answerPair.ansNo}">
                                            <div style="white-space: nowrap;">Add comment
                                            </div>
                                        </span>
                                                                                    </sec:authorize>
                                                                                    <sec:authorize access="isAnonymous()">
                                                                                        <%--Add button--%>
                                                                                        <span class="login-first btn btn-primary d-flex align-items-center justify-content-center rounded-pill"
                                                                                              style="font-size: 13px; height: 30px; margin-left: 4px;"
                                                                                              data-co-level="0" data-co-no="0" data-parent-co-no="0" data-ans-no="${answerPair.ansNo}">
                                            <div style="white-space: nowrap;">Add comment
                                            </div>
                                        </span>
                                                                                    </sec:authorize>


                                                                                </div>

                                                                                    <%--Comments--%>
                                                                                <div class="bg-dark">
                                                                                    <div>

                                                                                            <%--Each comment--%>
                                                                                        <div class="comment-list px-3">

                                                                                        </div>

                                                                                            <%--View more comments--%>
                                                                                        <div>
                                                                                            <div class="pb-3 px-3">
                                                                                                <button class="view-more-comments btn d-flex justify-content-center align-items-center border-gray rounded-pill bg-black-light bg-hover-darken-strong py-0 px-3"
                                                                                                        style="height: 30px; width: 100%; font-weight: 500;" data-ans-no="${answerPair.ansNo}" data-parent-co-no="0">
                                                                                                    <div class="d-flex align-items-center">

                                                                                                            <%--Text--%>
                                                                                                        <div class="color-gray"
                                                                                                             style="font-size: 13px;">
                                                                                                            View more comments
                                                                                                        </div>

                                                                                                            <%--Arrow--%>
                                                                                                        <span>
                        <span>
                            <svg class="d-flex" width="16" height="16" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="m5 8.5 7 7 7.005-7" class="icon_svg-stroke"
                                      stroke="#666" stroke-width="1.5" fill="none"
                                      stroke-linecap="round"></path>
                            </svg>
                        </span>
                    </span>
                                                                                                    </div>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                                <%--답변글 내용--%>
<%--                                                            <div class="position-relative">--%>
<%--                                                                <div class="fade-post">--%>
<%--                                                                    <div class="" style="line-height: 1.5rem;">--%>
<%--                                                                            ${answerPair.answer}--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="overflow-fade hidden"></div>--%>
<%--                                                                </div>--%>
<%--                                                                <span class="readMore-button btn btn-primary rounded-pill hidden">More</span>--%>
<%--                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                </div>


<%--                                                    &lt;%&ndash;Upvote/Downvote, Comment, Share, Option 버튼&ndash;%&gt;--%>
<%--                                                <div class="footer-container pe-1" data-ans-no="${answerPair.ansNo}">--%>

<%--                                                        &lt;%&ndash;Container&ndash;%&gt;--%>
<%--                                                    <div class="d-flex justify-content-center align-items-center my-1"--%>
<%--                                                         style="height: 46px;">--%>

<%--                                                            &lt;%&ndash;div.Upvote/Downvote, Comment 버튼&ndash;%&gt;--%>
<%--                                                        <div class="d-flex justify-content-center align-items-center">--%>

<%--                                                                &lt;%&ndash;Upvote/Downvote 버튼&ndash;%&gt;--%>
<%--                                                            <div class="answer-like-container me-1 d-flex justify-content-center align-items-center">--%>

<%--                                                                    &lt;%&ndash;Container&ndash;%&gt;--%>
<%--                                                                <div class="d-flex rounded-pill" role="button"--%>
<%--                                                                     style="background-color: rgba(255, 255, 255, 0.05); height: 30px;">--%>
<%--                                                                    <sec:authorize access="isAuthenticated()">--%>
<%--                                                                        &lt;%&ndash;Like 버튼&ndash;%&gt;--%>
<%--                                                                        <div class="answer-like-button d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill"--%>
<%--                                                                             data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                            <div class="d-flex">--%>
<%--                                                                                <div>--%>
<%--                                                                                <span class="d-inline-block d-flex align-items-center justify-content-center">--%>
<%--                                                                                    <svg width="20" height="20"--%>
<%--                                                                                         viewBox="0 0 24 24"--%>
<%--                                                                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                                        <path d="M12 4 3 15h6v5h6v-5h6z"--%>
<%--                                                                                              stroke-width="1.5"--%>
<%--                                                                                              stroke="rgb(72, 148, 253)"--%>
<%--                                                                                              fill="none"--%>
<%--                                                                                              stroke-linejoin="round"></path>--%>
<%--                                                                                    </svg>--%>
<%--                                                                                </span>--%>
<%--                                                                                </div>--%>
<%--                                                                                <div class="answer-like-cnt d-flex align-items-center justify-content-center"--%>
<%--                                                                                     style="font-size: 13px; margin-left: 2px;"--%>
<%--                                                                                     data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                                    <c:if test="${answerPair.likes > 0}">--%>
<%--                                                                                        ${answerPair.likes}--%>
<%--                                                                                    </c:if>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        &lt;%&ndash;Unlike 버튼&ndash;%&gt;--%>
<%--                                                                        <div class="answer-dislike-button d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill"--%>
<%--                                                                             data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                            <div class="d-flex">--%>
<%--                                                                                <div>--%>
<%--                                                                                <span class="d-inline-block d-flex align-items-center justify-content-center">--%>
<%--                                                                                    <svg width="20" height="20"--%>
<%--                                                                                         viewBox="0 0 24 24"--%>
<%--                                                                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                                        <path d="m12 20 9-11h-6V4H9v5H3z"--%>
<%--                                                                                              class="icon_svg-stroke icon_svg-fill"--%>
<%--                                                                                              stroke="#666" fill="none"--%>
<%--                                                                                              stroke-width="1.5"--%>
<%--                                                                                              stroke-linejoin="round"></path>--%>
<%--                                                                                    </svg>--%>
<%--                                                                                </span>--%>
<%--                                                                                </div>--%>
<%--                                                                                <div class="answer-dislike-cnt d-flex align-items-center justify-content-center"--%>
<%--                                                                                     style="font-size: 13px; margin-left: 2px;"--%>
<%--                                                                                     data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                                    <c:if test="${answerPair.dislikes > 0}">--%>
<%--                                                                                        ${answerPair.dislikes}--%>
<%--                                                                                    </c:if>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>

<%--                                                                    </sec:authorize>--%>
<%--                                                                    <sec:authorize access="isAnonymous()">--%>
<%--                                                                        &lt;%&ndash;Like 버튼&ndash;%&gt;--%>
<%--                                                                        <div class="login-first d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill"--%>
<%--                                                                             data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                            <div class="d-flex">--%>
<%--                                                                                <div>--%>
<%--                                                                                <span class="d-inline-block d-flex align-items-center justify-content-center">--%>
<%--                                                                                    <svg width="20" height="20"--%>
<%--                                                                                         viewBox="0 0 24 24"--%>
<%--                                                                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                                        <path d="M12 4 3 15h6v5h6v-5h6z"--%>
<%--                                                                                              stroke-width="1.5"--%>
<%--                                                                                              stroke="rgb(72, 148, 253)"--%>
<%--                                                                                              fill="none"--%>
<%--                                                                                              stroke-linejoin="round"></path>--%>
<%--                                                                                    </svg>--%>
<%--                                                                                </span>--%>
<%--                                                                                </div>--%>
<%--                                                                                <div class="answer-like-cnt d-flex align-items-center justify-content-center"--%>
<%--                                                                                     style="font-size: 13px; margin-left: 2px;"--%>
<%--                                                                                     data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                                    <c:if test="${answerPair.likes > 0}">--%>
<%--                                                                                        ${answerPair.likes}--%>
<%--                                                                                    </c:if>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        &lt;%&ndash;Unlike 버튼&ndash;%&gt;--%>
<%--                                                                        <div class="login-first d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill"--%>
<%--                                                                             data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                            <div class="d-flex">--%>
<%--                                                                                <div>--%>
<%--                                                                                <span class="d-inline-block d-flex align-items-center justify-content-center">--%>
<%--                                                                                    <svg width="20" height="20"--%>
<%--                                                                                         viewBox="0 0 24 24"--%>
<%--                                                                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                                        <path d="m12 20 9-11h-6V4H9v5H3z"--%>
<%--                                                                                              class="icon_svg-stroke icon_svg-fill"--%>
<%--                                                                                              stroke="#666" fill="none"--%>
<%--                                                                                              stroke-width="1.5"--%>
<%--                                                                                              stroke-linejoin="round"></path>--%>
<%--                                                                                    </svg>--%>
<%--                                                                                </span>--%>
<%--                                                                                </div>--%>
<%--                                                                                <div class="answer-dislike-cnt d-flex align-items-center justify-content-center"--%>
<%--                                                                                     style="font-size: 13px; margin-left: 2px;"--%>
<%--                                                                                     data-ans-no="${answerPair.ansNo}">--%>
<%--                                                                                    <c:if test="${answerPair.dislikes > 0}">--%>
<%--                                                                                        ${answerPair.dislikes}--%>
<%--                                                                                    </c:if>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>

<%--                                                                    </sec:authorize>--%>
<%--                                                                  </div>--%>
<%--                                                            </div>--%>

<%--                                                                &lt;%&ndash;Comment 버튼&ndash;%&gt;--%>
<%--                                                            <div class="comment-button"--%>
<%--                                                                 data-ans-no="${answerPair.ansNo}" role="button">--%>

<%--                                                                    &lt;%&ndash;Container&ndash;%&gt;--%>
<%--                                                                <div>--%>

<%--                                                                        &lt;%&ndash;Comment button&ndash;%&gt;--%>
<%--                                                                    <div class="d-flex rounded-pill px-2 bg-hover-whiten">--%>

<%--                                                                            &lt;%&ndash;Comment icon&ndash;%&gt;--%>
<%--                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center"--%>
<%--                                                                              style="height: 30px;">--%>
<%--                                                                            <svg width="24" height="24"--%>
<%--                                                                                 viewBox="0 0 24 24"--%>
<%--                                                                                 xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                                <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z"--%>
<%--                                                                                      class="icon_svg-stroke icon_svg-fill"--%>
<%--                                                                                      stroke="#666" stroke-width="1.5"--%>
<%--                                                                                      fill="none"></path>--%>
<%--                                                                            </svg>--%>
<%--                                                                        </span>--%>

<%--                                                                            &lt;%&ndash;Comment count&ndash;%&gt;--%>
<%--                                                                        <div class="comment-count d-flex align-items-center justify-content-center color-gray">--%>
<%--                                                                                ${answerPair.commentCnt}--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>

<%--                                                            &lt;%&ndash;Options&ndash;%&gt;--%>
<%--                                                        <div class="ms-auto d-flex">--%>

<%--                                                                &lt;%&ndash;Share button&ndash;%&gt;--%>
<%--                                                            <div>--%>
<%--                                                                <div>--%>
<%--                                                                    <a tabindex="0"--%>
<%--                                                                       class="share-button bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center"--%>
<%--                                                                       style="width: 38px; height: 38px;"--%>
<%--                                                                       data-toggle="description"--%>
<%--                                                                       data-content="Copy Link">--%>
<%--                                                                        <svg width="24" height="24" viewBox="0 0 24 24"--%>
<%--                                                                             xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                                            <path d="m21 12-9.778-8v5.333c-1.926.45-3.5 1.172-4.722 2.167-1.222.995-2.389 2.495-3.5 4.5 1.333-.659 2.833-1.157 4.5-1.496 1.667-.34 2.908-.285 3.722.163V20L21 12Z"--%>
<%--                                                                                  class="icon_svg-stroke" stroke="#666"--%>
<%--                                                                                  fill="none" stroke-width="1.5"--%>
<%--                                                                                  stroke-linejoin="round"></path>--%>
<%--                                                                        </svg>--%>
<%--                                                                    </a>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                                &lt;%&ndash;                                                                &lt;%&ndash;Three dots&ndash;%&gt;&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                            <sec:authorize access="isAuthenticated()">&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                <c:if test="${user.username == answerPair.userEmail}">&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                    <div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                        <a tabindex="0" class="answer-option-button bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center"&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                              style="width: 38px; height: 38px;">&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                            <svg class="d-block" width="24" height="24" viewBox="0 0 24 24"&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                 xmlns="http://www.w3.org/2000/svg"><path&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                    d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Z"&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                    class="icon_svg-stroke" stroke-width="1.5" stroke="#666" fill="none"></path>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                            </svg>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                            <div class="answer-option-popover-content" style="display: none;">&ndash;%&gt;--%>

<%--                                                                &lt;%&ndash;                                                                                <div class="d-flex answer-popover-item option" data-ans-no="${answerPair.ansNo}" data-ques-no="${answerPair.quesNo}" data-option-type="Edit">&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                    <div class="py-1 px-3">Edit</div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                </div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                <div class="d-flex answer-popover-item option" data-ans-no="${answerPair.ansNo}" data-ques-no="${answerPair.quesNo}" data-option-type="Delete">&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                    <div class="py-1 px-3">Delete</div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                                </div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                            </div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                        </a>&ndash;%&gt;--%>

<%--                                                                &lt;%&ndash;                                                                    </div>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                                </c:if>&ndash;%&gt;--%>
<%--                                                                &lt;%&ndash;                                                            </sec:authorize>&ndash;%&gt;--%>


<%--                                                        </div>--%>

<%--                                                    </div>--%>
<%--                                                </div>--%>
                                            </div>
                                        </div>

                                            <%--Comment section--%>
                                        <div class="comment-section"
                                             data-ans-no="${answerPair.ansNo}" style="display: none;">
                                            <div class="d-flex justify-content-between align-items-center px-3 py-2"
                                                 style="width: 100%; background-color: #202020;">

                                                    <%--Profile--%>
                                                <a href="">
                                                    <div>
                                                        <img style="width: 36px; height: 36px;"
                                                             src="/static/img/user.png" alt="">
                                                    </div>
                                                </a>

                                                    <%--Comment input--%>
                                                <div class="rounded-3 bg-black ms-2 py-1 px-3"
                                                     style="width: 100%;">
                                                    <form class="comment-form" action="">
                                                        <input class="" type="text"
                                                               name="answerComment"
                                                               style="width: 100%; outline: none; border: none;"
                                                               placeholder="Add a comment...">
                                                        <input type="hidden" name="ansNo" value="${answerPair.ansNo}">
                                                        <input type="hidden" name="parentCoNo" value="0">
                                                        <sec:csrfInput/>
                                                    </form>
                                                </div>
                                                <sec:authorize access="isAuthenticated()">
                                                <span class="add-comment-button btn btn-primary d-flex align-items-center justify-content-center rounded-pill"
                                                      style="font-size: 13px; height: 30px; margin-left: 4px;"
                                                      data-co-level="0" data-co-no="0" data-parent-co-no="0"
                                                      data-ans-no="${answerPair.ansNo}">
                                                    <div style="white-space: nowrap;">Add comment</div>
                                                </span>
                                                </sec:authorize>

                                                <sec:authorize access="isAnonymous()">
                                                <span class="login-first btn btn-primary d-flex align-items-center justify-content-center rounded-pill"
                                                      style="font-size: 13px; height: 30px; margin-left: 4px;"
                                                      data-co-level="0" data-co-no="0" data-parent-co-no="0"
                                                      data-ans-no="${answerPair.ansNo}">
                                                    <div style="white-space: nowrap;">Add comment</div>
                                                </span>
                                                </sec:authorize>
                                                    <%--Add button--%>

                                            </div>

                                                <%--Comments--%>
                                            <div class="bg-dark">
                                                <div>

                                                        <%--Each comment--%>
                                                    <div class="comment-list px-3 pt-2">

                                                    </div>

                                                        <%--View more comments--%>
                                                    <div>
                                                        <div class="pb-3 px-3">
                                                            <button class="view-more-comments btn d-flex justify-content-center align-items-center border-gray rounded-pill bg-black-light bg-hover-darken-strong py-0 px-3"
                                                                    style="height: 30px; width: 100%; font-weight: 500;"
                                                                    data-ans-no="${answerPair.ansNo}"
                                                                    data-parent-co-no="0">
                                                                <div class="d-flex align-items-center">

                                                                        <%--Text--%>
                                                                    <div class="color-gray"
                                                                         style="font-size: 13px;">
                                                                        View more comments
                                                                    </div>

                                                                        <%--Arrow--%>
                                                                    <span>
                                                                        <span>
                                                                            <svg class="d-flex" width="16" height="16"
                                                                                 viewBox="0 0 24 24"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="m5 8.5 7 7 7.005-7"
                                                                                      class="icon_svg-stroke"
                                                                                      stroke="#666" stroke-width="1.5"
                                                                                      fill="none"
                                                                                      stroke-linecap="round"></path>
                                                                            </svg>
                                                                        </span>
                                                                    </span>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${fn:length(answerPairs) <= 0}">

                                <div class="QnA-container mb-3 mx-1">

                                        <%--배경색--%>
                                    <div class="rounded-3 bg-dark position-relative bg-hover-whiten"
                                         style="height: calc(95vh - 80px);">
                                        <div class="QnA-section d-flex px-4 justify-content-center align-items-center"
                                             style="height: 100%;">
                                            <div id="no-content" class="pb-4" style="width: 100%;">
                                                <div class="d-flex justify-content-center">
                                                    <img src="/static/img/noContent.png" alt="" height="100"
                                                         width="100">
                                                </div>
                                                <div class="text-center color-gray-light" style="font-size: 13px;">등록된
                                                                                                                   질문이
                                                                                                                   없습니다.
                                                </div>
                                            </div>
                                        </div>

                                            <%--Comment section--%>
                                    </div>
                                </div>


                            </c:if>
                        </div>
                    </div>
                </div>

                <%--                &lt;%&ndash;주간 조회, 좋아요 베스트&ndash;%&gt;--%>
                <%--                <div class="position-fixed" style="width: 238px; margin-left: 758px;">--%>

                <%--                    &lt;%&ndash;주간 조회수 베스트&ndash;%&gt;--%>
                <%--                    <div class="bg-dark rounded-3 mb-2">--%>
                <%--                        <div class="px-4 py-2 border-bottom-gray">--%>
                <%--                            <div class="text-center">--%>
                <%--                                <b>Most viewed</b>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>

                <%--                        <div class="best-title px-3 bg-hover-whiten-light py-1 dark border-bottom-gray"--%>
                <%--                             style="transition: height 250ms; height: 32px; overflow: hidden;">--%>
                <%--                            <div>--%>
                <%--                                <div>--%>
                <%--                                    <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 206px;">--%>
                <%--                                        hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>

                <%--                    </div>--%>

                <%--                    &lt;%&ndash;주간 좋아요 베스트&ndash;%&gt;--%>
                <%--                    <div class="bg-dark rounded-3">--%>
                <%--                        <div class="px-4 py-2 border-bottom-gray">--%>
                <%--                            <div class="text-center">--%>
                <%--                                <b>Most liked</b>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>

                <%--                        <div class="best-title px-3 bg-hover-whiten-light py-1 dark border-bottom-gray"--%>
                <%--                             style="transition: height 250ms; height: 32px; overflow: hidden;">--%>
                <%--                            <div>--%>
                <%--                                <div>--%>
                <%--                                    <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 206px;">--%>
                <%--                                        hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

            </div>
        </div>
    </div>


    <%@ include file="/WEB-INF/views/modals/question.jsp" %>
    <%@ include file="/WEB-INF/views/modals/answer.jsp" %>


    <script src="/static/js/utils.js"></script>
    <script src="/static/js/main.js"></script>
    <script src="/static/js/comment.js"></script>
    <script src="/static/js/answer.js"></script>
    <script src="/static/js/liking.js"></script>
    <script src="/static/js/question.js"></script>
    <script src="/static/js/getMorePairs.js"></script>


</body>
</html>
