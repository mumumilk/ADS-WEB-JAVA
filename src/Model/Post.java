package Model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Post {
    private int Id;
    private String Title;
    private String Description;
    private String img_path;
    private User user;
    private int id_user;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public ArrayList<Post> getPosts(String busca){
        try {
            Connection con = Context.getConnection();
            String sql = ("select p.id, p.title, p.description, p.img_path, u.name from posts p inner join users u on (p.id_user = u.id) where upper(p.title) like (?) order by p.id DESC;");
            PreparedStatement ps = con.prepareStatement(sql);
            if(busca.isEmpty() || busca == null)
                ps.setString(1, '%' + "" + '%');
            else
                ps.setString(1, '%' + busca.toUpperCase() + '%');
            ResultSet rs = ps.executeQuery();
            ArrayList<Post> lst = new ArrayList<>();
            while(rs.next()){
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setImg_path(rs.getString("img_path"));
                lst.add(p);
            }
            return lst;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Post getPost(int ident){
        Post p = new Post();
        try {
            Connection con = Context.getConnection();
            String sql = ("select p.title, p.description, p.img_path, u.name from posts p inner join users u on (p.id_user = u.id) where p.id = (?) limit 1;");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ident);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setImg_path(rs.getString("img_path"));
                User u = new User();
                u.setName(rs.getString("name"));
                p.setUser(u);
            }
            return p;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insert() {
        try {
            Connection con = Context.getConnection();
            String sql = ("insert into posts (title, img_path, description, id_user) values (?, ?, ?, ?);");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, this.getTitle());
            ps.setString(2, this.getImg_path());
            ps.setString(3, this.getDescription());
            ps.setInt(4, 1);
            ps.execute();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public int getLastId(){
        int aux = 0;
        try {
            Connection con = Context.getConnection();
            String sql = ("select max(id) from posts;");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
                aux = rs.getInt("max");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            return 0;
        }
        return aux+1;
    }
}
