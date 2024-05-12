<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="userid.UserDTO"%>
<%@ page import="userid.userDAO"%>
<%@ page import="utill.DatabaseUtill"%>
<%@ page import="java.io.PrintWriter"%>

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

    if(userID == null || userPassword == null){
        script.println("<script>");
        // ����ڰ� ID, PW �� ���� ��� �Է����� ������ �߻��ϴ� �˶�
        script.println("alert('Check your account');");
        // �ٽ� �������� �������� �ѱ�� ��
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    userDAO userDAO = new userDAO();
    if (!userID.matches("[A-Za-z0-9_]+") || !userPassword.matches("[A-Za-z0-9_]+")) {
        script.println("<script>alert('Invalid user ID.'); history.back();</script>");
        script.close();
        return;
    }
    int result = userDAO.login(userID, userPassword); // �α��� �õ�
    if(result == 1){
        // �α��� ���� �� ������ �����ϰ� ���� �������� �̵�
        session.setAttribute("userID", userID);
        response.sendRedirect("Main.jsp");
    } else {
        // �α��� ���� �� �˸��� ���� ���� �������� �̵�
        script.println("<script>");
        script.println("alert('Login failed. Check your ID and password.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
%>
