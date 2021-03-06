<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="db.DBManager"%>
<%@ page import="java.sql.*"%>
<%@ include file="/inc/lib.jsp"%>
<%
	/*
	수정 요청을 처리하는 jsp ... 수정후  상세보기 페이지로 전환할 것이므로, 
	디자인이 필요없고 오직 db 로직만 잇으면 됨..
	*/
	request.setCharacterEncoding("utf-8"); //전송 파라미터들에 대한 인코딩처리!!(받기전에 처리하자!!)
	String author		=  request.getParameter("author"); //작성자
	String title			=  request.getParameter("title"); //제목
	String content	=  request.getParameter("content"); //내용
	String notice_id	=  request.getParameter("notice_id"); //notice_id
	String sql="update notice set author='"+author+"', title='"+title+"',  content='"+content+"' ";		
	sql+=" where  notice_id="+notice_id;
	out.print("수정에 사용할 SQL문: "+sql);
	
	DBManager dbManager = new DBManager();
	Connection con=null;
	PreparedStatement pstmt=null;
	con=dbManager.getConnection();
	pstmt=con.prepareStatement(sql); //쿼리준비
	int result = pstmt.executeUpdate(); //DML쿼리수행
	
	if(result==0){
		out.print(getMsgBack("수정 실패!"));
	}else{
		out.print(getMsgURL("수정 성공!", "detail.jsp?notice_id="+notice_id));
	}
	dbManager.release(con, pstmt);//자원해제
%>