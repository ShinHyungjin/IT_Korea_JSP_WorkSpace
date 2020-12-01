<%
/*
JSP : Java Server Page (자바가 서버에서 실행)

1.지시영역 '@' 지시어를 사용하여 페이지 인코딩,임포트,파일형식 등의 설정정보 선언

2.선언부 '!' 영역구분문자를 사용하여 선언부	멤버변수와 멤버메서드 작성 영역 

3.스크립틀릿

4.표현식 'out.print()' 의 단축표현식인 = 을 이용


*/
%>

<%@ page contentType="text/html;charset=utf-8"%>
<%!
	public String getMsg() {
		return "hi";
	}
%>
<%
	for(int i=0; i<10; i++) {
		out.print("jsp실행 결과 출력" + i + "\t 번째\n\n");
	}

	out.print(getMsg());
%>

<%=getMsg()%>