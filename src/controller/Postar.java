package controller;

import Model.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.concurrent.ThreadLocalRandom;

@MultipartConfig
@WebServlet(urlPatterns = {"/postar"})
public class Postar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post = new Post();
        Part userFile = request.getPart("file");

        String oldFileName = Paths.get(userFile.getSubmittedFileName()).getFileName().toString();
        String fileName = "Arquivo" + post.getLastId() + oldFileName.substring(oldFileName.lastIndexOf("."));
        InputStream fileContent = userFile.getInputStream();

        System.out.print(fileName);
        String images_path = request.getServletContext().getRealPath("/content/imagem");
        File uploads = new File(images_path);
        File file = new File(uploads, fileName);

        Boolean verify = true;

        try (InputStream input = fileContent) {
            Files.copy(input, file.toPath());
            post.setTitle(request.getParameter("title"));
            post.setImg_path(fileName);
            post.setDescription(request.getParameter("description"));
            verify = post.insert();
            if (verify){
                response.sendRedirect("index");
            }
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
