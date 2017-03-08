package controller;

import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = {"/cadastrar"})

public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean verify_email=false, verify_senha=false, verify;
        User u = new User();
        u.setName(request.getParameter("user"));
        u.setEmail(request.getParameter("email"));
        u.setPassword(request.getParameter("pass"));
        u.setC_Password(request.getParameter("confirm-pass"));

        if (u.checkEmail())
        {
            verify_email = true;
            request.setAttribute("verify_email", verify_email);
        } else {
            request.setAttribute("verify_email", verify_email);
        }

        if (u.getPassword().equals(u.getC_Password()))
        {
            verify_senha = true;
            request.setAttribute("verify_senha", verify_senha);
        } else {
            request.setAttribute("verify_senha", verify_senha);
        }


        verify = u.insert();


        if (verify_email==true && verify_senha==true && verify==true)
            response.sendRedirect("index.jsp");
        else {
            RequestDispatcher view = request.getRequestDispatcher("view/register.jsp");
            view.forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
