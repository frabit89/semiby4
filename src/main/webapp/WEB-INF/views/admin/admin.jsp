<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<jsp:include page="../layout/header.jsp"/>

<style>
  #searchForm  div {
    float: left;
  }
</style>

<h1 class="title">관리자 메인</h1>
 
<form class="search-form" id="searchForm">
  <div class="search-container">
    
    <div>
    <label class="search-user">
       <input autofocus id="searchList" maxlength="100" id="email" placeholder="유저아이디를 입력하세요." type="text">
    </label>
    </div>
    
    <button type="button" class="search-user" id="search-button" >검색</button>
 
 </div>
 <div class="search-list">
    <div class="member-list">
    <table class="admin_board_wrap" id="user-admin">
      <thead class="admin_boardList">
        <tr>
          <td>이름</td>      
          <td>이메일</td>      
          <td>가입일</td>      
          <td>게시글수</td>      
          <td>댓글수</td>  
        </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${UserDto}">    <!-- mapper의 resultMap값을 items에 넣음 -->
          <tr class="admin_board_content">
            <td><a class="mypage user_id" value="${vo.id}" data-user-id="${vo.id}">${vo.id}</a></td>
            <td>${vo.name}</td>
            <td>${vo.signupDt}</td>
            <td><a href="#" class="boardList_admin" data-user-email="${vo.email}">${vo.boardCnt}</a></td>
            <td><a href="#" class="comment_admin" data-user-email="${vo.email}">${vo.commentCnt}</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
 </div>   
</form>




<script>



const fnUserList = () => {
  $.ajax({
    type: 'POST',
    url: '${contextPath}/admin/getuserInfo.do',
    data: 'id=' + $('.user_id').data('.userId'),
    dataType: 'json',
    success: function(resData) {
      var resData = "user_id : " + res["user_id"]+", name : "+ res["name"]+", signupDt : "+ res["signupDt"]+", boardCnt : "+ res["boardCnt"]+", commentCnt : "+ res["commentCnt"];
      $('.admin_board_content').innerHTML(resData);
    }, error: function() {
      console.log(1);
    }
  });
}


  
fnUserList();

  
</script>

<%@ include file="../layout/footer.jsp" %>