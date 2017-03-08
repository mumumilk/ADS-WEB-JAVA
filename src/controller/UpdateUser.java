package controller;

import com.sun.net.httpserver.HttpServer;

import Model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Created by Nasser Ruiz Rehman on 24/10/2016.
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/updateUser"})
public class UpdateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User u = new User();

        u.getUs(request.getParameter("email"));
        Part userFile = request.getPart("file");

        String fileName = Paths.get(userFile.getSubmittedFileName()).getFileName().toString();
        //String fileName = "Usuario" + u.getId() + oldFileName.substring(oldFileName.lastIndexOf("."));
        InputStream fileContent = userFile.getInputStream();


        String images_path = request.getServletContext().getRealPath("/content/imagem");
        File uploads = new File(images_path);
        File file = new File(uploads, fileName);


        boolean verify_senha = false;

        if (request.getParameter("pass").equals(request.getParameter("confirm-pass")))
        {
            verify_senha = true;
            request.setAttribute("verify_senha", verify_senha);
            try (InputStream input = fileContent) {
                Files.copy(input, file.toPath());
                User u2 = new User();
                u2.setName(request.getParameter("user"));
                u2.setEmail(request.getParameter("email"));
                u2.setPassword(request.getParameter("pass"));
                u2.setImgPath(fileName);
                u2.setId(u.getId());
                boolean verify = u.updateUser(u2);
                if (verify)
                {
                    u = u2.getUser(u2.getEmail(), u2.getPassword());

                    HttpSession session = request.getSession();

                    session.setAttribute("user", u);
                    response.sendRedirect("index");
                }
            }
        } else {
            verify_senha = false;
            request.setAttribute("verify_senha", verify_senha);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response){

    }
}
