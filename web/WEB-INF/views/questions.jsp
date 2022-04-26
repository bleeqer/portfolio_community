<%--
  Created by IntelliJ IDEA.
  User: linux-king
  Date: 2/13/22
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Title</title>

  <%--Jquery--%>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <%--Tinymce--%>
  <script src="https://cdn.tiny.cloud/1/gus813frvbl3fe4mc223cqoe7nmtzbc5kbk3xc2dzvawxe52/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

  <sec:csrfMetaTags/>

  <%--  Bootstrap  --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  <%-- Bootstrap Icon --%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

  <%--CSS--%>
  <link rel="stylesheet" type="text/css" href="/static/css/utils.css">
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">

  <style>
    input, textarea, button, a {
      color: rgb(213, 214, 214);
      background-color: transparent;
    }

    html, body {
      box-sizing: border-box;
      padding: 0;
      margin: 0;
      font-size: 16px;
      border: none;
      background-color: #181818;
      color: rgb(213, 214, 214);
    }

    select:focus {
      outline: none;
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
        <div class="d-flex mx-auto" style="max-width: 1002px;">

          <%--카테고리 리스트--%>
          <div class="pb-5 position-fixed" style="width: 166px;">
            <div>

              <%--개별 카테고리 컨테이너--%>
              <div class="mb-1 rounded-1 bg-hover-whiten-light">
                <a class="text-decoration-none" href="">
                  <div class="p-2 d-flex" style="height: auto;">
                    <%--카테고리 아이콘--%>
                    <div class="me-2">
                      <div class="d-flex rounded-1 overflow-hidden">
                        <img width="18" height="18" src="/static/img/python.jpeg" alt="IMG">
                      </div>
                    </div>

                    <%--카테고리 이름--%>
                    <div class="d-flex">
                      <div class="d-flex font-size-1">
                        <div class="text-center d-flex align-items-center">Python</div>
                      </div>
                    </div>
                  </div>
                </a>
              </div>

            </div>
          </div>

          <%--질문글 리스트--%>
          <div style="width: 572px; margin-left:172px;">
            <div>
              <div>
                <%--질문글--%>
                <div class="mb-3 mx-1">

                  <%--배경색--%>
                  <div class="rounded-3 shadow-sm border border-color-dark bg-dark position-relative">

                    <%--Questions for you--%>
                    <div class="px-3 py-2 border-bottom-gray">
                      <div class="d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                          <div class="d-inline-flex rounded-2 overflow-hidden">
                            <div class="d-flex justify-content-center align-items-center bg-red" style="width: 24px; height: 24px;">
                            <span class="d-inline-flex justify-content-center align-items-center" style="width: 16px; height: 16px; line-height: 16px;">
                              <svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="m12 16.618-4.944 2.599L8 13.71 4 9.812l5.528-.803L12 4l2.472 5.01L20 9.811l-4 3.9.944 5.505z" stroke="rgb(255, 255, 255)" stroke-width="2.1" fill="rgb(255, 255, 255)" stroke-linejoin="round"></path>
                              </svg>
                            </span>
                            </div>
                          </div>
                          <div class="d-inline-flex ms-2">
                            <div class="color-gray" style="font-size: 13px;">
                              Questions for you
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="" style="height: 100%;">
                      <div>
                        <%--질문글--%>
                        <div>
                          <div class="unanswered-question pt-3 px-3 border-bottom-gray">
                            <div>
                              <div>
                                <%--title and close--%>
                                <div>
                                  <div class="d-flex justify-content-between position-relative">
                                    <%--Question title--%>
                                    <div class="pe-2">
                                      <a class="hover-underline" href=""><b>Is this the content of the questions?</b></a>
                                    </div>
                                    <%--Question close--%>
                                    <div class="position-absolute" style="top: -12px; right: -12px;">
                                      <div>
                                        <span class="bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                          <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path d="m16.243 7.757-8.486 8.486m8.486 0L7.757 7.757" class="icon_svg-stroke" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke="#666" stroke-width="1.5"></path>
                                          </svg>
                                        </span>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                                <%--Posted date--%>
                                <div class="mt-2 color-gray" style="font-size: 13px;">
                                  <div>
                                    <div>
                                      asked 00 ago
                                    </div>
                                  </div>
                                </div>

                                <%--Question footer--%>
                                <div class="mt-1">
                                  <div style="padding-top: 1px; padding-bottom: 1px;">
                                    <div class="d-flex justify-content-between align-items-center">
                                      <div class="d-flex">
                                        <%--Answer button--%>
                                        <button class="px-2 rounded-pill bg-hover-whiten-light" style="margin-left: -0.5rem; height: 38px; min-width: 38px; outline: none; border: none; transition: background-color 125ms;" data-bs-toggle="modal" data-bs-target="#answer-modal">
                                          <div class="d-flex justify-content-center align-items-center">
                                            <%--Answer icon--%>
                                            <div>
                                              <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <g stroke-width="1.5" fill="none" fill-rule="evenodd">
                                                  <path d="M18.571 5.429h0a2 2 0 0 1 0 2.828l-9.9 9.9-4.24 1.416 1.412-4.245 9.9-9.9h0a2 2 0 0 1 2.828 0Z" stroke="rgb(72, 148, 253)" stroke-linecap="round" stroke-linejoin="round"></path>
                                                  <path fill="#666" d="m4.429 19.571 2.652-.884-1.768-1.768z"></path>
                                                  <path d="M14.5 19.5h5v-5m-10-10h-5v5"  stroke="rgb(72, 148, 253)" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </g>
                                              </svg>
                                            </div>
                                            <%--Answer text--%>
                                            <div class="color-gray ms-1" style="font-size: 14px;">
                                              <div>Answer</div>
                                            </div>
                                          </div>
                                        </button>

                                        <%--Comment 버튼--%>
                                        <div role="button">

                                          <%--Container--%>
                                          <div class="d-inline">

                                            <%--Comment button--%>
                                            <div class="d-flex rounded-pill px-2 bg-hover-whiten-light">

                                              <%--Comment icon--%>
                                              <span class="d-inline-block d-flex align-items-center justify-content-center" style="height: 38px;">
                                              <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z" class="icon_svg-stroke icon_svg-fill" stroke="#666" stroke-width="1.5" fill="none"></path>
                                              </svg>
                                            </span>

                                              <%--Comment count--%>
                                              <div class="d-flex align-items-center justify-content-center color-gray">
                                                100
                                              </div>
                                            </div>
                                          </div>
                                        </div>

                                        <%--Pass button--%>
                                        <button class="px-2 rounded-pill bg-hover-whiten-light" style="height: 38px; min-width: 38px; outline: none; border: none; transition: background-color 125ms;">
                                          <div class="d-flex justify-content-center align-items-center">
                                            <%--Answer icon--%>
                                            <div>
                                              <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <g fill="none" fill-rule="evenodd">
                                                  <path d="m11.828 9.314 3.9-3.9a2 2 0 1 1 2.828 2.829l-3.9 3.9m-3.535 3.535-2.464 2.464-4.241 1.416 1.412-4.244 2.465-2.465" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" stroke-linecap="square" stroke-linejoin="round"></path>
                                                  <path class="icon_svg-fill_as_stroke" fill="#666" d="m4.414 19.556 2.652-.884-1.768-1.767z"></path>
                                                  <path d="M4.636 5.636 18.5 19.5" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" stroke-linecap="round"></path>
                                                </g>
                                              </svg>
                                            </div>
                                            <%--Answer text--%>
                                            <div class="color-gray ms-1" style="font-size: 14px;">
                                              <div>Pass</div>
                                            </div>
                                          </div>
                                        </button>
                                      </div>

                                      <%--Options--%>
                                      <div class="ms-auto d-flex">

                                        <%--Share button--%>
                                        <div>
                                          <div>
                                            <span class="bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                              <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="m21 12-9.778-8v5.333c-1.926.45-3.5 1.172-4.722 2.167-1.222.995-2.389 2.495-3.5 4.5 1.333-.659 2.833-1.157 4.5-1.496 1.667-.34 2.908-.285 3.722.163V20L21 12Z" class="icon_svg-stroke" stroke="#666" fill="none" stroke-width="1.5" stroke-linejoin="round"></path>
                                              </svg>
                                            </span>
                                          </div>
                                        </div>

                                        <%--Three dots--%>
                                        <div>
                                          <span class="bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                            <svg class="d-block" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                              <path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Z"
                                                    class="icon_svg-stroke" stroke-width="1.5" stroke="#666" fill="none">
                                              </path>
                                            </svg>
                                          </span>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <%--주간 조회, 좋아요 베스트--%>
          <div style="width: 238px; margin-left: 20px;">

            <%--주간 조회수 베스트--%>
            <div class="bg-dark rounded-3 mb-2">
              <div class="px-4 py-2 border-bottom-gray">
                <div class="text-center">
                  <b>Filter</b>
                </div>
              </div>

              <div class="best-title dark">
                <div>
                  <%--Date filter--%>
                  <div>
                    <div class="cursor-pointer bg-hover-whiten-light d-flex justify-content-center">
                      <div class="d-flex">
                        <div class="my-auto me-2 rounded-1 position-relative" style="border: 2px solid #bdbdbd !important; width: 15px; height: 15px;">
                          <div class="position-absolute hidden" style="top: -20%; left: 70%; transform: translate(-50%, -50%);">
                            <div style="border-bottom: 4px solid #1E90FF; border-right: 5px solid #1E90FF; transform: rotate(0.125turn); width: 10px; height: 15px;"></div>
                          </div>
                        </div>
                        <div class="text-center" style="font-size: 18px; line-height: 45px; height: 45px;">
                          TODAY
                        </div>
                      </div>
                    </div>
                    <div class="cursor-pointer bg-hover-whiten-light d-flex justify-content-center">
                      <div class="d-flex">
                        <div class="my-auto me-2 rounded-1 position-relative" style="border: 2px solid #bdbdbd !important; width: 15px; height: 15px;">
                          <div class="position-absolute hidden" style="top: -20%; left: 70%; transform: translate(-50%, -50%);">
                            <div style="border-bottom: 4px solid #1E90FF; border-right: 5px solid #1E90FF; transform: rotate(0.125turn); width: 10px; height: 15px;"></div>
                          </div>
                        </div>
                        <div class="text-center" style="font-size: 18px; line-height: 45px; height: 45px;">
                          LAST WEEK
                        </div>
                      </div>
                    </div>
                    <div class="cursor-pointer bg-hover-whiten-light d-flex justify-content-center">
                      <div class="d-flex">
                        <div class="my-auto me-2 rounded-1 position-relative" style="border: 2px solid #bdbdbd !important; width: 15px; height: 15px;">
                          <div class="position-absolute hidden" style="top: -20%; left: 70%; transform: translate(-50%, -50%);">
                            <div style="border-bottom: 4px solid #1E90FF; border-right: 5px solid #1E90FF; transform: rotate(0.125turn); width: 10px; height: 15px;"></div>
                          </div>
                        </div>
                        <div class="text-center" style="font-size: 18px; line-height: 45px; height: 45px;">
                          LAST MONTH
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <%@ include file="/WEB-INF/views/modals/question.jsp" %>
  <%@ include file="/WEB-INF/views/modals/answer.jsp" %>

  <%--JS--%>
  <script type="text/javascript" src="/static/js/questions.js"></script>
</body>



</html>
