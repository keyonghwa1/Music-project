package MemberAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/member/insert.korea")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
 
		String phone = phone1 + phone2 + phone3;			

		MemberVO vo = new MemberVO(0, name, id, pw, age, phone, 2); 
		MemberDAO.getInstance().insert(vo);
		
		String type = request.getParameter("type");
		if(type==null || type.equals("")) {
			response.sendRedirect("joininsert.jsp");
		}
		else {
			String param 		= "android"; // param의 값
			String resultStr 	= ""; // 전송될 json 문자열
			resultStr = String.format("[{'param':'%s'}]", param);
			// 이거 해줘야 됨~~ json으로 줄 때
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().println( resultStr );
		}
	}
}
