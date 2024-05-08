<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="userid.UserDTO"%>
<%@ page import="userid.userDAO"%>
<%@ page import="utill.DatabaseUtill"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // �� �������� Sign_up���� ����ڰ� �Է��� ���� DB�� �־��ִ� �κ�
    request.setCharacterEncoding("EUC-KR");
    String userID = null;
    String userPassword = null;
    PrintWriter script = response.getWriter();

    // userID�� �Է¹޴� �κ�
    userID = request.getParameter("user_id");
    userPassword = request.getParameter("user_password");
    // userPassword�� �Է¹޴� �κ�

    if (userID == null || userPassword == null) {
        script.println("<script>");
        // ����ڰ� ID,PW �� ���� ��� �Է����� ������ �߻��ϴ� �˶�
        script.println("alert('Check your account');");
        // �ٽ� �������� �������� �ѱ�� ��
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    UserDTO userDTO = new UserDTO();
    userDTO.setUserID(userID);
    userDTO.setUserPassword(userPassword);

    userDAO userDAO = new userDAO();
    int result = userDAO.Sign_up(userDTO);

    if (result == 1) {
        script.println("<script>");
        // ����ڰ� ȸ������ ������ �ߴ� �˶�
        script.println("alert('Join!!');");
        // �α��� ���� �� ���� ȭ������ �̵�
        script.println("location.href ='login.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>
