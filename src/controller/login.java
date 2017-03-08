package controller;

import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = new User();
        u.setEmail(request.getParameter("email"));
        u.setPassword(request.getParameter("pass"));
        boolean verify = u.checkLogin();


        if (verify)
        {
            u = u.getUser(u.getEmail(), u.getPassword());

            HttpSession session = request.getSession();
            session.setAttribute("logged", new Boolean(true));
            session.setAttribute("user", u);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("logged", new Boolean(false));
        }

        response.sendRedirect("index");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
